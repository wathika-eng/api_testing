public class CarsAssemble {

    public double productionRatePerHour(int speed) {
        double baseRate = speed * 221;

        return switch (speed) {
            case 1, 2, 3, 4 -> baseRate;
            case 5, 6, 7, 8 -> baseRate * 0.9;
            case 9 -> baseRate * 0.8;
            case 10 -> baseRate * 0.77;
            default -> 0;
        };
    }

    public int workingItemsPerMinute(int speed) {
        return (int) (productionRatePerHour(speed) / 60);
    }
}
