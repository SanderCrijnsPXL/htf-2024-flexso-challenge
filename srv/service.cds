using { flexso.htf as datamodel } from '../db/schema';

service SpaceService {
    @readonly
    entity KnownStarTypes            as projection on datamodel.StarTypes;

    @readonly
    entity KnownPlanetTypes          as projection on datamodel.PlanetTypes;

    

    @readonly
    entity KnownGalaxies             as projection on datamodel.Galaxies;

    

    @readonly
    entity KnownAlienTypes           as projection on datamodel.AlienTypes;

    @readonly
    entity KnownAlienStatus          as projection on datamodel.AlienStatus;

   

    action calculateDrakeValue(galaxyId:UUID) returns Decimal(18, 4);
}