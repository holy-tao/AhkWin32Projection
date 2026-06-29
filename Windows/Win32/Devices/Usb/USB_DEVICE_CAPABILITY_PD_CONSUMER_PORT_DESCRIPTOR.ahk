#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_DEVICE_CAPABILITY_PD_CONSUMER_PORT_DESCRIPTOR {
    #StructPack 4


    struct _bmCapabilities {
        AsUshort : UInt16


        /**
         * @type {Integer}
         */
        BatteryCharging {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        USBPowerDelivery {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        USBTypeCCurrent {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
        static __New() {
            DefineProp(this.Prototype, '_bitfield', { type: Int16, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    bLength : Int8

    bDescriptorType : Int8

    bDevCapabilityType : Int8

    bReserved : Int8

    bmCapabilities : USB_DEVICE_CAPABILITY_PD_CONSUMER_PORT_DESCRIPTOR._bmCapabilities

    wMinVoltage : UInt16

    wMaxVoltage : UInt16

    wReserved : UInt16

    dwMaxOperatingPower : UInt32

    dwMaxPeakPower : UInt32

    dwMaxPeakPowerTime : UInt32

}
