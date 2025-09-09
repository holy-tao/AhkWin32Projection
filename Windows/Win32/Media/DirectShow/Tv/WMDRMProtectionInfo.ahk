#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class WMDRMProtectionInfo extends Win32Struct
{
    static sizeof => 67

    static packingSize => 1

    /**
     * @type {Array<UInt16>}
     */
    wszKID{
        get {
            if(!this.HasProp("__wszKIDProxyArray"))
                this.__wszKIDProxyArray := Win32FixedArray(this.ptr + 0, 25, Primitive, "ushort")
            return this.__wszKIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    qwCounter {
        get => NumGet(this, 50, "uint")
        set => NumPut("uint", value, this, 50)
    }

    /**
     * @type {Integer}
     */
    qwIndex {
        get => NumGet(this, 58, "uint")
        set => NumPut("uint", value, this, 58)
    }

    /**
     * @type {Integer}
     */
    bOffset {
        get => NumGet(this, 66, "char")
        set => NumPut("char", value, this, 66)
    }
}
