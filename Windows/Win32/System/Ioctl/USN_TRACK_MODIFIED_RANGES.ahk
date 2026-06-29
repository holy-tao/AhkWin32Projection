#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information on range tracking parameters for an update sequence number (USN) change journal using the FSCTL_USN_TRACK_MODIFIED_RANGES control code.
 * @remarks
 * Once range tracking is enabled for a given volume it cannot be disabled except by deleting the USN Journal and recreating it.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-usn_track_modified_ranges
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct USN_TRACK_MODIFIED_RANGES {
    #StructPack 8

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
     */
    Flags : UInt32

    /**
     * Reserved.
     */
    Unused : UInt32

    /**
     * Chunk size for tracking ranges. A single byte modification will be reflected as the whole chunk being modified.
     */
    ChunkSize : Int64

    /**
     * File size threshold to start outputting [USN_RECORD_V4 structure](ns-winioctl-usn_record_v4.md) record(s) for modified file, i.e. if the modified file size is less than this threshold, then no <b>USN_RECORD_V4</b> record will be output.
     */
    FileSizeThreshold : Int64

}
