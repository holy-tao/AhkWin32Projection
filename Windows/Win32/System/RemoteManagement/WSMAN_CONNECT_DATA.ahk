#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WSMAN_DATA.ahk
#Include .\WSManDataType.ahk
#Include .\WSMAN_DATA_TEXT.ahk
#Include .\WSMAN_DATA_BINARY.ahk

/**
 * @namespace Windows.Win32.System.RemoteManagement
 */
class WSMAN_CONNECT_DATA extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {WSMAN_DATA}
     */
    data {
        get {
            if(!this.HasProp("__data"))
                this.__data := WSMAN_DATA(0, this)
            return this.__data
        }
    }
}
