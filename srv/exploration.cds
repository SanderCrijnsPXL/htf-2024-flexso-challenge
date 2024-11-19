using {flexso.htf as datamodel} from '../db/schema';

service ExplorationService {
    @readonly
    entity KnownGalaxies               as
        projection on DetailedGalaxiesView {
            key ID,
                name,
                distance,
                numberOfSolarSystems,
                averagePlanetsPerSolar,
                explorationReport,
                mostCommonStarType,
                mostCommonPlanetType,
                mostLikelyAlienType,
                numberOfPlanets,
                baseDrakeScore * habitableZoneFactor * planetAlienCompatability * 100 as drakeEquation : Double,
                AlienCivilisations    : Association to ContactedAlienCivilisations on AlienCivilisations.homeGalaxy.ID = $self.ID
        }

    @readonly
    entity ContactedAlienCivilisations as projection on datamodel.AlienCivilisations;

    @readonly
    entity KnownPlanetTypes            as projection on datamodel.PlanetTypes;

    @readonly
    entity KnownStarTypes              as projection on datamodel.StarTypes;

    @readonly
    entity KnownAlienTypes             as projection on datamodel.AlienTypes;

    @readonly
    entity KnownAlienStatus            as projection on datamodel.AlienStatus;

    @readonly
    entity CompabilityScores           as projection on datamodel.CompabilityScores;

    @readonly
    entity KnownHabitableZones       as projection on datamodel.HabitableZones;

    action sendCommunicationRequest(galaxy_ID : String) returns String;
}

define view DetailedGalaxiesView 
    as select from datamodel.Galaxies as Galaxies 
    join datamodel.HabitableZones as HabitableZones on HabitableZones.starType.ID = Galaxies.mostCommonStarType.ID 
    join datamodel.CompabilityScores as CompabilityScores on CompabilityScores.planetType.ID = Galaxies.mostCommonPlanetType.ID and CompabilityScores.alienType.ID = Galaxies.mostLikelyAlienType.ID {
        key ID,
            name,
            distance,
            numberOfSolarSystems,
            averagePlanetsPerSolar,
            numberOfSolarSystems * averagePlanetsPerSolar as numberOfPlanets : Double,
            case
                when $self.numberOfPlanets > 100000000000  THEN 1
                else 0.66
            end as baseDrakeScore : Integer,
            explorationReport,
            mostCommonStarType,
            mostCommonPlanetType,
            mostLikelyAlienType,                   
            HabitableZones.percentage as habitableZoneFactor : datamodel.Percentage,
            CompabilityScores.percentage as planetAlienCompatability : datamodel.Percentage
    };