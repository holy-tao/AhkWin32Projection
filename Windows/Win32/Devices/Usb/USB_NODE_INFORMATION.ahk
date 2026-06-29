#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_HUB_INFORMATION.ahk" { USB_HUB_INFORMATION }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\USB_HUB_DESCRIPTOR.ahk" { USB_HUB_DESCRIPTOR }
#Import ".\USB_MI_PARENT_INFORMATION.ahk" { USB_MI_PARENT_INFORMATION }
#Import ".\USB_HUB_NODE.ahk" { USB_HUB_NODE }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_NODE_INFORMATION {
    #StructPack 4


    struct _u {
        HubInformation : USB_HUB_INFORMATION

        static __New() {
            DefineProp(this.Prototype, 'MiParentInformation', { type: USB_MI_PARENT_INFORMATION, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    NodeType : USB_HUB_NODE

    u : USB_NODE_INFORMATION._u

}
