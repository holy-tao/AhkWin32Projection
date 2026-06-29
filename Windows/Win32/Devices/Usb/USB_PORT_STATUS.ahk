#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_20_PORT_STATUS.ahk" { USB_20_PORT_STATUS }
#Import ".\USB_30_PORT_STATUS.ahk" { USB_30_PORT_STATUS }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_PORT_STATUS {
    #StructPack 1

    AsUshort16 : UInt16

    static __New() {
        DefineProp(this.Prototype, 'Usb20PortStatus', { type: USB_20_PORT_STATUS, offset: 0 })
        DefineProp(this.Prototype, 'Usb30PortStatus', { type: USB_30_PORT_STATUS, offset: 0 })
        this.DeleteProp("__New")
    }
}
