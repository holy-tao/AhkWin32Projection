#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Holds performance counters returned by PssQuerySnapshot.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-pssquerysnapshot">PssQuerySnapshot</a> returns a <b>PSS_PERFORMANCE_COUNTERS</b> structure when the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_query_information_class">PSS_QUERY_INFORMATION_CLASS</a> member that the caller provides it is  <b>PSS_QUERY_PERFORMANCE_COUNTERS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/processsnapshot/ns-processsnapshot-pss_performance_counters
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 * @version v4.0.30319
 */
class PSS_PERFORMANCE_COUNTERS extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * The count of clock cycles spent for capture.
     * @type {Integer}
     */
    TotalCycleCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The count of <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> units spent for capture.
     * @type {Integer}
     */
    TotalWallClockPeriod {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The count of clock cycles spent for the capture of the VA clone.
     * @type {Integer}
     */
    VaCloneCycleCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The count of <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> units spent for the capture of the VA clone.
     * @type {Integer}
     */
    VaCloneWallClockPeriod {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The count of clock cycles spent for the capture of VA space information.
     * @type {Integer}
     */
    VaSpaceCycleCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The count of <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> units spent for the capture VA space information.
     * @type {Integer}
     */
    VaSpaceWallClockPeriod {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The count of clock cycles spent for the capture of auxiliary page information.
     * @type {Integer}
     */
    AuxPagesCycleCount {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The count of <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> units spent for the capture of auxiliary page information.
     * @type {Integer}
     */
    AuxPagesWallClockPeriod {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The count of clock cycles spent for the capture of handle information.
     * @type {Integer}
     */
    HandlesCycleCount {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The count of <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> units spent for the capture of handle information.
     * @type {Integer}
     */
    HandlesWallClockPeriod {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * The count of clock cycles spent for the capture of thread information.
     * @type {Integer}
     */
    ThreadsCycleCount {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * The count of <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> units spent for the capture of thread information.
     * @type {Integer}
     */
    ThreadsWallClockPeriod {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }
}
