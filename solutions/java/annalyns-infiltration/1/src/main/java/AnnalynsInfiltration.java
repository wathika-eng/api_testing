class AnnalynsInfiltration {

    public static boolean canFastAttack(boolean knightIsAwake) {
        return knightIsAwake ? false : true;
    }

    public static boolean canSpy(
        boolean knightIsAwake,
        boolean archerIsAwake,
        boolean prisonerIsAwake
    ) {
        if (
            (!knightIsAwake && !prisonerIsAwake && archerIsAwake) ||
            prisonerIsAwake ||
            knightIsAwake
        ) {
            return true;
        } else {
            return false;
        }
    }

    public static boolean canSignalPrisoner(
        boolean archerIsAwake,
        boolean prisonerIsAwake
    ) {
        return !archerIsAwake && prisonerIsAwake ? true : false;
    }

    public static boolean canFreePrisoner(
        boolean knightIsAwake,
        boolean archerIsAwake,
        boolean prisonerIsAwake,
        boolean petDogIsPresent
    ) {
        if (petDogIsPresent && !archerIsAwake) {
            return true;
        } else if (
            !petDogIsPresent &&
            prisonerIsAwake &&
            !archerIsAwake &&
            !knightIsAwake
        ) {
            return true;
        } else {
            return false;
        }
    }
}
