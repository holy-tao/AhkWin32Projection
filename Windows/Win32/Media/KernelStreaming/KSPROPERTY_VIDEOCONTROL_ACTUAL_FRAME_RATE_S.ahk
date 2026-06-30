#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSIDENTIFIER.ahk
#Include ..\..\Foundation\SIZE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_VIDEOCONTROL_ACTUAL_FRAME_RATE_S extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Property {
        get {
            if(!this.HasProp("__Property"))
                this.__Property := KSIDENTIFIER(0, this)
            return this.__Property
        }
    }

    /**
     * @type {Integer}
     */
    StreamIndex {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    RangeIndex {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {SIZE}
     */
    Dimensions {
        get {
            if(!this.HasProp("__Dimensions"))
                this.__Dimensions := SIZE(32, this)
            return this.__Dimensions
        }
    }

    /**
     * @type {Integer}
     */
    CurrentActualFrameRate {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    CurrentMaxAvailableFrameRate {
        get => NumGet(this, 48, "int64")
        set => NumPut("int64", value, this, 48)
    }
}
