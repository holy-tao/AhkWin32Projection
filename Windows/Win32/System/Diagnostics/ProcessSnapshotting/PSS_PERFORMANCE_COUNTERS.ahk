#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Holds performance counters returned by PssQuerySnapshot.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-pssquerysnapshot">PssQuerySnapshot</a> returns a <b>PSS_PERFORMANCE_COUNTERS</b> structure when the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_query_information_class">PSS_QUERY_INFORMATION_CLASS</a> member that the caller provides it is  <b>PSS_QUERY_PERFORMANCE_COUNTERS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/processsnapshot/ns-processsnapshot-pss_performance_counters
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 */
export default struct PSS_PERFORMANCE_COUNTERS {
    #StructPack 8

    /**
     * The count of clock cycles spent for capture.
     */
    TotalCycleCount : Int64

    /**
     * The count of <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> units spent for capture.
     */
    TotalWallClockPeriod : Int64

    /**
     * The count of clock cycles spent for the capture of the VA clone.
     */
    VaCloneCycleCount : Int64

    /**
     * The count of <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> units spent for the capture of the VA clone.
     */
    VaCloneWallClockPeriod : Int64

    /**
     * The count of clock cycles spent for the capture of VA space information.
     */
    VaSpaceCycleCount : Int64

    /**
     * The count of <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> units spent for the capture VA space information.
     */
    VaSpaceWallClockPeriod : Int64

    /**
     * The count of clock cycles spent for the capture of auxiliary page information.
     */
    AuxPagesCycleCount : Int64

    /**
     * The count of <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> units spent for the capture of auxiliary page information.
     */
    AuxPagesWallClockPeriod : Int64

    /**
     * The count of clock cycles spent for the capture of handle information.
     */
    HandlesCycleCount : Int64

    /**
     * The count of <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> units spent for the capture of handle information.
     */
    HandlesWallClockPeriod : Int64

    /**
     * The count of clock cycles spent for the capture of thread information.
     */
    ThreadsCycleCount : Int64

    /**
     * The count of <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> units spent for the capture of thread information.
     */
    ThreadsWallClockPeriod : Int64

}
