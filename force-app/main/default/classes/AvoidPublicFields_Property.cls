/**
 * PF-07  sf:AvoidPublicFields  (negative case)
 * Already properties with accessors. Expected: no issue raised.
 */
public class AvoidPublicFields_Property {
    public String title { get; set; }
    public Integer sequence { get; private set; }
}
