#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class msidbLocatorType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static msidbLocatorTypeDirectory => 0

    /**
     * @type {Integer (Int32)}
     */
    static msidbLocatorTypeFileName => 1

    /**
     * @type {Integer (Int32)}
     */
    static msidbLocatorTypeRawValue => 2

    /**
     * @type {Integer (Int32)}
     */
    static msidbLocatorType64bit => 16
}
