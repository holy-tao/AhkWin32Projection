#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLFS_IOSTATS_CLASS.ahk" { CLFS_IOSTATS_CLASS }

/**
 * Header for information retrieved by the GetLogIoStatistics function, which defines the I/O performance counters of a log.
 * @remarks
 * This header is followed by the I/O statistics counters.
 * @see https://learn.microsoft.com/windows/win32/api/clfs/ns-clfs-cls_io_statistics_header
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CLS_IO_STATISTICS_HEADER {
    #StructPack 4

    /**
     * The major version of the statistics buffer.
     */
    ubMajorVersion : Int8

    /**
     * The minor version of the statistics buffer.
     */
    ubMinorVersion : Int8

    /**
     * The class of I/O statistics  that is exported. Currently, flush statistics are the only statistics information exported.  These statistics  include the frequency of data and metadata flushes on a dedicated log and the amount of data and metadata flushed. Because  flush statistics are  the  sole statistics class, this member is currently unused but will be used in the future.
     */
    eStatsClass : CLFS_IOSTATS_CLASS

    /**
     * The length of the statistics buffer, including the header.
     */
    cbLength : UInt16

    /**
     * The offset of statistics counters from the beginning of the packet where the statistics data begins.  This field allows transparent modifications to the header and length without affecting  how the statistics data is accessed.
     */
    coffData : UInt32

}
