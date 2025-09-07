#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the output for the FSCTL_IS_CSV_FILE control code that retrieves namespace information for a file.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-csv_namespace_info
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CSV_NAMESPACE_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

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
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The device number of the disk.
     * @type {Integer}
     */
    DeviceNumber {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The starting offset of the volume.
     * @type {Integer}
     */
    StartingOffset {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * The sector size of the disk.
     * @type {Integer}
     */
    SectorSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
