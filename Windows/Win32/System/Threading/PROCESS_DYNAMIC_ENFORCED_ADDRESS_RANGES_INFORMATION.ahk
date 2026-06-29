#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE.ahk" { PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE }

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGES_INFORMATION {
    #StructPack 8

    NumberOfRanges : UInt16

    Reserved : UInt16

    Reserved2 : UInt32

    Ranges : PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE.Ptr

}
