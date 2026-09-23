/**
 * PF-02  sf:AvoidPublicFields
 * Written only inside the class. Expected fix: public Integer recordCount { get; private set; }
 */
public class AvoidPublicFields_ReadOnly {
    public Integer recordCount { get; set; }

    public void load() {
        recordCount = [SELECT COUNT() FROM Account];
    }
}

