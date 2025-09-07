#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class SOFTKBDDATA extends Win32Struct
{
    static sizeof => 516

    static packingSize => 4

    /**
     * @type {Integer}
     */
    uCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<UInt16>}
     */
    wCode{
        get {
            if(!this.HasProp("__wCodeProxyArray"))
                this.__wCodeProxyArray := Win32FixedArray(this.ptr + 4, 2, Primitive, "ushort")
            return this.__wCodeProxyArray
        }
    }
}
