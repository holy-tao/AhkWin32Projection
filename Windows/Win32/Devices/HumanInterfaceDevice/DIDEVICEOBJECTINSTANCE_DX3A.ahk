#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset ANSI
 */
export default struct DIDEVICEOBJECTINSTANCE_DX3A {
    #StructPack 4

    dwSize : UInt32

    guidType : Guid

    dwOfs : UInt32

    dwType : UInt32

    dwFlags : UInt32

    tszName : CHAR[260]

}
