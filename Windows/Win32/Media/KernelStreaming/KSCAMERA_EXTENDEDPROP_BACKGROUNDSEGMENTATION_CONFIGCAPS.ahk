#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SIZE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSCAMERA_EXTENDEDPROP_BACKGROUNDSEGMENTATION_CONFIGCAPS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {SIZE}
     */
    Resolution{
        get {
            if(!this.HasProp("__Resolution"))
                this.__Resolution := SIZE(this.ptr + 0)
            return this.__Resolution
        }
    }

    /**
     * @type {Integer}
     */
    Numerator {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Denominator {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {SIZE}
     */
    MaskResolution{
        get {
            if(!this.HasProp("__MaskResolution"))
                this.__MaskResolution := SIZE(this.ptr + 16)
            return this.__MaskResolution
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    SubType {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
