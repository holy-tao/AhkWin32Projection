#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class VIDEO_LUT_RGB256WORDS extends Win32Struct
{
    static sizeof => 1536

    static packingSize => 2

    /**
     * @type {Array<UInt16>}
     */
    Red{
        get {
            if(!this.HasProp("__RedProxyArray"))
                this.__RedProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "ushort")
            return this.__RedProxyArray
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    Green{
        get {
            if(!this.HasProp("__GreenProxyArray"))
                this.__GreenProxyArray := Win32FixedArray(this.ptr + 512, 2, Primitive, "ushort")
            return this.__GreenProxyArray
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    Blue{
        get {
            if(!this.HasProp("__BlueProxyArray"))
                this.__BlueProxyArray := Win32FixedArray(this.ptr + 1024, 2, Primitive, "ushort")
            return this.__BlueProxyArray
        }
    }
}
