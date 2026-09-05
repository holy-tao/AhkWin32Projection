#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
class RASAPIVERSION extends Win32Enum {

    /**
     * Native name: RASAPIVERSION_500
     * @type {Integer (Int32)}
     */
    static 500 => 1

    /**
     * Native name: RASAPIVERSION_501
     * @type {Integer (Int32)}
     */
    static 501 => 2

    /**
     * Native name: RASAPIVERSION_600
     * @type {Integer (Int32)}
     */
    static 600 => 3

    /**
     * Native name: RASAPIVERSION_601
     * @type {Integer (Int32)}
     */
    static 601 => 4
}
