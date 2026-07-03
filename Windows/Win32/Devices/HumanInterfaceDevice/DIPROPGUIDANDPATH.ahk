#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DIPROPHEADER.ahk" { DIPROPHEADER }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIPROPGUIDANDPATH {
    #StructPack 4

    diph : DIPROPHEADER

    guidClass : Guid

    wszPath : WCHAR[260]

}
