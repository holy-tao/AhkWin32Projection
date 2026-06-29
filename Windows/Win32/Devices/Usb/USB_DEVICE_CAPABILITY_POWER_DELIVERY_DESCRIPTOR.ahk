#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_DEVICE_CAPABILITY_POWER_DELIVERY_DESCRIPTOR {
    #StructPack 2


    struct _bmAttributes {
        AsUlong : UInt32


        /**
         * @type {Integer}
         */
        Reserved1 {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        BatteryCharging {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        USBPowerDelivery {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        Provider {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        Consumer {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }

        /**
         * @type {Integer}
         */
        ChargingPolicy {
            get => (this._bitfield >> 5) & 0x1
            set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
        }

        /**
         * @type {Integer}
         */
        TypeCCurrent {
            get => (this._bitfield >> 6) & 0x1
            set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
        }

        /**
         * @type {Integer}
         */
        Reserved2 {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }

        /**
         * @type {Integer}
         */
        ACSupply {
            get => (this._bitfield >> 8) & 0x1
            set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
        }

        /**
         * @type {Integer}
         */
        Battery {
            get => (this._bitfield >> 9) & 0x1
            set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
        }

        /**
         * @type {Integer}
         */
        Other {
            get => (this._bitfield >> 10) & 0x1
            set => this._bitfield := ((value & 0x1) << 10) | (this._bitfield & ~(0x1 << 10))
        }

        /**
         * @type {Integer}
         */
        NumBatteries {
            get => (this._bitfield >> 11) & 0x7
            set => this._bitfield := ((value & 0x7) << 11) | (this._bitfield & ~(0x7 << 11))
        }

        /**
         * @type {Integer}
         */
        UsesVbus {
            get => (this._bitfield >> 14) & 0x1
            set => this._bitfield := ((value & 0x1) << 14) | (this._bitfield & ~(0x1 << 14))
        }

        /**
         * @type {Integer}
         */
        Reserved3 {
            get => (this._bitfield >> 15) & 0x1FFFF
            set => this._bitfield := ((value & 0x1FFFF) << 15) | (this._bitfield & ~(0x1FFFF << 15))
        }
        static __New() {
            DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    bLength : Int8

    bDescriptorType : Int8

    bDevCapabilityType : Int8

    bReserved : Int8

    bmAttributes : USB_DEVICE_CAPABILITY_POWER_DELIVERY_DESCRIPTOR._bmAttributes

    bmProviderPorts : UInt16

    bmConsumerPorts : UInt16

    bcdBCVersion : UInt16

    bcdPDVersion : UInt16

    bcdUSBTypeCVersion : UInt16

}
