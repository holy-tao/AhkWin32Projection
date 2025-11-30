#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBPARAMIOENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBPARAMIO_NOTPARAM => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBPARAMIO_INPUT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPARAMIO_OUTPUT => 2
}
