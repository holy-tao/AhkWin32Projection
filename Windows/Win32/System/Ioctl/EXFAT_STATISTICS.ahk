#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains statistical information from the exFAT file system.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-exfat_statistics
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct EXFAT_STATISTICS {
    #StructPack 4

    /**
     * The number of create operations.
     */
    CreateHits : UInt32

    /**
     * The number of successful create operations.
     */
    SuccessfulCreates : UInt32

    /**
     * The number of failed create operations.
     */
    FailedCreates : UInt32

    /**
     * The number of read operations that were not cached.
     */
    NonCachedReads : UInt32

    /**
     * The number of bytes read from a file that were not cached.
     */
    NonCachedReadBytes : UInt32

    /**
     * The number of write operations that were not cached.
     */
    NonCachedWrites : UInt32

    /**
     * The number of bytes written to a file that were not cached.
     */
    NonCachedWriteBytes : UInt32

    /**
     * The number of read operations that were not cached. This value includes sub-read operations.
     */
    NonCachedDiskReads : UInt32

    /**
     * The number of write operations that were not cached. This value includes sub-write operations.
     */
    NonCachedDiskWrites : UInt32

}
