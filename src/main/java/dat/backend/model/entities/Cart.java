package dat.backend.model.entities;

import java.util.ArrayList;
import java.util.List;

public class Cart
{
    private List<Cupcake> cupcakeList = new ArrayList<>();


    public Cart()
    {

    }

    public void add(Cupcake cupcake)
    {
        cupcakeList.add(cupcake);
    }

    public double price(Cupcake cupcake)
    {
        return cupcake.getTotalPrice();
    }

    public int getNumberOfCupcakes()
    {
        return cupcakeList.size();
    }

    public List<Cupcake> getCupcakeList()
    {
        return cupcakeList;
    }

    public void resetCart()
    {
       cupcakeList.clear();
    }
}
