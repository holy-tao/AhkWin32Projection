#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class msidbLocatorType extends Win32Enum {

    /**
     * Native name: msidbLocatorTypeDirectory
     * @type {Integer (Int32)}
     */
    static Directory => 0

    /**
     * Native name: msidbLocatorTypeFileName
     * @type {Integer (Int32)}
     */
    static FileName => 1

    /**
     * Native name: msidbLocatorTypeRawValue
     * @type {Integer (Int32)}
     */
    static RawValue => 2

    /**
     * Native name: msidbLocatorType64bit
     * @type {Integer (Int32)}
     */
    static Type64bit => 16
}
