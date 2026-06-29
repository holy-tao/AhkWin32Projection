#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_SYSTEM_FILECACHE_INFORMATION {
    #StructPack 8

    CurrentSize : Int64

    PeakSize : Int64

    PageFaultCount : UInt32

    MinimumWorkingSet : Int64

    MaximumWorkingSet : Int64

    CurrentSizeIncludingTransitionInPages : Int64

    PeakSizeIncludingTransitionInPages : Int64

    TransitionRePurposeCount : UInt32

    Flags : UInt32

}
