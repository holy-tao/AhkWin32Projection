#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIOBJECTDATAFORMAT {
    #StructPack 8

    pguid : Guid.Ptr

    dwOfs : UInt32

    dwType : UInt32

    dwFlags : UInt32

}
