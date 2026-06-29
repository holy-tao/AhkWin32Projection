#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBFN_USB_STRING {
    #StructPack 2

    StringIndex : Int8

    UsbString : WCHAR[255]

}
