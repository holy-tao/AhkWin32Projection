#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the output for the FSCTL_IS_CSV_FILE control code that retrieves namespace information for a file.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-csv_namespace_info
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct CSV_NAMESPACE_INFO {
    #StructPack 8

    /**
     * The version number. This value must be set to <b>CSV_NAMESPACE_INFO_V1</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CSV_NAMESPACE_INFO_V1"></a><a id="csv_namespace_info_v1"></a><dl>
     * <dt><b>CSV_NAMESPACE_INFO_V1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Version 1.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Version : UInt32

    /**
     * The device number of the disk.
     */
    DeviceNumber : UInt32

    /**
     * The starting offset of the volume.
     */
    StartingOffset : Int64

    /**
     * The sector size of the disk.
     */
    SectorSize : UInt32

}
