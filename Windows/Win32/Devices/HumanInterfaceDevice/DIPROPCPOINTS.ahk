#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DIPROPHEADER.ahk" { DIPROPHEADER }
#Import ".\CPOINT.ahk" { CPOINT }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIPROPCPOINTS {
    #StructPack 4

    diph : DIPROPHEADER

    dwCPointsNum : UInt32

    cp : CPOINT[8]

}
