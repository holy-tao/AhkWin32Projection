#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk
#Include ..\..\Foundation\SIZE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_VIDEOCONTROL_ACTUAL_FRAME_RATE_S extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Property{
        get {
            if(!this.HasProp("__Property"))
                this.__Property := KSIDENTIFIER(this.ptr + 0)
            return this.__Property
        }
    }

    /**
     * @type {Integer}
     */
    StreamIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    RangeIndex {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {SIZE}
     */
    Dimensions{
        get {
            if(!this.HasProp("__Dimensions"))
                this.__Dimensions := SIZE(this.ptr + 16)
            return this.__Dimensions
        }
    }

    /**
     * @type {Integer}
     */
    CurrentActualFrameRate {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    CurrentMaxAvailableFrameRate {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }
}
