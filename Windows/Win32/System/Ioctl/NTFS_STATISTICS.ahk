#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class NTFS_STATISTICS extends Win32Struct
{
    static sizeof => 224

    static packingSize => 8

    /**
     * The number of exceptions generated due to the log file being full.
     * @type {Integer}
     */
    LogFileFullExceptions {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of other exceptions generated.
     * @type {Integer}
     */
    OtherExceptions {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of read operations on the master file table (MFT).
     * @type {Integer}
     */
    MftReads {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of bytes read from the MFT.
     * @type {Integer}
     */
    MftReadBytes {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The number of write operations on the MFT.
     * @type {Integer}
     */
    MftWrites {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of bytes written to the MFT.
     * @type {Integer}
     */
    MftWriteBytes {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    Write {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Create {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }

    /**
     * @type {Integer}
     */
    SetInfo {
        get => NumGet(this, 28, "ushort")
        set => NumPut("ushort", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    Flush {
        get => NumGet(this, 30, "ushort")
        set => NumPut("ushort", value, this, 30)
    }

    /**
     * The number of flushes of the MFT performed because the log file was full.
     * @type {Integer}
     */
    MftWritesFlushForLogFileFull {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * The number of MFT write operations performed by the lazy writer thread.
     * @type {Integer}
     */
    MftWritesLazyWriter {
        get => NumGet(this, 34, "ushort")
        set => NumPut("ushort", value, this, 34)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    MftWritesUserRequest {
        get => NumGet(this, 36, "ushort")
        set => NumPut("ushort", value, this, 36)
    }

    /**
     * The number of write operations on the MFT mirror.
     * @type {Integer}
     */
    Mft2Writes {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The number of bytes written to the MFT mirror.
     * @type {Integer}
     */
    Mft2WriteBytes {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The number of flushes of the MFT mirror performed because the log file was full.
     * @type {Integer}
     */
    Mft2WritesFlushForLogFileFull {
        get => NumGet(this, 56, "ushort")
        set => NumPut("ushort", value, this, 56)
    }

    /**
     * The number of MFT mirror write operations performed by the lazy writer thread.
     * @type {Integer}
     */
    Mft2WritesLazyWriter {
        get => NumGet(this, 58, "ushort")
        set => NumPut("ushort", value, this, 58)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Mft2WritesUserRequest {
        get => NumGet(this, 60, "ushort")
        set => NumPut("ushort", value, this, 60)
    }

    /**
     * The number of read operations on the root index.
     * @type {Integer}
     */
    RootIndexReads {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The number of bytes read from the root index.
     * @type {Integer}
     */
    RootIndexReadBytes {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * The number of write operations on the root index.
     * @type {Integer}
     */
    RootIndexWrites {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * The number of bytes written to the root index.
     * @type {Integer}
     */
    RootIndexWriteBytes {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * The number of read operations on the cluster allocation bitmap.
     * @type {Integer}
     */
    BitmapReads {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * The number of bytes read from the cluster allocation bitmap.
     * @type {Integer}
     */
    BitmapReadBytes {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * The number of write operations on the cluster allocation bitmap.
     * @type {Integer}
     */
    BitmapWrites {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * The number of bytes written to the cluster allocation bitmap.
     * @type {Integer}
     */
    BitmapWriteBytes {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * The number of flushes of the bitmap performed because the log file was full.
     * @type {Integer}
     */
    BitmapWritesFlushForLogFileFull {
        get => NumGet(this, 96, "ushort")
        set => NumPut("ushort", value, this, 96)
    }

    /**
     * The number of bitmap write operations performed by the lazy writer thread.
     * @type {Integer}
     */
    BitmapWritesLazyWriter {
        get => NumGet(this, 98, "ushort")
        set => NumPut("ushort", value, this, 98)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    BitmapWritesUserRequest {
        get => NumGet(this, 100, "ushort")
        set => NumPut("ushort", value, this, 100)
    }

    /**
     * The number of read operations on the MFT bitmap.
     * @type {Integer}
     */
    MftBitmapReads {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * The number of bytes read from the MFT bitmap.
     * @type {Integer}
     */
    MftBitmapReadBytes {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * The number of write operations on the MFT bitmap.
     * @type {Integer}
     */
    MftBitmapWrites {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * The number of bytes written to the MFT bitmap.
     * @type {Integer}
     */
    MftBitmapWriteBytes {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * The number of flushes of the MFT bitmap performed because the log file was full.
     * @type {Integer}
     */
    MftBitmapWritesFlushForLogFileFull {
        get => NumGet(this, 124, "ushort")
        set => NumPut("ushort", value, this, 124)
    }

    /**
     * The number of MFT bitmap write operations performed by the lazy writer thread.
     * @type {Integer}
     */
    MftBitmapWritesLazyWriter {
        get => NumGet(this, 126, "ushort")
        set => NumPut("ushort", value, this, 126)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    MftBitmapWritesUserRequest {
        get => NumGet(this, 128, "ushort")
        set => NumPut("ushort", value, this, 128)
    }

    /**
     * The number of read operations on the user index.
     * @type {Integer}
     */
    UserIndexReads {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * The number of bytes read from the user index.
     * @type {Integer}
     */
    UserIndexReadBytes {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * The number of write operations on the user index.
     * @type {Integer}
     */
    UserIndexWrites {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * The number of bytes written to the user index.
     * @type {Integer}
     */
    UserIndexWriteBytes {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * The number of read operations on the log file.
     * @type {Integer}
     */
    LogFileReads {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * The number of bytes read from the log file.
     * @type {Integer}
     */
    LogFileReadBytes {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * The number of write operations on the log file.
     * @type {Integer}
     */
    LogFileWrites {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * The number of bytes written to the log file.
     * @type {Integer}
     */
    LogFileWriteBytes {
        get => NumGet(this, 172, "uint")
        set => NumPut("uint", value, this, 172)
    }

    /**
     * @type {Integer}
     */
    Calls {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * @type {Integer}
     */
    Clusters {
        get => NumGet(this, 180, "uint")
        set => NumPut("uint", value, this, 180)
    }

    /**
     * @type {Integer}
     */
    Hints {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * @type {Integer}
     */
    RunsReturned {
        get => NumGet(this, 188, "uint")
        set => NumPut("uint", value, this, 188)
    }

    /**
     * @type {Integer}
     */
    HintsHonored {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * @type {Integer}
     */
    HintsClusters {
        get => NumGet(this, 196, "uint")
        set => NumPut("uint", value, this, 196)
    }

    /**
     * @type {Integer}
     */
    Cache {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * @type {Integer}
     */
    CacheClusters {
        get => NumGet(this, 204, "uint")
        set => NumPut("uint", value, this, 204)
    }

    /**
     * @type {Integer}
     */
    CacheMiss {
        get => NumGet(this, 208, "uint")
        set => NumPut("uint", value, this, 208)
    }

    /**
     * @type {Integer}
     */
    CacheMissClusters {
        get => NumGet(this, 212, "uint")
        set => NumPut("uint", value, this, 212)
    }

    /**
     * The number of failed attempts made to acquire a slab of storage for use on the current thinly provisioned volume.
     * 
     * Support for this member started with Windows 8.1.
     * @type {Integer}
     */
    DiskResourcesExhausted {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }
}
