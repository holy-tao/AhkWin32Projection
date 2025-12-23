#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_DEVICE_CAPABILITY_USB20_EXTENSION_DESCRIPTOR extends Win32Struct
{
    static sizeof => 7

    static packingSize => 1

    class _bmAttributes_e__Union extends Win32Struct {
        static sizeof => 4
        static packingSize => 1

        /**
         * @type {Integer}
         */
        AsUlong {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * This bitfield backs the following members:
         * - Reserved
         * - LPMCapable
         * - BESLAndAlternateHIRDSupported
         * - BaselineBESLValid
         * - DeepBESLValid
         * - Reserved1
         * - BaselineBESL
         * - DeepBESL
         * - Reserved2
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        LPMCapable {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    
        /**
         * @type {Integer}
         */
        BESLAndAlternateHIRDSupported {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
    
        /**
         * @type {Integer}
         */
        BaselineBESLValid {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }
    
        /**
         * @type {Integer}
         */
        DeepBESLValid {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }
    
        /**
         * @type {Integer}
         */
        Reserved1 {
            get => (this._bitfield >> 5) & 0x7
            set => this._bitfield := ((value & 0x7) << 5) | (this._bitfield & ~(0x7 << 5))
        }
    
        /**
         * @type {Integer}
         */
        BaselineBESL {
            get => (this._bitfield >> 8) & 0xF
            set => this._bitfield := ((value & 0xF) << 8) | (this._bitfield & ~(0xF << 8))
        }
    
        /**
         * @type {Integer}
         */
        DeepBESL {
            get => (this._bitfield >> 12) & 0xF
            set => this._bitfield := ((value & 0xF) << 12) | (this._bitfield & ~(0xF << 12))
        }
    
        /**
         * @type {Integer}
         */
        Reserved2 {
            get => (this._bitfield >> 16) & 0xFFFF
            set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
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
     * @type {_bmAttributes_e__Union}
     */
    bmAttributes{
        get {
            if(!this.HasProp("__bmAttributes"))
                this.__bmAttributes := %this.__Class%._bmAttributes_e__Union(3, this)
            return this.__bmAttributes
        }
    }
}
