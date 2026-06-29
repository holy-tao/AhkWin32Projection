#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Receives output data from the FSCTL_GET_NTFS_FILE_RECORD control code.
 * @remarks
 * To retrieve data to fill in this structure, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-deviceiocontrol">DeviceIoControl</a>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_get_ntfs_file_record">FSCTL_GET_NTFS_FILE_RECORD</a> control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-ntfs_file_record_output_buffer
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct NTFS_FILE_RECORD_OUTPUT_BUFFER {
    #StructPack 8

    /**
     * The file identifier of the returned file record. This is not necessarily the file identifier specified in the <b>FileReferenceNumber</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-ntfs_file_record_input_buffer">NTFS_FILE_RECORD_INPUT_BUFFER</a> structure. Refer to the Remarks section of the reference page for 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_get_ntfs_file_record">FSCTL_GET_NTFS_FILE_RECORD</a> for more information.
     */
    FileReferenceNumber : Int64

    /**
     * The length of the returned file record, in bytes.
     */
    FileRecordLength : UInt32

    /**
     * The starting location of the buffer for the returned file record.
     */
    FileRecordBuffer : Int8[1]

}
