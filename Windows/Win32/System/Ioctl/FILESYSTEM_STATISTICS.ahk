#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains statistical information from the file system.
 * @remarks
 * There are two types of files: user and metadata. User files are available for the user. Metadata files are 
  *     system files that contain information, which the file system uses for its internal organization.
  * 
  * The number of read and write operations measured is the number of paging operations.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-filesystem_statistics
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FILESYSTEM_STATISTICS extends Win32Struct
{
    static sizeof => 56

    static packingSize => 4

    /**
     * The type of file system.
     * @type {Integer}
     */
    FileSystemType {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * This member is set to 1 (one).
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The size of this structure plus the size of the file system-specific structure that follows this 
     *        structure, multiplied by the number of processors.
     * 
     * This value must be a multiple of 64. For example, if the size of 
     *        <b>FILESYSTEM_STATISTICS</b> is 0x38, the size of 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-ntfs_statistics">NTFS_STATISTICS</a> is 0xD8, and if there are 2 
     *        processors, the buffer allocated must be 0x280.
     * 
     * sizeof(<b>FILESYSTEM_STATISTICS</b>) = 
     *        0x38
     * 
     * sizeof(<a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-ntfs_statistics">NTFS_STATISTICS</a>) = 0xD8
     * 
     * Total Size = 0x110
     * 
     * size of the complete structure = 0x140 (which is the aligned length, a multiple of 64)
     * 
     * multiplied by 2 (the number of processors) = 0x280
     * @type {Integer}
     */
    SizeOfCompleteStructure {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of read operations on user files.
     * @type {Integer}
     */
    UserFileReads {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of bytes read from user files.
     * @type {Integer}
     */
    UserFileReadBytes {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The number of read operations on user files.
     * 
     * This value includes sub-read operations.
     * @type {Integer}
     */
    UserDiskReads {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of write operations on user files.
     * @type {Integer}
     */
    UserFileWrites {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The number of bytes written to user files.
     * @type {Integer}
     */
    UserFileWriteBytes {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The number of write operations on user files.
     * 
     * This value includes sub-write operations.
     * @type {Integer}
     */
    UserDiskWrites {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The number of read operations on metadata files.
     * @type {Integer}
     */
    MetaDataReads {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The number of bytes read from metadata files.
     * @type {Integer}
     */
    MetaDataReadBytes {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The number of read operations on metadata files.
     * 
     * This value includes sub-read operations.
     * @type {Integer}
     */
    MetaDataDiskReads {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The number of write operations on metadata files.
     * @type {Integer}
     */
    MetaDataWrites {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The number of bytes written to metadata files.
     * @type {Integer}
     */
    MetaDataWriteBytes {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The number of write operations on metadata files.
     * 
     * This value includes sub-write operations.
     * @type {Integer}
     */
    MetaDataDiskWrites {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }
}
