public class CarsAssemble {

    public double productionRatePerHour(int speed) {
        if (speed == 0) {
            return 0.00;
        } else {
            return (double) (speed * 221) * 0.9;
        }
    }

    public int workingItemsPerMinute(int speed) {
        if (speed == 0) {
            return 0;
        } else {
            return (int) (221 / 60) * (speed);
        }
    }
}
