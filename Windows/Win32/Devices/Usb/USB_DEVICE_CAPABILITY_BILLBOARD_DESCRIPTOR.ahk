#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_DEVICE_CAPABILITY_BILLBOARD_DESCRIPTOR {
    #StructPack 4


    struct _VconnPower {
        AsUshort : UInt16


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
        static __New() {
            DefineProp(this.Prototype, '_bitfield', { type: Int16, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    bLength : Int8

    bDescriptorType : Int8

    bDevCapabilityType : Int8

    iAddtionalInfoURL : Int8

    bNumberOfAlternateModes : Int8

    bPreferredAlternateMode : Int8

    VconnPower : USB_DEVICE_CAPABILITY_BILLBOARD_DESCRIPTOR._VconnPower

    bmConfigured : Int8[32]

    bReserved : UInt32

    wSVID : UInt16

    bAlternateMode : Int8

    iAlternateModeSetting : Int8

}
