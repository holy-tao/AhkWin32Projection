#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\JOYREGHWSETTINGS.ahk" { JOYREGHWSETTINGS }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIJOYTYPEINFO_DX6 {
    #StructPack 4

    dwSize : UInt32

    hws : JOYREGHWSETTINGS

    clsidConfig : Guid

    wszDisplayName : WCHAR[256]

    wszCallout : WCHAR[260]

    wszHardwareId : WCHAR[256]

    dwFlags1 : UInt32

}
