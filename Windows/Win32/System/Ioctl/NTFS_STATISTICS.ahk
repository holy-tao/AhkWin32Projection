#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains statistical information from the NTFS file system.
 * @remarks
 * The MFT, MFT mirror, root index, user index, bitmap, and MFT bitmap are counted as metadata files. The log 
 *     file is not counted as a metadata file.
 * 
 * The number of read and write operations measured is the number of paging operations.
 * 
 * For additional statistics that are only available with Windows 10, use <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-ntfs_statistics_ex">NTFS_STATISTICS_EX</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-ntfs_statistics
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct NTFS_STATISTICS {
    #StructPack 4


    struct _MftWritesUserLevel {
        Write : UInt16

        Create : UInt16

        SetInfo : UInt16

        Flush : UInt16

    }

    struct _Mft2WritesUserLevel {
        Write : UInt16

        Create : UInt16

        SetInfo : UInt16

        Flush : UInt16

    }

    struct _BitmapWritesUserLevel {
        Write : UInt16

        Create : UInt16

        SetInfo : UInt16

    }

    struct _MftBitmapWritesUserLevel {
        Write : UInt16

        Create : UInt16

        SetInfo : UInt16

        Flush : UInt16

    }

    struct _Allocate {
        Calls : UInt32

        Clusters : UInt32

        Hints : UInt32

        RunsReturned : UInt32

        HintsHonored : UInt32

        HintsClusters : UInt32

        Cache : UInt32

        CacheClusters : UInt32

        CacheMiss : UInt32

        CacheMissClusters : UInt32

    }

    /**
     * The number of exceptions generated due to the log file being full.
     */
    LogFileFullExceptions : UInt32

    /**
     * The number of other exceptions generated.
     */
    OtherExceptions : UInt32

    /**
     * The number of read operations on the master file table (MFT).
     */
    MftReads : UInt32

    /**
     * The number of bytes read from the MFT.
     */
    MftReadBytes : UInt32

    /**
     * The number of write operations on the MFT.
     */
    MftWrites : UInt32

    /**
     * The number of bytes written to the MFT.
     */
    MftWriteBytes : UInt32

    MftWritesUserLevel : NTFS_STATISTICS._MftWritesUserLevel

    /**
     * The number of flushes of the MFT performed because the log file was full.
     */
    MftWritesFlushForLogFileFull : UInt16

    /**
     * The number of MFT write operations performed by the lazy writer thread.
     */
    MftWritesLazyWriter : UInt16

    /**
     * Reserved.
     */
    MftWritesUserRequest : UInt16

    /**
     * The number of write operations on the MFT mirror.
     */
    Mft2Writes : UInt32

    /**
     * The number of bytes written to the MFT mirror.
     */
    Mft2WriteBytes : UInt32

    Mft2WritesUserLevel : NTFS_STATISTICS._Mft2WritesUserLevel

    /**
     * The number of flushes of the MFT mirror performed because the log file was full.
     */
    Mft2WritesFlushForLogFileFull : UInt16

    /**
     * The number of MFT mirror write operations performed by the lazy writer thread.
     */
    Mft2WritesLazyWriter : UInt16

    /**
     * Reserved.
     */
    Mft2WritesUserRequest : UInt16

    /**
     * The number of read operations on the root index.
     */
    RootIndexReads : UInt32

    /**
     * The number of bytes read from the root index.
     */
    RootIndexReadBytes : UInt32

    /**
     * The number of write operations on the root index.
     */
    RootIndexWrites : UInt32

    /**
     * The number of bytes written to the root index.
     */
    RootIndexWriteBytes : UInt32

    /**
     * The number of read operations on the cluster allocation bitmap.
     */
    BitmapReads : UInt32

    /**
     * The number of bytes read from the cluster allocation bitmap.
     */
    BitmapReadBytes : UInt32

    /**
     * The number of write operations on the cluster allocation bitmap.
     */
    BitmapWrites : UInt32

    /**
     * The number of bytes written to the cluster allocation bitmap.
     */
    BitmapWriteBytes : UInt32

    /**
     * The number of flushes of the bitmap performed because the log file was full.
     */
    BitmapWritesFlushForLogFileFull : UInt16

    /**
     * The number of bitmap write operations performed by the lazy writer thread.
     */
    BitmapWritesLazyWriter : UInt16

    /**
     * Reserved.
     */
    BitmapWritesUserRequest : UInt16

    BitmapWritesUserLevel : NTFS_STATISTICS._BitmapWritesUserLevel

    /**
     * The number of read operations on the MFT bitmap.
     */
    MftBitmapReads : UInt32

    /**
     * The number of bytes read from the MFT bitmap.
     */
    MftBitmapReadBytes : UInt32

    /**
     * The number of write operations on the MFT bitmap.
     */
    MftBitmapWrites : UInt32

    /**
     * The number of bytes written to the MFT bitmap.
     */
    MftBitmapWriteBytes : UInt32

    /**
     * The number of flushes of the MFT bitmap performed because the log file was full.
     */
    MftBitmapWritesFlushForLogFileFull : UInt16

    /**
     * The number of MFT bitmap write operations performed by the lazy writer thread.
     */
    MftBitmapWritesLazyWriter : UInt16

    /**
     * Reserved.
     */
    MftBitmapWritesUserRequest : UInt16

    MftBitmapWritesUserLevel : NTFS_STATISTICS._MftBitmapWritesUserLevel

    /**
     * The number of read operations on the user index.
     */
    UserIndexReads : UInt32

    /**
     * The number of bytes read from the user index.
     */
    UserIndexReadBytes : UInt32

    /**
     * The number of write operations on the user index.
     */
    UserIndexWrites : UInt32

    /**
     * The number of bytes written to the user index.
     */
    UserIndexWriteBytes : UInt32

    /**
     * The number of read operations on the log file.
     */
    LogFileReads : UInt32

    /**
     * The number of bytes read from the log file.
     */
    LogFileReadBytes : UInt32

    /**
     * The number of write operations on the log file.
     */
    LogFileWrites : UInt32

    /**
     * The number of bytes written to the log file.
     */
    LogFileWriteBytes : UInt32

    Allocate : NTFS_STATISTICS._Allocate

    /**
     * The number of failed attempts made to acquire a slab of storage for use on the current thinly provisioned volume.
     * 
     * Support for this member started with Windows 8.1.
     */
    DiskResourcesExhausted : UInt32

}
