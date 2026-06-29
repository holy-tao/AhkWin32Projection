#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_HUB_DEVICE_UXD_SETTINGS.ahk" { USB_HUB_DEVICE_UXD_SETTINGS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\USB_HUB_CAP_FLAGS.ahk" { USB_HUB_CAP_FLAGS }
#Import ".\USB_ID_STRING.ahk" { USB_ID_STRING }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct HUB_DEVICE_CONFIG_INFO {
    #StructPack 8

    Version : UInt32

    Length : UInt32

    HubFlags : USB_HUB_CAP_FLAGS

    HardwareIds : USB_ID_STRING

    CompatibleIds : USB_ID_STRING

    DeviceDescription : USB_ID_STRING

    Reserved : UInt32[19]

    UxdSettings : USB_HUB_DEVICE_UXD_SETTINGS

}
