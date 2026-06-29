#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset Unicode
 */
export default struct DIDEVICEINSTANCEW {
    #StructPack 4

    dwSize : UInt32

    guidInstance : Guid

    guidProduct : Guid

    dwDevType : UInt32

    tszInstanceName : WCHAR[260]

    tszProductName : WCHAR[260]

    guidFFDriver : Guid

    wUsagePage : UInt16

    wUsage : UInt16

}
