#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RASAPIVERSION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RASAPIVERSION_500 => 1

    /**
     * @type {Integer (Int32)}
     */
    static RASAPIVERSION_501 => 2

    /**
     * @type {Integer (Int32)}
     */
    static RASAPIVERSION_600 => 3

    /**
     * @type {Integer (Int32)}
     */
    static RASAPIVERSION_601 => 4
}
