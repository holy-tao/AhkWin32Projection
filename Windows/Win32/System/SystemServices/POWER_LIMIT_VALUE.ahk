#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\POWER_LIMIT_TYPES.ahk" { POWER_LIMIT_TYPES }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct POWER_LIMIT_VALUE {
    #StructPack 4

    Type : POWER_LIMIT_TYPES

    DomainId : UInt32

    TargetValue : UInt32

    TimeParameter : UInt32

}
