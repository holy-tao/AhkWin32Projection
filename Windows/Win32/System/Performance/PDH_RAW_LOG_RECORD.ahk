#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PDH_RAW_LOG_RECORD structure contains information about a binary trace log file record.
 * @see https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_raw_log_record
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PDH_RAW_LOG_RECORD extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Size of this structure, in bytes. The size includes this structure and the <b>RawBytes</b> appended to the end of this structure.
     * @type {Integer}
     */
    dwStructureSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwRecordType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Size of the <b>RawBytes</b> data.
     * @type {Integer}
     */
    dwItems {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Binary record.
     * @type {Array<Byte>}
     */
    RawBytes{
        get {
            if(!this.HasProp("__RawBytesProxyArray"))
                this.__RawBytesProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__RawBytesProxyArray
        }
    }
}
