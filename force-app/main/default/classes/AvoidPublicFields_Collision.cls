/**
 * PF-04  sf:AvoidPublicFields  (accessor collision probe)
 * A property named "name" would clash with the existing getName().
 * Expected fix: does not create a colliding member; the class still compiles.
 */
public class AvoidPublicFields_Collision {
    public String name;

    public String getName() {
        return name == null ? 'Unknown' : name;
    }
}
