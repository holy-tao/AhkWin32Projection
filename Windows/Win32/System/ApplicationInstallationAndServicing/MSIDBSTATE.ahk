#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class MSIDBSTATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBSTATE_ERROR => -1

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBSTATE_READ => 0

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBSTATE_WRITE => 1
}
