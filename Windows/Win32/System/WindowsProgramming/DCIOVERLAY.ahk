#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DCISURFACEINFO.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class DCIOVERLAY extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {DCISURFACEINFO}
     */
    dciInfo{
        get {
            if(!this.HasProp("__dciInfo"))
                this.__dciInfo := DCISURFACEINFO(this.ptr + 0)
            return this.__dciInfo
        }
    }

    /**
     * @type {Integer}
     */
    dwChromakeyValue {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    dwChromakeyMask {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }
}
