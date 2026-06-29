#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct THERMAL_POLICY {
    #StructPack 4

    Version : UInt32

    WaitForUpdate : BOOLEAN

    Hibernate : BOOLEAN

    Critical : BOOLEAN

    ThermalStandby : BOOLEAN

    ActivationReasons : UInt32

    PassiveLimit : UInt32

    ActiveLevel : UInt32

    OverThrottled : BOOLEAN

}
