package dat.backend.model.entities;

public class Cupcake
{
    private Top topId;
    private Bottom bottomId;
    private int quantity;

    public Cupcake(Top top, Bottom bottom, int quantity) {
        this.topId = top;
        this.bottomId = bottom;
        this.quantity = quantity;
    }

    public Top getTopId() {
        return topId;
    }

    public Bottom getBottomId() {
        return bottomId;
    }

    public int getQuantity() {
        return quantity;
    }

    @Override
    public String toString() {
        return "Cupcake{" +
                "top=" + topId +
                ", bottom=" + bottomId +
                ", quantity=" + quantity +
                '}';
    }
}
