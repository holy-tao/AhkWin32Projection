#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JOYREGHWVALUES.ahk" { JOYREGHWVALUES }
#Import ".\JOYREGHWCONFIG.ahk" { JOYREGHWCONFIG }
#Import ".\JOYRANGE.ahk" { JOYRANGE }
#Import ".\JOYPOS.ahk" { JOYPOS }
#Import ".\JOYREGHWSETTINGS.ahk" { JOYREGHWSETTINGS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIJOYCONFIG_DX5 {
    #StructPack 4

    dwSize : UInt32

    guidInstance : Guid

    hwc : JOYREGHWCONFIG

    dwGain : UInt32

    wszType : WCHAR[256]

    wszCallout : WCHAR[256]

}
