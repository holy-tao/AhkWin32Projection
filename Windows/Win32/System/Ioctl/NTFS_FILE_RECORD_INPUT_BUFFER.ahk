#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains data for the FSCTL_GET_NTFS_FILE_RECORD control code.
 * @remarks
 * 
 * Pass this structure as input to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_get_ntfs_file_record">FSCTL_GET_NTFS_FILE_RECORD</a> control code.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-ntfs_file_record_input_buffer
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class NTFS_FILE_RECORD_INPUT_BUFFER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The file identifier of the file record to be retrieved. This is not necessarily the file identifier returned in the <b>FileReferenceNumber</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-ntfs_file_record_output_buffer">NTFS_FILE_RECORD_OUTPUT_BUFFER</a> structure. Refer to the Remarks section of the reference page for 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_get_ntfs_file_record">FSCTL_GET_NTFS_FILE_RECORD</a> for more information.
     * @type {Integer}
     */
    FileReferenceNumber {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }
}
