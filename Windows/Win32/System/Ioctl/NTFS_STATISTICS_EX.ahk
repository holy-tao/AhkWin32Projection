#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains statistical information from the NTFS file system.Support for this structure started with Windows 10.
 * @remarks
 * The MFT, MFT mirror, root index, user index, bitmap, and MFT bitmap are counted as metadata files. The log 
 *     file is not counted as a metadata file.
 * 
 * The number of read and write operations measured is the number of paging operations.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-ntfs_statistics_ex
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct NTFS_STATISTICS_EX {
    #StructPack 8


    struct _MftWritesUserLevel {
        Write : UInt32

        Create : UInt32

        SetInfo : UInt32

        Flush : UInt32

    }

    struct _Mft2WritesUserLevel {
        Write : UInt32

        Create : UInt32

        SetInfo : UInt32

        Flush : UInt32

    }

    struct _BitmapWritesUserLevel {
        Write : UInt32

        Create : UInt32

        SetInfo : UInt32

        Flush : UInt32

    }

    struct _MftBitmapWritesUserLevel {
        Write : UInt32

        Create : UInt32

        SetInfo : UInt32

        Flush : UInt32

    }

    struct _Allocate {
        Calls : UInt32

        RunsReturned : UInt32

        Hints : UInt32

        HintsHonored : UInt32

        Cache : UInt32

        CacheMiss : UInt32

        Clusters : Int64

        HintsClusters : Int64

        CacheClusters : Int64

        CacheMissClusters : Int64

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
    MftReads : Int64

    /**
     * The number of bytes read from the MFT.
     */
    MftReadBytes : Int64

    /**
     * The number of write operations on the MFT.
     */
    MftWrites : Int64

    /**
     * The number of bytes written to the MFT.
     */
    MftWriteBytes : Int64

    MftWritesUserLevel : NTFS_STATISTICS_EX._MftWritesUserLevel

    /**
     * The number of flushes of the MFT performed because the log file was full.
     */
    MftWritesFlushForLogFileFull : UInt32

    /**
     * The number of MFT write operations performed by the lazy writer thread.
     */
    MftWritesLazyWriter : UInt32

    /**
     * Reserved.
     */
    MftWritesUserRequest : UInt32

    /**
     * The number of write operations on the MFT mirror.
     */
    Mft2Writes : Int64

    /**
     * The number of bytes written to the MFT mirror.
     */
    Mft2WriteBytes : Int64

    Mft2WritesUserLevel : NTFS_STATISTICS_EX._Mft2WritesUserLevel

    /**
     * The number of flushes of the MFT mirror performed because the log file was full.
     */
    Mft2WritesFlushForLogFileFull : UInt32

    /**
     * The number of MFT mirror write operations performed by the lazy writer thread.
     */
    Mft2WritesLazyWriter : UInt32

    /**
     * Reserved.
     */
    Mft2WritesUserRequest : UInt32

    /**
     * The number of read operations on the root index.
     */
    RootIndexReads : Int64

    /**
     * The number of bytes read from the root index.
     */
    RootIndexReadBytes : Int64

    /**
     * The number of write operations on the root index.
     */
    RootIndexWrites : Int64

    /**
     * The number of bytes written to the root index.
     */
    RootIndexWriteBytes : Int64

    /**
     * The number of read operations on the cluster allocation bitmap.
     */
    BitmapReads : Int64

    /**
     * The number of bytes read from the cluster allocation bitmap.
     */
    BitmapReadBytes : Int64

    /**
     * The number of write operations on the cluster allocation bitmap.
     */
    BitmapWrites : Int64

    /**
     * The number of bytes written to the cluster allocation bitmap.
     */
    BitmapWriteBytes : Int64

    /**
     * The number of flushes of the bitmap performed because the log file was full.
     */
    BitmapWritesFlushForLogFileFull : UInt32

    /**
     * The number of bitmap write operations performed by the lazy writer thread.
     */
    BitmapWritesLazyWriter : UInt32

    /**
     * Reserved.
     */
    BitmapWritesUserRequest : UInt32

    BitmapWritesUserLevel : NTFS_STATISTICS_EX._BitmapWritesUserLevel

    /**
     * The number of read operations on the MFT bitmap.
     */
    MftBitmapReads : Int64

    /**
     * The number of bytes read from the MFT bitmap.
     */
    MftBitmapReadBytes : Int64

    /**
     * The number of write operations on the MFT bitmap.
     */
    MftBitmapWrites : Int64

    /**
     * The number of bytes written to the MFT bitmap.
     */
    MftBitmapWriteBytes : Int64

    /**
     * The number of flushes of the MFT bitmap performed because the log file was full.
     */
    MftBitmapWritesFlushForLogFileFull : UInt32

    /**
     * The number of MFT bitmap write operations performed by the lazy writer thread.
     */
    MftBitmapWritesLazyWriter : UInt32

    /**
     * Reserved.
     */
    MftBitmapWritesUserRequest : UInt32

    MftBitmapWritesUserLevel : NTFS_STATISTICS_EX._MftBitmapWritesUserLevel

    /**
     * The number of read operations on the user index.
     */
    UserIndexReads : Int64

    /**
     * The number of bytes read from the user index.
     */
    UserIndexReadBytes : Int64

    /**
     * The number of write operations on the user index.
     */
    UserIndexWrites : Int64

    /**
     * The number of bytes written to the user index.
     */
    UserIndexWriteBytes : Int64

    /**
     * The number of read operations on the log file.
     */
    LogFileReads : Int64

    /**
     * The number of bytes read from the log file.
     */
    LogFileReadBytes : Int64

    /**
     * The number of write operations on the log file.
     */
    LogFileWrites : Int64

    /**
     * The number of bytes written to the log file.
     */
    LogFileWriteBytes : Int64

    Allocate : NTFS_STATISTICS_EX._Allocate

    /**
     * The number of failed attempts made to acquire a slab of storage for use on the current thinly provisioned volume.
     */
    DiskResourcesExhausted : UInt32

    /**
     * The number of volume level trim operations issued.
     */
    VolumeTrimCount : Int64

    /**
     * The total time elapsed during all volume level trim operations.  This value, divided by the frequency value from <a href="https://docs.microsoft.com/windows/win32/api/profileapi/nf-profileapi-queryperformancefrequency">QueryPerformanceFrequency</a> or <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ntifs/nf-ntifs-kequeryperformancecounter">KeQueryPerformanceCounter</a>,  will give the time in seconds.
     */
    VolumeTrimTime : Int64

    /**
     * The total number of bytes issued by all volume level trim operations.
     */
    VolumeTrimByteCount : Int64

    /**
     * The number of file level trim operations issued.
     */
    FileLevelTrimCount : Int64

    /**
     * The total time elapsed during all file level trim operations. This value, divided by the frequency value from <a href="https://docs.microsoft.com/windows/win32/api/profileapi/nf-profileapi-queryperformancefrequency">QueryPerformanceFrequency</a> or <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ntifs/nf-ntifs-kequeryperformancecounter">KeQueryPerformanceCounter</a>, will give the time in seconds.
     */
    FileLevelTrimTime : Int64

    /**
     * The total number of bytes issued by all file level trim operations.
     */
    FileLevelTrimByteCount : Int64

    /**
     * The number of times a volume level trim operation was aborted before being sent down through the storage stack.
     */
    VolumeTrimSkippedCount : Int64

    /**
     * The number of bytes  that were not sent through a volume level trim operation because they were skipped.
     */
    VolumeTrimSkippedByteCount : Int64

    NtfsFillStatInfoFromMftRecordCalledCount : Int64

    NtfsFillStatInfoFromMftRecordBailedBecauseOfAttributeListCount : Int64

    NtfsFillStatInfoFromMftRecordBailedBecauseOfNonResReparsePointCount : Int64

}
