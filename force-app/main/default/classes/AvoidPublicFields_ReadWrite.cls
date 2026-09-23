/**
 * PF-03  sf:AvoidPublicFields
 * Callers read and write this field. Expected fix: private backing field + public property.
 */
public class AvoidPublicFields_ReadWrite {
    private String statusValue = 'New';
    public String status { get { return statusValue; } set { statusValue = value; } }

    public Boolean isClosed() {
        return status == 'Closed';
    }
}

