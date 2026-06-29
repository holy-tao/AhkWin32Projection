#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILESYSTEM_STATISTICS_TYPE.ahk" { FILESYSTEM_STATISTICS_TYPE }

/**
 * Contains statistical information from the file system.Support for this structure started with Windows 10.
 * @remarks
 * There are two types of files: user and metadata. User files are available for the user. Metadata files are 
 *     system files that contain information, which the file system uses for its internal organization.
 * 
 * The number of read and write operations measured is the number of paging operations.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-filesystem_statistics_ex
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILESYSTEM_STATISTICS_EX {
    #StructPack 8

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
     */
    SizeOfCompleteStructure : UInt32

    /**
     * The number of read operations on user files.
     */
    UserFileReads : Int64

    /**
     * The number of bytes read from user files.
     */
    UserFileReadBytes : Int64

    /**
     * The number of read operations on user files.
     * 
     * This value includes sub-read operations.
     */
    UserDiskReads : Int64

    /**
     * The number of write operations on user files.
     */
    UserFileWrites : Int64

    /**
     * The number of bytes written to user files.
     */
    UserFileWriteBytes : Int64

    /**
     * The number of write operations on user files.
     * 
     * This value includes sub-write operations.
     */
    UserDiskWrites : Int64

    /**
     * The number of read operations on metadata files.
     */
    MetaDataReads : Int64

    /**
     * The number of bytes read from metadata files.
     */
    MetaDataReadBytes : Int64

    /**
     * The number of read operations on metadata files.
     * 
     * This value includes sub-read operations.
     */
    MetaDataDiskReads : Int64

    /**
     * The number of write operations on metadata files.
     */
    MetaDataWrites : Int64

    /**
     * The number of bytes written to metadata files.
     */
    MetaDataWriteBytes : Int64

    /**
     * The number of write operations on metadata files.
     * 
     * This value includes sub-write operations.
     */
    MetaDataDiskWrites : Int64

}
