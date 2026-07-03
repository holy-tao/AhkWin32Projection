#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JOYPOS.ahk" { JOYPOS }
#Import ".\JOYRANGE.ahk" { JOYRANGE }
#Import ".\JOYREGHWSETTINGS.ahk" { JOYREGHWSETTINGS }
#Import ".\JOYREGHWVALUES.ahk" { JOYREGHWVALUES }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct JOYREGHWCONFIG {
    #StructPack 4

    hws : JOYREGHWSETTINGS

    dwUsageSettings : UInt32

    hwv : JOYREGHWVALUES

    dwType : UInt32

    dwReserved : UInt32

}
