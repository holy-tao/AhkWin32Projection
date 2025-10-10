#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information on range tracking parameters for an update sequence number (USN) change journal using the FSCTL_USN_TRACK_MODIFIED_RANGES control code.
 * @remarks
 * 
  * Once range tracking is enabled for a given volume it cannot be disabled except by deleting the USN Journal and recreating it.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-usn_track_modified_ranges
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class USN_TRACK_MODIFIED_RANGES extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Indicates enabling range tracking.
     * 
     * <table>
     * <tr>
     * <td>Value</td>
     * <td>Description</td>
     * </tr>
     * <tr>
     * <td>FLAG_USN_TRACK_MODIFIED_RANGES_ENABLE 
     * 0x00000001 
     * </td>
     * <td>This flag is mandatory with <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_usn_track_modified_ranges">FSCTL_USN_TRACK_MODIFIED_RANGES</a> and is used to enable range tracking on the volume.</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Unused {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Chunk size for tracking ranges. A single byte modification will be reflected as the whole chunk being modified.
     * @type {Integer}
     */
    ChunkSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * File size threshold to start outputting <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-usn_record_v4">USN_RECORD_V4</a> record(s) for modified file, i.e. if the modified file size is less than this threshold, then no <b>USN_RECORD_V4</b> record will be output.
     * @type {Integer}
     */
    FileSizeThreshold {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }
}
