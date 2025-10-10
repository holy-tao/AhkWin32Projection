#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information from a monitor's timing report.
 * @see https://docs.microsoft.com/windows/win32/api//lowlevelmonitorconfigurationapi/ns-lowlevelmonitorconfigurationapi-mc_timing_report
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class MC_TIMING_REPORT extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The monitor's horizontal synchronization frequency in Hz.
     * @type {Integer}
     */
    dwHorizontalFrequencyInHZ {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The monitor's vertical synchronization frequency in Hz.
     * @type {Integer}
     */
    dwVerticalFrequencyInHZ {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Timing status byte. For more information about this value, see the Display Data Channel Command Interface (DDC/CI) standard.
     * @type {Integer}
     */
    bTimingStatusByte {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }
}
