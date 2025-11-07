#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains statistical information from the file system.Support for this structure started with Windows 10.
 * @remarks
 * 
 * There are two types of files: user and metadata. User files are available for the user. Metadata files are 
 *     system files that contain information, which the file system uses for its internal organization.
 * 
 * The number of read and write operations measured is the number of paging operations.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-filesystem_statistics_ex
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FILESYSTEM_STATISTICS_EX extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

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
     *        <b>FILESYSTEM_STATISTICS_EX</b> is 0x68, the size of 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-ntfs_statistics_ex">NTFS_STATISTICS_EX</a> is 0x1D8, and if there are 2 
     *        processors, the buffer allocated must be 0x480.
     * 
     * sizeof(<b>FILESYSTEM_STATISTICS_EX</b>) = 
     *        0x68
     * 
     * sizeof(<a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-ntfs_statistics_ex">NTFS_STATISTICS_EX</a>) = 0x1D8
     * 
     * Total Size = 0x240
     * 
     * size of the complete structure = 0x240 (which is the aligned length, a multiple of 64)
     * 
     * multiplied by 2 (the number of processors) = 0x480
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
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of read operations on user files.
     * 
     * This value includes sub-read operations.
     * @type {Integer}
     */
    UserDiskReads {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The number of write operations on user files.
     * @type {Integer}
     */
    UserFileWrites {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The number of bytes written to user files.
     * @type {Integer}
     */
    UserFileWriteBytes {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The number of write operations on user files.
     * 
     * This value includes sub-write operations.
     * @type {Integer}
     */
    UserDiskWrites {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The number of read operations on metadata files.
     * @type {Integer}
     */
    MetaDataReads {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The number of bytes read from metadata files.
     * @type {Integer}
     */
    MetaDataReadBytes {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The number of read operations on metadata files.
     * 
     * This value includes sub-read operations.
     * @type {Integer}
     */
    MetaDataDiskReads {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * The number of write operations on metadata files.
     * @type {Integer}
     */
    MetaDataWrites {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * The number of bytes written to metadata files.
     * @type {Integer}
     */
    MetaDataWriteBytes {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * The number of write operations on metadata files.
     * 
     * This value includes sub-write operations.
     * @type {Integer}
     */
    MetaDataDiskWrites {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }
}
