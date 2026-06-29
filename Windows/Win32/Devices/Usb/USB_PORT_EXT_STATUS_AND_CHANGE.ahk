#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_30_PORT_CHANGE.ahk" { USB_30_PORT_CHANGE }
#Import ".\USB_30_PORT_STATUS.ahk" { USB_30_PORT_STATUS }
#Import ".\USB_20_PORT_STATUS.ahk" { USB_20_PORT_STATUS }
#Import ".\USB_PORT_STATUS_AND_CHANGE.ahk" { USB_PORT_STATUS_AND_CHANGE }
#Import ".\USB_PORT_STATUS.ahk" { USB_PORT_STATUS }
#Import ".\USB_PORT_EXT_STATUS.ahk" { USB_PORT_EXT_STATUS }
#Import ".\USB_PORT_CHANGE.ahk" { USB_PORT_CHANGE }
#Import ".\USB_20_PORT_CHANGE.ahk" { USB_20_PORT_CHANGE }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_PORT_EXT_STATUS_AND_CHANGE {
    #StructPack 1

    AsUlong64 : Int64

    PortExtStatus : USB_PORT_EXT_STATUS

    static __New() {
        DefineProp(this.Prototype, 'PortStatusChange', { type: USB_PORT_STATUS_AND_CHANGE, offset: 0 })
        this.DeleteProp("__New")
    }
}
