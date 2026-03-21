public class SalaryCalculator {

    public double salaryMultiplier(int daysSkipped) {
        return daysSkipped >= 5 ? 0.85 : 1.0;
    }

    public int bonusMultiplier(int productsSold) {
        return productsSold >= 20 ? 13 : 10;
    }

    public double bonusForProductsSold(int productsSold) {
        return bonusMultiplier(productsSold) > 1
            ? (bonusMultiplier(productsSold) * productsSold)
            : productsSold * 10;
    }

    public double finalSalary(int daysSkipped, int productsSold) {
        final int BASE_SALARY = 1_000;
        double finSalary =
            (salaryMultiplier(daysSkipped) * 1000) +
            bonusForProductsSold(productsSold);
        return finSalary > 2000.00 ? 2000.00 : finSalary;
    }
}
