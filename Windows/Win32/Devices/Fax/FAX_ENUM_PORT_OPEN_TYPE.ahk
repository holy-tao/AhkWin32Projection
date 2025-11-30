#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_ENUM_PORT_OPEN_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PORT_OPEN_QUERY => 1

    /**
     * @type {Integer (Int32)}
     */
    static PORT_OPEN_MODIFY => 2
}
