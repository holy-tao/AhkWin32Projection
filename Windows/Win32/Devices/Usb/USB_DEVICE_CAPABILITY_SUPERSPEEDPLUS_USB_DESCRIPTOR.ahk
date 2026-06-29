#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED.ahk" { USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_USB_DESCRIPTOR {
    #StructPack 2


    struct _bmAttributes {
        AsUlong : UInt32


        /**
         * @type {Integer}
         */
        SublinkSpeedAttrCount {
            get => (this._bitfield >> 0) & 0x1F
            set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
        }

        /**
         * @type {Integer}
         */
        SublinkSpeedIDCount {
            get => (this._bitfield >> 5) & 0xF
            set => this._bitfield := ((value & 0xF) << 5) | (this._bitfield & ~(0xF << 5))
        }
        static __New() {
            DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _wFunctionalitySupport {
        AsUshort : UInt16


        /**
         * @type {Integer}
         */
        SublinkSpeedAttrID {
            get => (this._bitfield >> 0) & 0xF
            set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
        }

        /**
         * @type {Integer}
         */
        MinRxLaneCount {
            get => (this._bitfield >> 8) & 0xF
            set => this._bitfield := ((value & 0xF) << 8) | (this._bitfield & ~(0xF << 8))
        }

        /**
         * @type {Integer}
         */
        MinTxLaneCount {
            get => (this._bitfield >> 12) & 0xF
            set => this._bitfield := ((value & 0xF) << 12) | (this._bitfield & ~(0xF << 12))
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

    bmAttributes : USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_USB_DESCRIPTOR._bmAttributes

    wFunctionalitySupport : USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_USB_DESCRIPTOR._wFunctionalitySupport

    wReserved : UInt16

    bmSublinkSpeedAttr : USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED[1]

}
