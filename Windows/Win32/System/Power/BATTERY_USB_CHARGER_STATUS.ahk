#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_CHARGER_PORT.ahk" { USB_CHARGER_PORT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\BATTERY_CHARGING_SOURCE_TYPE.ahk" { BATTERY_CHARGING_SOURCE_TYPE }

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct BATTERY_USB_CHARGER_STATUS {
    #StructPack 8

    Type : BATTERY_CHARGING_SOURCE_TYPE

    Reserved : UInt32

    Flags : UInt32

    MaxCurrent : UInt32

    Voltage : UInt32

    PortType : USB_CHARGER_PORT

    PortId : Int64

    PowerSourceInformation : IntPtr

    OemCharger : Guid

}
