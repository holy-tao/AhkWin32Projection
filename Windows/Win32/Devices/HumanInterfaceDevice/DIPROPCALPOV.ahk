#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DIPROPHEADER.ahk" { DIPROPHEADER }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIPROPCALPOV {
    #StructPack 4

    diph : DIPROPHEADER

    lMin : Int32[5]

    lMax : Int32[5]

}
