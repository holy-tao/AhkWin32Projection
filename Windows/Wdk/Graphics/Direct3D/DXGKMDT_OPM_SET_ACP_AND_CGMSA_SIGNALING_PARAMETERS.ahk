#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGKMDT_OPM_SET_ACP_AND_CGMSA_SIGNALING_PARAMETERS extends Win32Struct
{
    static sizeof => 64

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ulNewTVProtectionStandard {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulAspectRatioChangeMask1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ulAspectRatioData1 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ulAspectRatioChangeMask2 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    ulAspectRatioData2 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ulAspectRatioChangeMask3 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    ulAspectRatioData3 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<UInt32>}
     */
    ulReserved{
        get {
            if(!this.HasProp("__ulReservedProxyArray"))
                this.__ulReservedProxyArray := Win32FixedArray(this.ptr + 28, 4, Primitive, "uint")
            return this.__ulReservedProxyArray
        }
    }

    /**
     * @type {Array<UInt32>}
     */
    ulReserved2{
        get {
            if(!this.HasProp("__ulReserved2ProxyArray"))
                this.__ulReserved2ProxyArray := Win32FixedArray(this.ptr + 44, 4, Primitive, "uint")
            return this.__ulReserved2ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ulReserved3 {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }
}
