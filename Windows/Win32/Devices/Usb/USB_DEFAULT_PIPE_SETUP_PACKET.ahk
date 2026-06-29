#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BM_REQUEST_TYPE.ahk" { BM_REQUEST_TYPE }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_DEFAULT_PIPE_SETUP_PACKET {
    #StructPack 2


    struct _wValue {
        LowByte : Int8

        HiByte : Int8

        static __New() {
            DefineProp(this.Prototype, 'W', { type: UInt16, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _wIndex {
        LowByte : Int8

        HiByte : Int8

        static __New() {
            DefineProp(this.Prototype, 'W', { type: UInt16, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    bmRequestType : BM_REQUEST_TYPE

    bRequest : Int8

    wValue : USB_DEFAULT_PIPE_SETUP_PACKET._wValue

    wIndex : USB_DEFAULT_PIPE_SETUP_PACKET._wIndex

    wLength : UInt16

}
