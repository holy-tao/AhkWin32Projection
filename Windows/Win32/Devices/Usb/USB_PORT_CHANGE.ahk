#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_30_PORT_CHANGE.ahk" { USB_30_PORT_CHANGE }
#Import ".\USB_20_PORT_CHANGE.ahk" { USB_20_PORT_CHANGE }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_PORT_CHANGE {
    #StructPack 1

    AsUshort16 : UInt16

    static __New() {
        DefineProp(this.Prototype, 'Usb20PortChange', { type: USB_20_PORT_CHANGE, offset: 0 })
        DefineProp(this.Prototype, 'Usb30PortChange', { type: USB_30_PORT_CHANGE, offset: 0 })
        this.DeleteProp("__New")
    }
}
