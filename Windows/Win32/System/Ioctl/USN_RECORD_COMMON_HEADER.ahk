#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the information for an update sequence number (USN) common header which is common through USN_RECORD_V2, USN_RECORD_V3 and USN_RECORD_V4.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-usn_record_common_header
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class USN_RECORD_COMMON_HEADER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The total length of a record, in bytes.
     * 
     * Because USN record is a variable size, the <b>RecordLength</b> member should be used when calculating the address of the next record in an output buffer, for example, a buffer that is returned from operations for the <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-deviceiocontrol">DeviceIoControl</a> function that work with different USN record types.
     * 
     * For [USN_RECORD_V4 structure](ns-winioctl-usn_record_v4.md), the size in bytes of any change journal record is at most the size of the structure, plus (NumberOfExtents-1) times size of the <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-usn_record_extent">USN_RECORD_EXTENT</a>.
     * @type {Integer}
     */
    RecordLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The major version number of the change journal software for this record.
     * 
     * For example, if the change journal software is version 4.0, the major version number is 4.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>The structure is a <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-usn_record_v2">USN_RECORD_V2</a> structure and the remainder of the structure should be parsed using that layout.</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>The structure is a <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-usn_record_v3">USN_RECORD_V3</a> structure and the remainder of the structure should be parsed using that layout.</td>
     * </tr>
     * <tr>
     * <td>4</td>
     * <td>The structure is a [USN_RECORD_V4 structure](ns-winioctl-usn_record_v4.md) and the remainder of the structure should be parsed using that layout.</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    MajorVersion {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * The minor version number of the change journal software for this record. For example, if the change journal software is version 4.0, the minor version number is zero.
     * @type {Integer}
     */
    MinorVersion {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
