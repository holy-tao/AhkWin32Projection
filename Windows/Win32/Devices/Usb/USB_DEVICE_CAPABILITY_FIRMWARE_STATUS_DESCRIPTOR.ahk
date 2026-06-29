#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_DEVICE_CAPABILITY_FIRMWARE_STATUS_DESCRIPTOR {
    #StructPack 1


    struct _bmAttributes {
        AsUlong : UInt32


        /**
         * @type {Integer}
         */
        GetFirmwareImageHashSupport {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        DisallowFirmwareUpdateSupport {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
        static __New() {
            DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    bLength : Int8

    bDescriptorType : Int8

    bDevCapabilityType : Int8

    bcdDescriptorVersion : Int8

    bmAttributes : USB_DEVICE_CAPABILITY_FIRMWARE_STATUS_DESCRIPTOR._bmAttributes

}
