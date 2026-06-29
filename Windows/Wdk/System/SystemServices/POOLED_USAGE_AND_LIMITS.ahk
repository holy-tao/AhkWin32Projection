#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct POOLED_USAGE_AND_LIMITS {
    #StructPack 8

    PeakPagedPoolUsage : IntPtr

    PagedPoolUsage : IntPtr

    PagedPoolLimit : IntPtr

    PeakNonPagedPoolUsage : IntPtr

    NonPagedPoolUsage : IntPtr

    NonPagedPoolLimit : IntPtr

    PeakPagefileUsage : IntPtr

    PagefileUsage : IntPtr

    PagefileLimit : IntPtr

}
