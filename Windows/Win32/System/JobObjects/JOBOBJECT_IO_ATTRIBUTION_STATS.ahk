#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.JobObjects
 */
export default struct JOBOBJECT_IO_ATTRIBUTION_STATS {
    #StructPack 8

    IoCount : IntPtr

    TotalNonOverlappedQueueTime : Int64

    TotalNonOverlappedServiceTime : Int64

    TotalSize : Int64

}
