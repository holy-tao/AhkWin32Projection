#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset ANSI
 */
export default struct DIEFFECTINFOA {
    #StructPack 4

    dwSize : UInt32

    guid : Guid

    dwEffType : UInt32

    dwStaticParams : UInt32

    dwDynamicParams : UInt32

    tszName : CHAR[260]

}
