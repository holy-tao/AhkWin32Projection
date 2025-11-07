#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Receives output data from the FSCTL_GET_NTFS_FILE_RECORD control code.
 * @remarks
 * 
 * To retrieve data to fill in this structure, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-deviceiocontrol">DeviceIoControl</a>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_get_ntfs_file_record">FSCTL_GET_NTFS_FILE_RECORD</a> control code.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-ntfs_file_record_output_buffer
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class NTFS_FILE_RECORD_OUTPUT_BUFFER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The file identifier of the returned file record. This is not necessarily the file identifier specified in the <b>FileReferenceNumber</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-ntfs_file_record_input_buffer">NTFS_FILE_RECORD_INPUT_BUFFER</a> structure. Refer to the Remarks section of the reference page for 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_get_ntfs_file_record">FSCTL_GET_NTFS_FILE_RECORD</a> for more information.
     * @type {Integer}
     */
    FileReferenceNumber {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * The length of the returned file record, in bytes.
     * @type {Integer}
     */
    FileRecordLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The starting location of the buffer for the returned file record.
     * @type {Array<Byte>}
     */
    FileRecordBuffer{
        get {
            if(!this.HasProp("__FileRecordBufferProxyArray"))
                this.__FileRecordBufferProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__FileRecordBufferProxyArray
        }
    }
}
