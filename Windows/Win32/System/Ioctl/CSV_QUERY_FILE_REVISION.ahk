#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about whether files in a stream have been modified.
 * @remarks
 * This structure is used if the <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_csv_control">FSCTL_CSV_CONTROL</a> 
  *     control code is called with a <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-csv_control_op">CSV_CONTROL_OP</a> enumeration 
  *     value of <b>CsvControlQueryFileRevision</b>, or if the control code is used with an 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-csv_control_param">CSV_CONTROL_PARAM</a> structure containing that 
  *     enumeration value.
  * 
  * Revision tracking is per file, not per stream, so the output changes whenever the stream changes.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-csv_query_file_revision
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CSV_QUERY_FILE_REVISION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The identifier of an NTFS file.
     * @type {Integer}
     */
    FileId {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * File revision tracking elements.
     * 
     * <ul>
     * <li><b>FileRevision</b>[0] increases every time the CSV MDS stack is rebuilt and CSVFLT 
     *         loses its state.</li>
     * <li><b>FileRevision</b>[1] increases every time the CSV MDS stack purges the cached 
     *         revision number for the file.</li>
     * <li><b>FileRevision</b>[2] increases every time the CSV MDS observes that file sizes 
     *         might have changed or the file might have been written to. The element is also incremented whenever one of the 
     *         nodes performs the first direct input/output operation on a stream that is associated with this file after 
     *         opening this stream.</li>
     * </ul>
     * If any of the numbers are 0, the function caller should assume that the file was modified.
     * @type {Array<Int64>}
     */
    FileRevision{
        get {
            if(!this.HasProp("__FileRevisionProxyArray"))
                this.__FileRevisionProxyArray := Win32FixedArray(this.ptr + 8, 8, Primitive, "int64")
            return this.__FileRevisionProxyArray
        }
    }
}
