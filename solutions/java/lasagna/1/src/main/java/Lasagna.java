public class Lasagna {

    // TODO: define the 'expectedMinutesInOven()' method
    public int expectedMinutesInOven() {
        return 40;
    }

    // TODO: define the 'remainingMinutesInOven()' method
    public int remainingMinutesInOven(int timeSpent) {
        return 40 - timeSpent;
    }

    // TODO: define the 'preparationTimeInMinutes()' method
    public int preparationTimeInMinutes(int layersAdded) {
        return layersAdded * 2;
    }

    // TODO: define the 'totalTimeInMinutes()' method
    public int totalTimeInMinutes(int layersAdded, int mins) {
        return (preparationTimeInMinutes(layersAdded)) + mins;
    }
}
