#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Header for information retrieved by the GetLogIoStatistics function, which defines the I/O performance counters of a log.
 * @remarks
 * This header is followed by the I/O statistics counters.
 * @see https://learn.microsoft.com/windows/win32/api/clfs/ns-clfs-cls_io_statistics_header
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLS_IO_STATISTICS_HEADER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The major version of the statistics buffer.
     * @type {Integer}
     */
    ubMajorVersion {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * The minor version of the statistics buffer.
     * @type {Integer}
     */
    ubMinorVersion {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * The class of I/O statistics  that is exported. Currently, flush statistics are the only statistics information exported.  These statistics  include the frequency of data and metadata flushes on a dedicated log and the amount of data and metadata flushed. Because  flush statistics are  the  sole statistics class, this member is currently unused but will be used in the future.
     * @type {Integer}
     */
    eStatsClass {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The length of the statistics buffer, including the header.
     * @type {Integer}
     */
    cbLength {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * The offset of statistics counters from the beginning of the packet where the statistics data begins.  This field allows transparent modifications to the header and length without affecting  how the statistics data is accessed.
     * @type {Integer}
     */
    coffData {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
