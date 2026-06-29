#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset ANSI
 */
export default struct DIDEVICEINSTANCEA {
    #StructPack 4

    dwSize : UInt32

    guidInstance : Guid

    guidProduct : Guid

    dwDevType : UInt32

    tszInstanceName : CHAR[260]

    tszProductName : CHAR[260]

    guidFFDriver : Guid

    wUsagePage : UInt16

    wUsage : UInt16

}
