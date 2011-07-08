package PayOnTime;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManagerFactory;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 04.07.11
 * Time: 21:27
 * To change this template use File | Settings | File Templates.
 */
public final class PMF {
    private static final PersistenceManagerFactory pmfInstance =
        JDOHelper.getPersistenceManagerFactory("transactions-optional");

    private PMF() {}

    public static PersistenceManagerFactory get() {
        return pmfInstance;
    }
}
