#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCD_STAT_COUNTERS.ahk" { HCD_STAT_COUNTERS }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct HCD_STAT_INFORMATION_1 {
    #StructPack 8

    Reserved1 : UInt32

    Reserved2 : UInt32

    ResetCounters : UInt32

    TimeRead : Int64

    Counters : HCD_STAT_COUNTERS

}
