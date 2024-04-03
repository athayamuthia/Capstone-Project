package TestSuite;
import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class Runner {
    @Test
    public Karate runMealPlan(){
//        return Karate.run("MealPlan/mealPlan","Mealplan/shopping").relativeTo((getClass()));
        return Karate.run("Mealplan/shopping").relativeTo((getClass()));
    }
    @Test
    public Karate runMisc(){
        return Karate.run("Misc/misc").relativeTo((getClass()));
    }

    @Test
    public Karate runRecipes(){
        return Karate.run("Recipes/recipes").relativeTo((getClass()));
    }
}