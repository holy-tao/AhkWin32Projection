#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_COUNTER.ahk" { STORAGE_COUNTER }
#Import ".\STORAGE_COUNTER_TYPE.ahk" { STORAGE_COUNTER_TYPE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_COUNTERS {
    #StructPack 8

    Version : UInt32

    Size : UInt32

    NumberOfCounters : UInt32

    Counters : STORAGE_COUNTER[1]

}
