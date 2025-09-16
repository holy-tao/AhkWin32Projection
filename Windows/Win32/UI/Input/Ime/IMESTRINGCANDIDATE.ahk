#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IMESTRINGCANDIDATE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    uCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<PWSTR>}
     */
    lpwstr{
        get {
            if(!this.HasProp("__lpwstrProxyArray"))
                this.__lpwstrProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__lpwstrProxyArray
        }
    }
}
