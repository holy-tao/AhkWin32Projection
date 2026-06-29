#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\BATTERY_CHARGING_SOURCE_TYPE.ahk" { BATTERY_CHARGING_SOURCE_TYPE }

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct BATTERY_CHARGING_SOURCE_INFORMATION {
    #StructPack 4

    Type : BATTERY_CHARGING_SOURCE_TYPE

    SourceOnline : BOOLEAN

}
