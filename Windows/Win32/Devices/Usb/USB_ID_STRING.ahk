#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_ID_STRING {
    #StructPack 8

    LanguageId : UInt16

    Pad : UInt16

    LengthInBytes : UInt32

    Buffer : PWSTR

}
