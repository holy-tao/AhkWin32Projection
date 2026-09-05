#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class msidbSumInfoSourceType extends Win32Enum {

    /**
     * Native name: msidbSumInfoSourceTypeSFN
     * @type {Integer (Int32)}
     */
    static TypeSFN => 1

    /**
     * Native name: msidbSumInfoSourceTypeCompressed
     * @type {Integer (Int32)}
     */
    static Compressed => 2

    /**
     * Native name: msidbSumInfoSourceTypeAdminImage
     * @type {Integer (Int32)}
     */
    static AdminImage => 4

    /**
     * Native name: msidbSumInfoSourceTypeLUAPackage
     * @type {Integer (Int32)}
     */
    static TypeLUAPackage => 8
}
