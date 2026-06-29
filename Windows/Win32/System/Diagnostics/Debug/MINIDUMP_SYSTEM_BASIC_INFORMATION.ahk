#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_SYSTEM_BASIC_INFORMATION {
    #StructPack 8

    TimerResolution : UInt32

    PageSize : UInt32

    NumberOfPhysicalPages : UInt32

    LowestPhysicalPageNumber : UInt32

    HighestPhysicalPageNumber : UInt32

    AllocationGranularity : UInt32

    MinimumUserModeAddress : Int64

    MaximumUserModeAddress : Int64

    ActiveProcessorsAffinityMask : Int64

    NumberOfProcessors : UInt32

}
