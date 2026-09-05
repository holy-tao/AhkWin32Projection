#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Define the settings for object comparison and are used by SWbemObject.CompareTo_.
 * @see https://learn.microsoft.com/windows/win32/api/wbemdisp/ne-wbemdisp-wbemcomparisonflagenum
 * @namespace Windows.Win32.System.Wmi
 */
class WbemComparisonFlagEnum extends Win32Enum {

    /**
     * Used to compare all properties, qualifiers, and flavors.
     * Native name: wbemComparisonFlagIncludeAll
     * @type {Integer (Int32)}
     */
    static IncludeAll => 0

    /**
     * Ignores all qualifiers (including <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/key-qualifier">Key</a> and <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/standard-wmi-qualifiers">Dynamic</a>) in comparison.
     * Native name: wbemComparisonFlagIgnoreQualifiers
     * @type {Integer (Int32)}
     */
    static IgnoreQualifiers => 1

    /**
     * Ignores the source of the objects, namely the server and the namespace they came from, in comparison to other objects.
     * Native name: wbemComparisonFlagIgnoreObjectSource
     * @type {Integer (Int32)}
     */
    static IgnoreObjectSource => 2

    /**
     * Ignores default values of properties (only meaningful when comparing classes).
     * Native name: wbemComparisonFlagIgnoreDefaultValues
     * @type {Integer (Int32)}
     */
    static IgnoreDefaultValues => 4

    /**
     * Instructs the system to assume that the objects being compared are instances of the same class. Consequently, this constant compares instance-related information only. Use to optimize performance. If the objects are not of the same class, the results will be undefined.
     * Native name: wbemComparisonFlagIgnoreClass
     * @type {Integer (Int32)}
     */
    static IgnoreClass => 8

    /**
     * Compares string values in a case-insensitive manner. This applies both to strings and to qualifier values. Property and qualifier names are always compared in a case-insensitive manner whether this constant is specified or not.
     * Native name: wbemComparisonFlagIgnoreCase
     * @type {Integer (Int32)}
     */
    static IgnoreCase => 16

    /**
     * Ignore qualifier flavors. This constant still takes qualifier values into account, but ignores flavor distinctions such as propagation rules and override restrictions.
     * Native name: wbemComparisonFlagIgnoreFlavor
     * @type {Integer (Int32)}
     */
    static IgnoreFlavor => 32
}
