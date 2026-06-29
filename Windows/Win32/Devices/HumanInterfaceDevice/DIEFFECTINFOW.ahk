#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset Unicode
 */
export default struct DIEFFECTINFOW {
    #StructPack 4

    dwSize : UInt32

    guid : Guid

    dwEffType : UInt32

    dwStaticParams : UInt32

    dwDynamicParams : UInt32

    tszName : WCHAR[260]

}
