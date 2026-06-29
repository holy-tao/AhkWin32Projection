#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_30_PORT_CHANGE.ahk" { USB_30_PORT_CHANGE }
#Import ".\USB_30_PORT_STATUS.ahk" { USB_30_PORT_STATUS }
#Import ".\USB_20_PORT_STATUS.ahk" { USB_20_PORT_STATUS }
#Import ".\USB_PORT_STATUS.ahk" { USB_PORT_STATUS }
#Import ".\USB_PORT_CHANGE.ahk" { USB_PORT_CHANGE }
#Import ".\USB_20_PORT_CHANGE.ahk" { USB_20_PORT_CHANGE }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_PORT_STATUS_AND_CHANGE {
    #StructPack 1

    AsUlong32 : UInt32

    PortChange : USB_PORT_CHANGE

    static __New() {
        DefineProp(this.Prototype, 'PortStatus', { type: USB_PORT_STATUS, offset: 0 })
        this.DeleteProp("__New")
    }
}
