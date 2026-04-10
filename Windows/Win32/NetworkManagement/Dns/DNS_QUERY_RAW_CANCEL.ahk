#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
class DNS_QUERY_RAW_CANCEL extends Win32Struct {
    static sizeof => 32

    static packingSize => 2

    /**
     * @type {String}
     */
    reserved {
        get => StrGet(this.ptr + 0, 31, "UTF-8")
        set => StrPut(value, this.ptr + 0, 31, "UTF-8")
    }
}
