export class DrakeFormula {
    static calculateDrakeValue(numberOfSolarSystems: number, averagePlanetsPerSolar: number, starSurvivalNumber : number, habitableZoneNumber: number): number {
      const totalPlanets = numberOfSolarSystems * averagePlanetsPerSolar;
      totalPlanets > 1e11 ? 1 : 0.66;
      return totalPlanets * starSurvivalNumber * habitableZoneNumber;
    }
  }