#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the path that is used by CSV to communicate to the MDS.
 * @remarks
 * This structure is used if the <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_csv_control">FSCTL_CSV_CONTROL</a> 
 *     control code is called with a <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-csv_control_op">CSV_CONTROL_OP</a> enumeration 
 *     value of <b>CsvControlQueryMdsPath</b>, or if the control code is used with an 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-csv_control_param">CSV_CONTROL_PARAM</a> structure containing that enumeration 
 *     value.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-csv_query_mds_path
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CSV_QUERY_MDS_PATH extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The identifier of an MDS node.
     * @type {Integer}
     */
    MdsNodeId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The identifier of a DS node.
     * @type {Integer}
     */
    DsNodeId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The length of the path.
     * @type {Integer}
     */
    PathLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The path.
     * @type {String}
     */
    Path {
        get => StrGet(this.ptr + 12, 0, "UTF-16")
        set => StrPut(value, this.ptr + 12, 0, "UTF-16")
    }
}
