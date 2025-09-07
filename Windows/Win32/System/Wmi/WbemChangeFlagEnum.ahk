#Requires AutoHotkey v2.0.0 64-bit

/**
 * Define how a write operation to a class or an instance is carried out.
 * @see https://learn.microsoft.com/windows/win32/api/wbemdisp/ne-wbemdisp-wbemchangeflagenum
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WbemChangeFlagEnum{

    /**
     * Causes the class or instance to be created, if it does not exist, or overwritten if it already exists.
     * @type {Integer (Int32)}
     */
    static wbemChangeFlagCreateOrUpdate => 0

    /**
     * Causes the call to update. The class or instance must exist for the call to be successful.
     * @type {Integer (Int32)}
     */
    static wbemChangeFlagUpdateOnly => 1

    /**
     * Used for creation only. The call will fail if the class or instance already exists.
     * @type {Integer (Int32)}
     */
    static wbemChangeFlagCreateOnly => 2

    /**
     * Allows a class to be updated if there are no derived classes and there are no instances for that class. It also allows updates in all cases if the change is just to non-important qualifiers (for example, the <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/standard-qualifiers">Description</a> qualifier). If the class has instances, the update fails. This flag is used for compatibility with previous versions of WMI.
     * @type {Integer (Int32)}
     */
    static wbemChangeFlagUpdateCompatible => 0

    /**
     * Allows updates of classes even if there are child classes as long as the change does not cause any conflicts with child classes. An example of an update this flag would allow would be to add a new property to the base class not previously mentioned in any of the child classes. If the class has instances, the update fails.
     * @type {Integer (Int32)}
     */
    static wbemChangeFlagUpdateSafeMode => 32

    /**
     * Forces updates of classes when conflicting child classes exist.
 * 
 * An example of an update this flag forces would be if a class qualifier was defined in a child class, and the base class tried to add the same qualifier in conflict with the existing one. In the force mode, this conflict is resolved by deleting the qualifier in the child class. If the class has instances, the update fails.
 * 
 * Using the force mode to update a static class results in deletion of all instances of that class. Force update on provider classes does not delete instances of the class.
     * @type {Integer (Int32)}
     */
    static wbemChangeFlagUpdateForceMode => 64

    /**
     * <b>:  </b>Notifies the operating system to return a failure on put operations to any invalid system instances. Examples of such instances are event-related instances, such as filters, bindings, or providers. By default, if these instances are invalid, the put operation reports success but an error is reported in the log.
     * @type {Integer (Int32)}
     */
    static wbemChangeFlagStrongValidation => 128

    /**
     * 
     * @type {Integer (Int32)}
     */
    static wbemChangeFlagAdvisory => 65536
}
