#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information from a monitor's timing report.
 * @see https://learn.microsoft.com/windows/win32/api/lowlevelmonitorconfigurationapi/ns-lowlevelmonitorconfigurationapi-mc_timing_report
 * @namespace Windows.Win32.Devices.Display
 */
export default struct MC_TIMING_REPORT {
    #StructPack 4

    /**
     * The monitor's horizontal synchronization frequency in Hz.
     */
    dwHorizontalFrequencyInHZ : UInt32

    /**
     * The monitor's vertical synchronization frequency in Hz.
     */
    dwVerticalFrequencyInHZ : UInt32

    /**
     * Timing status byte. For more information about this value, see the Display Data Channel Command Interface (DDC/CI) standard.
     */
    bTimingStatusByte : Int8

}
