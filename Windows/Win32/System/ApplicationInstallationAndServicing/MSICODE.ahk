#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class MSICODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MSICODE_PRODUCT => 0

    /**
     * @type {Integer (Int32)}
     */
    static MSICODE_PATCH => 1073741824
}
