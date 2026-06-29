#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_HUB_STATUS.ahk" { USB_HUB_STATUS }
#Import ".\USB_HUB_CHANGE.ahk" { USB_HUB_CHANGE }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_HUB_STATUS_AND_CHANGE {
    #StructPack 1

    AsUlong32 : UInt32

    HubChange : USB_HUB_CHANGE

    static __New() {
        DefineProp(this.Prototype, 'HubStatus', { type: USB_HUB_STATUS, offset: 0 })
        this.DeleteProp("__New")
    }
}
