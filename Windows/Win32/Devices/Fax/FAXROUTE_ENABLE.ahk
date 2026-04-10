#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Fax
 */
class FAXROUTE_ENABLE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_STATUS => -1

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DISABLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ENABLE => 1
}
