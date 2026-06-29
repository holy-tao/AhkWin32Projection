#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

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
 */
export default struct CSV_QUERY_MDS_PATH {
    #StructPack 4

    /**
     * The identifier of an MDS node.
     */
    MdsNodeId : UInt32

    /**
     * The identifier of a DS node.
     */
    DsNodeId : UInt32

    /**
     * The length of the path.
     */
    PathLength : UInt32

    /**
     * The path.
     */
    Path : WCHAR[1]

}
