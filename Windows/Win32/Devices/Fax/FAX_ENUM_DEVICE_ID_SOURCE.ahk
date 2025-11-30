#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_ENUM_DEVICE_ID_SOURCE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DEV_ID_SRC_FAX => 0

    /**
     * @type {Integer (Int32)}
     */
    static DEV_ID_SRC_TAPI => 1
}
