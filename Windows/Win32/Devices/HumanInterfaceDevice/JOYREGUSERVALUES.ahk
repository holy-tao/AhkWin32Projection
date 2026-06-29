#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JOYRANGE.ahk" { JOYRANGE }
#Import ".\JOYPOS.ahk" { JOYPOS }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct JOYREGUSERVALUES {
    #StructPack 4

    dwTimeOut : UInt32

    jrvRanges : JOYRANGE

    jpDeadZone : JOYPOS

}
