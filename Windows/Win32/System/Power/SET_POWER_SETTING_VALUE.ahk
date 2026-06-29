#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SYSTEM_POWER_CONDITION.ahk" { SYSTEM_POWER_CONDITION }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct SET_POWER_SETTING_VALUE {
    #StructPack 4

    Version : UInt32

    Guid : Guid

    PowerCondition : SYSTEM_POWER_CONDITION

    DataLength : UInt32

    Data : Int8[1]

}
