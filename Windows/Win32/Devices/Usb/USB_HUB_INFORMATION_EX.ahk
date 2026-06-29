#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_30_HUB_DESCRIPTOR.ahk" { USB_30_HUB_DESCRIPTOR }
#Import ".\USB_HUB_TYPE.ahk" { USB_HUB_TYPE }
#Import ".\USB_HUB_DESCRIPTOR.ahk" { USB_HUB_DESCRIPTOR }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_HUB_INFORMATION_EX {
    #StructPack 4


    struct _u {
        UsbHubDescriptor : USB_HUB_DESCRIPTOR

        static __New() {
            DefineProp(this.Prototype, 'Usb30HubDescriptor', { type: USB_30_HUB_DESCRIPTOR, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    HubType : USB_HUB_TYPE

    HighestPortNumber : UInt16

    u : USB_HUB_INFORMATION_EX._u

}
