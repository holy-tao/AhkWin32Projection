#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_DEVICE_CAPABILITY_USB20_EXTENSION_DESCRIPTOR {
    #StructPack 1


    struct _bmAttributes {
        AsUlong : UInt32


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
        static __New() {
            DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    bLength : Int8

    bDescriptorType : Int8

    bDevCapabilityType : Int8

    bmAttributes : USB_DEVICE_CAPABILITY_USB20_EXTENSION_DESCRIPTOR._bmAttributes

}
