#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HARDWARE_COUNTER_TYPE.ahk" { HARDWARE_COUNTER_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct HARDWARE_COUNTER {
    #StructPack 8

    Type : HARDWARE_COUNTER_TYPE

    Reserved : UInt32

    Index : Int64

}
