#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLFS_IOSTATS_CLASS.ahk" { CLFS_IOSTATS_CLASS }
#Import ".\CLS_IO_STATISTICS_HEADER.ahk" { CLS_IO_STATISTICS_HEADER }

/**
 * Defines the statistics that are reported by GetLogIoStatistics.
 * @see https://learn.microsoft.com/windows/win32/api/clfs/ns-clfs-cls_io_statistics
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CLS_IO_STATISTICS {
    #StructPack 8

    /**
     * The header for the statistics buffer.
     */
    hdrIoStats : CLS_IO_STATISTICS_HEADER

    /**
     * The frequency of  data flushes  for the logging session.
     */
    cFlush : Int64

    /**
     * The cumulative number of bytes of data  flushed in the logging session.
     */
    cbFlush : Int64

    /**
     * The frequency of  metadata flushes  for the logging session.
     */
    cMetaFlush : Int64

    /**
     * The cumulative number of bytes of metadata flushed in the logging session.
     */
    cbMetaFlush : Int64

}
