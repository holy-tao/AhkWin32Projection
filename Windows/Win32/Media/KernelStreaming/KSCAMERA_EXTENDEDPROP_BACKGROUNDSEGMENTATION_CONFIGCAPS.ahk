#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\SIZE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSCAMERA_EXTENDEDPROP_BACKGROUNDSEGMENTATION_CONFIGCAPS extends Win32Struct {
    static sizeof => 40

    static packingSize => 4

    class _MaxFrameRate extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * @type {Integer}
         */
        Numerator {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        Denominator {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    }

    /**
     * @type {SIZE}
     */
    Resolution {
        get {
            if(!this.HasProp("__Resolution"))
                this.__Resolution := SIZE(0, this)
            return this.__Resolution
        }
    }

    /**
     * @type {_MaxFrameRate}
     */
    MaxFrameRate {
        get {
            if(!this.HasProp("__MaxFrameRate"))
                this.__MaxFrameRate := KSCAMERA_EXTENDEDPROP_BACKGROUNDSEGMENTATION_CONFIGCAPS._MaxFrameRate(8, this)
            return this.__MaxFrameRate
        }
    }

    /**
     * @type {SIZE}
     */
    MaskResolution {
        get {
            if(!this.HasProp("__MaskResolution"))
                this.__MaskResolution := SIZE(16, this)
            return this.__MaskResolution
        }
    }

    /**
     * @type {Guid}
     */
    SubType {
        get {
            if(!this.HasProp("__SubType"))
                this.__SubType := Guid(24, this)
            return this.__SubType
        }
    }
}
