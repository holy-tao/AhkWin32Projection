#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the hardware counter value.
 * @remarks
 * This structure is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-performance_data">PERFORMANCE_DATA</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-hardware_counter_data
 * @namespace Windows.Win32.System.Performance.HardwareCounterProfiling
 * @version v4.0.30319
 */
class HARDWARE_COUNTER_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The type of hardware counter data collected. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-hardware_counter_type">HARDWARE_COUNTER_TYPE</a> enumeration.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Reserved. Initialize to zero.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The counter index. Each hardware counter in a processor's performance monitoring unit (PMU) is identified by an index.
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
