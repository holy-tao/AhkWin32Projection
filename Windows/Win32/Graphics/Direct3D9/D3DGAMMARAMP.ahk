#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DGAMMARAMP extends Win32Struct
{
    static sizeof => 1536

    static packingSize => 2

    /**
     * @type {Array<UInt16>}
     */
    red{
        get {
            if(!this.HasProp("__redProxyArray"))
                this.__redProxyArray := Win32FixedArray(this.ptr + 0, 256, Primitive, "ushort")
            return this.__redProxyArray
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    green{
        get {
            if(!this.HasProp("__greenProxyArray"))
                this.__greenProxyArray := Win32FixedArray(this.ptr + 512, 256, Primitive, "ushort")
            return this.__greenProxyArray
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    blue{
        get {
            if(!this.HasProp("__blueProxyArray"))
                this.__blueProxyArray := Win32FixedArray(this.ptr + 1024, 256, Primitive, "ushort")
            return this.__blueProxyArray
        }
    }
}
