#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_HUB_CAP_FLAGS.ahk" { USB_HUB_CAP_FLAGS }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_HUB_CAPABILITIES_EX {
    #StructPack 1

    CapabilityFlags : USB_HUB_CAP_FLAGS

}
