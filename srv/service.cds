using { flexso.htf as datamodel } from '../db/schema';

service SpaceService {
    @readonly
    entity KnownStarTypes            as projection on datamodel.StarTypes;

    @readonly
    entity KnownPlanetTypes          as projection on datamodel.PlanetTypes;

    @readonly
    entity KnownHabitableZones       as projection on datamodel.HabitableZones;

    @readonly
    entity KnownGalaxies             as projection on datamodel.Galaxies;

    @readonly
    entity CompabilityScores       as projection on datamodel.CompabilityScores;

    @readonly
    entity KnownAlienTypes           as projection on datamodel.AlienTypes;

    @readonly
    entity KnownAlienStatus          as projection on datamodel.AlienStatus;

    @readonly
    entity ContactedAlienCivilisations as projection on datamodel.AlienCivilisations;
}