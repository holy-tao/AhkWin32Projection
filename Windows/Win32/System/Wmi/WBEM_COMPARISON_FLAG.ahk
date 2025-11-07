#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains flags that define the comparison to perform when using the IWbemClassObject::CompareTo method.
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/ne-wbemcli-wbem_comparison_flag
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WBEM_COMPARISON_FLAG{

    /**
     * Compare all features.
     * @type {Integer (Int32)}
     */
    static WBEM_COMPARISON_INCLUDE_ALL => 0

    /**
     * Ignore all qualifiers (including <b>Key</b> and <b>Dynamic</b>) in comparison.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_IGNORE_QUALIFIERS => 1

    /**
     * Ignore the source of the objects, namely the server and the namespace they came from, in comparison to other objects.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_IGNORE_OBJECT_SOURCE => 2

    /**
     * Ignore default values of properties. This flag is only meaningful when comparing classes.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_IGNORE_DEFAULT_VALUES => 4

    /**
     * Assume that the objects being compared are instances of the same class. Consequently, this flag compares instance-related information only. Use this flag to optimize performance. If the objects are not of the same class, the results are undefined.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_IGNORE_CLASS => 8

    /**
     * Compare string values in a case-insensitive manner. This applies both to strings and to qualifier values. Property and qualifier names are always compared in a case-insensitive manner whether this flag is specified or not.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_IGNORE_CASE => 16

    /**
     * Ignore qualifier flavors. This flag still takes qualifier values into account, but ignores flavor distinctions such as propagation rules and override restrictions (for more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/qualifier-flavors">Qualifier Flavors</a>).
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_IGNORE_FLAVOR => 32
}
