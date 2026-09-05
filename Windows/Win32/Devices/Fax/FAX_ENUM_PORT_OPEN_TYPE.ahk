#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Fax
 */
class FAX_ENUM_PORT_OPEN_TYPE extends Win32Enum {

    /**
     * Native name: PORT_OPEN_QUERY
     * @type {Integer (Int32)}
     */
    static QUERY => 1

    /**
     * Native name: PORT_OPEN_MODIFY
     * @type {Integer (Int32)}
     */
    static MODIFY => 2
}
