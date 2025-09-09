#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class BACKLIGHT_REDUCTION_GAMMA_RAMP extends Win32Struct
{
    static sizeof => 1536

    static packingSize => 2

    /**
     * @type {Array<UInt16>}
     */
    R{
        get {
            if(!this.HasProp("__RProxyArray"))
                this.__RProxyArray := Win32FixedArray(this.ptr + 0, 256, Primitive, "ushort")
            return this.__RProxyArray
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    G{
        get {
            if(!this.HasProp("__GProxyArray"))
                this.__GProxyArray := Win32FixedArray(this.ptr + 512, 256, Primitive, "ushort")
            return this.__GProxyArray
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    B{
        get {
            if(!this.HasProp("__BProxyArray"))
                this.__BProxyArray := Win32FixedArray(this.ptr + 1024, 256, Primitive, "ushort")
            return this.__BProxyArray
        }
    }
}
