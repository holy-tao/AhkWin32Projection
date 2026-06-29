#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JOYPOS.ahk" { JOYPOS }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct JOYRANGE {
    #StructPack 4

    jpMin : JOYPOS

    jpMax : JOYPOS

    jpCenter : JOYPOS

}
