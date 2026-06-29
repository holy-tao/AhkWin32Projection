#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BATTERY_CHARGING_SOURCE_TYPE.ahk" { BATTERY_CHARGING_SOURCE_TYPE }

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct BATTERY_CHARGER_STATUS {
    #StructPack 4

    Type : BATTERY_CHARGING_SOURCE_TYPE

    VaData : UInt32[1]

}
