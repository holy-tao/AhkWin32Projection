#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_DEVICE_CAPABILITY_PLATFORM_DESCRIPTOR {
    #StructPack 4

    bLength : Int8

    bDescriptorType : Int8

    bDevCapabilityType : Int8

    bReserved : Int8

    PlatformCapabilityUuid : Guid

    CapabililityData : Int8[1]

}
