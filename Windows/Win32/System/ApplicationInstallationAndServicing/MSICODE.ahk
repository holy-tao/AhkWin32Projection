#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class MSICODE extends Win32Enum {

    /**
     * Native name: MSICODE_PRODUCT
     * @type {Integer (Int32)}
     */
    static PRODUCT => 0

    /**
     * Native name: MSICODE_PATCH
     * @type {Integer (Int32)}
     */
    static PATCH => 1073741824
}
