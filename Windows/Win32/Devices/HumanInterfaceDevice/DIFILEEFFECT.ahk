#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DIEFFECT.ahk" { DIEFFECT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIFILEEFFECT {
    #StructPack 8

    dwSize : UInt32

    GuidEffect : Guid

    lpDiEffect : DIEFFECT.Ptr

    szFriendlyName : CHAR[260]

}
