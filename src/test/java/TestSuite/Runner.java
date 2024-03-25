package TestSuite;
import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class Runner {
    @Test
    public Karate runPet(){
        return Karate.run("Pet/pet").relativeTo((getClass()));
    }
    @Test
    public Karate runStore(){
        return Karate.run("Store/store").relativeTo((getClass()));
    }
    @Test
    public Karate runUser(){
        return Karate.run("User/newUser","User/user").relativeTo(getClass());
    }

}