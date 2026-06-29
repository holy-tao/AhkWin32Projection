#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_SYSTEM_BASIC_PERFORMANCE_INFORMATION {
    #StructPack 8

    AvailablePages : Int64

    CommittedPages : Int64

    CommitLimit : Int64

    PeakCommitment : Int64

}
