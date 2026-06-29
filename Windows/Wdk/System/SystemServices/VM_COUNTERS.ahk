#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct VM_COUNTERS {
    #StructPack 8

    PeakVirtualSize : IntPtr

    VirtualSize : IntPtr

    PageFaultCount : UInt32

    PeakWorkingSetSize : IntPtr

    WorkingSetSize : IntPtr

    QuotaPeakPagedPoolUsage : IntPtr

    QuotaPagedPoolUsage : IntPtr

    QuotaPeakNonPagedPoolUsage : IntPtr

    QuotaNonPagedPoolUsage : IntPtr

    PagefileUsage : IntPtr

    PeakPagefileUsage : IntPtr

}
