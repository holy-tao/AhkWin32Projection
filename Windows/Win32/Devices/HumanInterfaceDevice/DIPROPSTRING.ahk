#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DIPROPHEADER.ahk" { DIPROPHEADER }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIPROPSTRING {
    #StructPack 4

    diph : DIPROPHEADER

    wsz : WCHAR[260]

}
