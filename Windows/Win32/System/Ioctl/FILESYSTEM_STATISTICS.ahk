#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILESYSTEM_STATISTICS_TYPE.ahk" { FILESYSTEM_STATISTICS_TYPE }

/**
 * Contains statistical information from the file system.
 * @remarks
 * There are two types of files: user and metadata. User files are available for the user. Metadata files are 
 *     system files that contain information, which the file system uses for its internal organization.
 * 
 * The number of read and write operations measured is the number of paging operations.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-filesystem_statistics
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILESYSTEM_STATISTICS {
    #StructPack 4

    /**
     * The type of file system.
     */
    FileSystemType : FILESYSTEM_STATISTICS_TYPE

    /**
     * This member is set to 1 (one).
     */
    Version : UInt16

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
     */
    SizeOfCompleteStructure : UInt32

    /**
     * The number of read operations on user files.
     */
    UserFileReads : UInt32

    /**
     * The number of bytes read from user files.
     */
    UserFileReadBytes : UInt32

    /**
     * The number of read operations on user files.
     * 
     * This value includes sub-read operations.
     */
    UserDiskReads : UInt32

    /**
     * The number of write operations on user files.
     */
    UserFileWrites : UInt32

    /**
     * The number of bytes written to user files.
     */
    UserFileWriteBytes : UInt32

    /**
     * The number of write operations on user files.
     * 
     * This value includes sub-write operations.
     */
    UserDiskWrites : UInt32

    /**
     * The number of read operations on metadata files.
     */
    MetaDataReads : UInt32

    /**
     * The number of bytes read from metadata files.
     */
    MetaDataReadBytes : UInt32

    /**
     * The number of read operations on metadata files.
     * 
     * This value includes sub-read operations.
     */
    MetaDataDiskReads : UInt32

    /**
     * The number of write operations on metadata files.
     */
    MetaDataWrites : UInt32

    /**
     * The number of bytes written to metadata files.
     */
    MetaDataWriteBytes : UInt32

    /**
     * The number of write operations on metadata files.
     * 
     * This value includes sub-write operations.
     */
    MetaDataDiskWrites : UInt32

}
