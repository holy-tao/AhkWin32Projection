#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DDDI_HDR_METADATA_HDR10 extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {Array<UInt16>}
     */
    RedPrimary{
        get {
            if(!this.HasProp("__RedPrimaryProxyArray"))
                this.__RedPrimaryProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "ushort")
            return this.__RedPrimaryProxyArray
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    GreenPrimary{
        get {
            if(!this.HasProp("__GreenPrimaryProxyArray"))
                this.__GreenPrimaryProxyArray := Win32FixedArray(this.ptr + 4, 2, Primitive, "ushort")
            return this.__GreenPrimaryProxyArray
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    BluePrimary{
        get {
            if(!this.HasProp("__BluePrimaryProxyArray"))
                this.__BluePrimaryProxyArray := Win32FixedArray(this.ptr + 8, 2, Primitive, "ushort")
            return this.__BluePrimaryProxyArray
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    WhitePoint{
        get {
            if(!this.HasProp("__WhitePointProxyArray"))
                this.__WhitePointProxyArray := Win32FixedArray(this.ptr + 12, 2, Primitive, "ushort")
            return this.__WhitePointProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    MaxMasteringLuminance {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    MinMasteringLuminance {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    MaxContentLightLevel {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    MaxFrameAverageLightLevel {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }
}
