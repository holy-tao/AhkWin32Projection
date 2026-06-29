#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBFN_BUS_CONFIGURATION_INFO {
    #StructPack 2

    ConfigurationName : WCHAR[40]

    IsCurrent : BOOLEAN

    IsActive : BOOLEAN

}
