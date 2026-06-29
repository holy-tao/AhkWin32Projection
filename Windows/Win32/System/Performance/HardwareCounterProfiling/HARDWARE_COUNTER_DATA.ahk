#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HARDWARE_COUNTER_TYPE.ahk" { HARDWARE_COUNTER_TYPE }

/**
 * Contains the hardware counter value.
 * @remarks
 * This structure is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-performance_data">PERFORMANCE_DATA</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-hardware_counter_data
 * @namespace Windows.Win32.System.Performance.HardwareCounterProfiling
 */
export default struct HARDWARE_COUNTER_DATA {
    #StructPack 8

    /**
     * The type of hardware counter data collected. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-hardware_counter_type">HARDWARE_COUNTER_TYPE</a> enumeration.
     */
    Type : HARDWARE_COUNTER_TYPE

    /**
     * Reserved. Initialize to zero.
     */
    Reserved : UInt32

    /**
     * The counter index. Each hardware counter in a processor's performance monitoring unit (PMU) is identified by an index.
     */
    Value : Int64

}
