#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USBFN_BUS_SPEED.ahk" { USBFN_BUS_SPEED }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBFN_INTERFACE_INFO {
    #StructPack 4

    InterfaceNumber : Int8

    Speed : USBFN_BUS_SPEED

    Size : UInt16

    InterfaceDescriptorSet : Int8[1]

}
