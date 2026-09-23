/**
 * PF-03  sf:AvoidPublicFields
 * Callers read and write this field. Expected fix: private backing field + public property.
 */
public class AvoidPublicFields_ReadWrite {
    public String status = 'New';

    public Boolean isClosed() {
        return status == 'Closed';
    }
}
