#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLS_IO_STATISTICS_HEADER.ahk

/**
 * Defines the statistics that are reported by GetLogIoStatistics.
 * @see https://learn.microsoft.com/windows/win32/api/clfs/ns-clfs-cls_io_statistics
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLS_IO_STATISTICS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The header for the statistics buffer.
     * @type {CLS_IO_STATISTICS_HEADER}
     */
    hdrIoStats{
        get {
            if(!this.HasProp("__hdrIoStats"))
                this.__hdrIoStats := CLS_IO_STATISTICS_HEADER(0, this)
            return this.__hdrIoStats
        }
    }

    /**
     * The frequency of  data flushes  for the logging session.
     * @type {Integer}
     */
    cFlush {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The cumulative number of bytes of data  flushed in the logging session.
     * @type {Integer}
     */
    cbFlush {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The frequency of  metadata flushes  for the logging session.
     * @type {Integer}
     */
    cMetaFlush {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The cumulative number of bytes of metadata flushed in the logging session.
     * @type {Integer}
     */
    cbMetaFlush {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
