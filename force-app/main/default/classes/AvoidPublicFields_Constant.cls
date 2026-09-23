/**
 * PF-05  sf:AvoidPublicFields  (negative case)
 * public static final constants. Expected: no issue raised.
 */
public class AvoidPublicFields_Constant {
    public static final String DEFAULT_REGION = 'APAC';
    public static final Integer MAX_ROWS = 200;
}
