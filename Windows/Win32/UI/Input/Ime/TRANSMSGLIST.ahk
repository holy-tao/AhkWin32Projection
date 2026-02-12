#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\WPARAM.ahk
#Include ..\..\..\Foundation\LPARAM.ahk
#Include .\TRANSMSG.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class TRANSMSGLIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    uMsgCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<TRANSMSG>}
     */
    TransMsg{
        get {
            if(!this.HasProp("__TransMsgProxyArray"))
                this.__TransMsgProxyArray := Win32FixedArray(this.ptr + 8, 1, TRANSMSG, "")
            return this.__TransMsgProxyArray
        }
    }
}
