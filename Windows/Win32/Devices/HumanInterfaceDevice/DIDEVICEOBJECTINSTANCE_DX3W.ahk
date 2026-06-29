#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset Unicode
 */
export default struct DIDEVICEOBJECTINSTANCE_DX3W {
    #StructPack 4

    dwSize : UInt32

    guidType : Guid

    dwOfs : UInt32

    dwType : UInt32

    dwFlags : UInt32

    tszName : WCHAR[260]

}
