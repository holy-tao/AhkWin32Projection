#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_CONNECTION_NAME extends Win32Struct
{
    static sizeof => 130

    static packingSize => 2

    /**
     * @type {String}
     */
    wszName {
        get => StrGet(this.ptr + 0, 64, "UTF-16")
        set => StrPut(value, this.ptr + 0, 64, "UTF-16")
    }
}
