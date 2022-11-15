package dat.backend.model.entities;

public class Cupcake
{
    private Top top;
    private Bottom bottom;
    private int quantity;
    private int totalPrice;

    public Cupcake(Top top, Bottom bottom, int quantity) {
        this.top = top;
        this.bottom = bottom;
        this.quantity = quantity;
    }

    public Top getTopId() {
        return top;
    }

    public Bottom getBottomId() {
        return bottom;
    }

    public int getQuantity() {
        return quantity;
    }

    @Override
    public String toString() {
        return "Cupcake{" +
                "top=" + top +
                ", bottom=" + bottom +
                ", quantity=" + quantity +
                '}';
    }
}
