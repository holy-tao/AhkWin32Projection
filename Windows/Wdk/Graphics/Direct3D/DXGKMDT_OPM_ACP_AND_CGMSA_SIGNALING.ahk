#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGKMDT_OPM_ACP_AND_CGMSA_SIGNALING extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Pointer<DXGKMDT_OPM_RANDOM_NUMBER>}
     */
    rnRandomNumber {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulStatusFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ulAvailableTVProtectionStandards {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    ulActiveTVProtectionStandard {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ulReserved {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    ulAspectRatioValidMask1 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    ulAspectRatioData1 {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    ulAspectRatioValidMask2 {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ulAspectRatioData2 {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    ulAspectRatioValidMask3 {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    ulAspectRatioData3 {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Array<UInt32>}
     */
    ulReserved2{
        get {
            if(!this.HasProp("__ulReserved2ProxyArray"))
                this.__ulReserved2ProxyArray := Win32FixedArray(this.ptr + 48, 4, Primitive, "uint")
            return this.__ulReserved2ProxyArray
        }
    }

    /**
     * @type {Array<UInt32>}
     */
    ulReserved3{
        get {
            if(!this.HasProp("__ulReserved3ProxyArray"))
                this.__ulReserved3ProxyArray := Win32FixedArray(this.ptr + 64, 4, Primitive, "uint")
            return this.__ulReserved3ProxyArray
        }
    }
}
