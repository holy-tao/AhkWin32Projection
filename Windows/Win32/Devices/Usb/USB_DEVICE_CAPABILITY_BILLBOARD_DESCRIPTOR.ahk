#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USB_DEVICE_CAPABILITY_BILLBOARD_DESCRIPTOR extends Win32Struct {
    static sizeof => 48

    static packingSize => 4

    class _VconnPower extends Win32Struct {
        static sizeof => 2
        static packingSize => 1

        /**
         * @type {Integer}
         */
        AsUshort {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }

        /**
         * This bitfield backs the following members:
         * - VConnPowerNeededForFullFunctionality
         * - Reserved
         * - NoVconnPowerRequired
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        VConnPowerNeededForFullFunctionality {
            get => (this._bitfield >> 0) & 0x7
            set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
        }

        /**
         * @type {Integer}
         */
        NoVconnPowerRequired {
            get => (this._bitfield >> 15) & 0x1
            set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
        }
    }

    /**
     * @type {Integer}
     */
    bLength {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    bDescriptorType {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    bDevCapabilityType {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    iAddtionalInfoURL {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    bNumberOfAlternateModes {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    bPreferredAlternateMode {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {_VconnPower}
     */
    VconnPower {
        get {
            if(!this.HasProp("__VconnPower"))
                this.__VconnPower := USB_DEVICE_CAPABILITY_BILLBOARD_DESCRIPTOR._VconnPower(6, this)
            return this.__VconnPower
        }
    }

    /**
     * @type {Array<Integer>}
     */
    bmConfigured {
        get {
            if(!this.HasProp("__bmConfiguredProxyArray"))
                this.__bmConfiguredProxyArray := Win32FixedArray(this.ptr + 8, 32, Primitive, "char")
            return this.__bmConfiguredProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    bReserved {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    wSVID {
        get => NumGet(this, 44, "ushort")
        set => NumPut("ushort", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    bAlternateMode {
        get => NumGet(this, 46, "char")
        set => NumPut("char", value, this, 46)
    }

    /**
     * @type {Integer}
     */
    iAlternateModeSetting {
        get => NumGet(this, 47, "char")
        set => NumPut("char", value, this, 47)
    }
}
