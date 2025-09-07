#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WSMAN_DATA_TEXT.ahk
#Include .\WSMAN_DATA_BINARY.ahk
#Include .\WSMAN_DATA.ahk

/**
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_CONNECT_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {WSMAN_DATA}
     */
    data{
        get {
            if(!this.HasProp("__data"))
                this.__data := WSMAN_DATA(this.ptr + 0)
            return this.__data
        }
    }
}
