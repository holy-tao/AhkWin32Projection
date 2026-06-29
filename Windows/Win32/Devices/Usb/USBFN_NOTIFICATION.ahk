#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BM_REQUEST_TYPE.ahk" { BM_REQUEST_TYPE }
#Import ".\USBFN_BUS_SPEED.ahk" { USBFN_BUS_SPEED }
#Import ".\USBFN_PORT_TYPE.ahk" { USBFN_PORT_TYPE }
#Import ".\USB_DEFAULT_PIPE_SETUP_PACKET.ahk" { USB_DEFAULT_PIPE_SETUP_PACKET }
#Import ".\ALTERNATE_INTERFACE.ahk" { ALTERNATE_INTERFACE }
#Import ".\USBFN_EVENT.ahk" { USBFN_EVENT }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBFN_NOTIFICATION {
    #StructPack 4


    struct _u {
        BusSpeed : USBFN_BUS_SPEED

        static __New() {
            DefineProp(this.Prototype, 'SetupPacket', { type: USB_DEFAULT_PIPE_SETUP_PACKET, offset: 0 })
            DefineProp(this.Prototype, 'ConfigurationValue', { type: UInt16, offset: 0 })
            DefineProp(this.Prototype, 'PortType', { type: USBFN_PORT_TYPE, offset: 0 })
            DefineProp(this.Prototype, 'AlternateInterface', { type: ALTERNATE_INTERFACE, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Event : USBFN_EVENT

    u : USBFN_NOTIFICATION._u

}
