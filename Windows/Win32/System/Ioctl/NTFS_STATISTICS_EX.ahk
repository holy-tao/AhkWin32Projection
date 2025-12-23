#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains statistical information from the NTFS file system.Support for this structure started with Windows 10.
 * @remarks
 * The MFT, MFT mirror, root index, user index, bitmap, and MFT bitmap are counted as metadata files. The log 
 *     file is not counted as a metadata file.
 * 
 * The number of read and write operations measured is the number of paging operations.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-ntfs_statistics_ex
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class NTFS_STATISTICS_EX extends Win32Struct
{
    static sizeof => 496

    static packingSize => 8

    class _MftWritesUserLevel extends Win32Struct {
        static sizeof => 16
        static packingSize => 4

        /**
         * @type {Integer}
         */
        Write {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Create {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        SetInfo {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        Flush {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
    }

    class _Mft2WritesUserLevel extends Win32Struct {
        static sizeof => 16
        static packingSize => 4

        /**
         * @type {Integer}
         */
        Write {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Create {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        SetInfo {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        Flush {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
    }

    class _BitmapWritesUserLevel extends Win32Struct {
        static sizeof => 16
        static packingSize => 4

        /**
         * @type {Integer}
         */
        Write {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Create {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        SetInfo {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        Flush {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
    }

    class _MftBitmapWritesUserLevel extends Win32Struct {
        static sizeof => 16
        static packingSize => 4

        /**
         * @type {Integer}
         */
        Write {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Create {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        SetInfo {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        Flush {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
    }

    class _Allocate extends Win32Struct {
        static sizeof => 56
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Calls {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        RunsReturned {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        Hints {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        HintsHonored {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
        /**
         * @type {Integer}
         */
        Cache {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        CacheMiss {
            get => NumGet(this, 20, "uint")
            set => NumPut("uint", value, this, 20)
        }
    
        /**
         * @type {Integer}
         */
        Clusters {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }
    
        /**
         * @type {Integer}
         */
        HintsClusters {
            get => NumGet(this, 32, "uint")
            set => NumPut("uint", value, this, 32)
        }
    
        /**
         * @type {Integer}
         */
        CacheClusters {
            get => NumGet(this, 40, "uint")
            set => NumPut("uint", value, this, 40)
        }
    
        /**
         * @type {Integer}
         */
        CacheMissClusters {
            get => NumGet(this, 48, "uint")
            set => NumPut("uint", value, this, 48)
        }
    
    }

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
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of write operations on the MFT.
     * @type {Integer}
     */
    MftWrites {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The number of bytes written to the MFT.
     * @type {Integer}
     */
    MftWriteBytes {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * 
     * @type {_MftWritesUserLevel}
     */
    MftWritesUserLevel{
        get {
            if(!this.HasProp("__MftWritesUserLevel"))
                this.__MftWritesUserLevel := %this.__Class%._MftWritesUserLevel(40, this)
            return this.__MftWritesUserLevel
        }
    }

    /**
     * The number of flushes of the MFT performed because the log file was full.
     * @type {Integer}
     */
    MftWritesFlushForLogFileFull {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The number of MFT write operations performed by the lazy writer thread.
     * @type {Integer}
     */
    MftWritesLazyWriter {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    MftWritesUserRequest {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The number of write operations on the MFT mirror.
     * @type {Integer}
     */
    Mft2Writes {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * The number of bytes written to the MFT mirror.
     * @type {Integer}
     */
    Mft2WriteBytes {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * 
     * @type {_Mft2WritesUserLevel}
     */
    Mft2WritesUserLevel{
        get {
            if(!this.HasProp("__Mft2WritesUserLevel"))
                this.__Mft2WritesUserLevel := %this.__Class%._Mft2WritesUserLevel(88, this)
            return this.__Mft2WritesUserLevel
        }
    }

    /**
     * The number of flushes of the MFT mirror performed because the log file was full.
     * @type {Integer}
     */
    Mft2WritesFlushForLogFileFull {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * The number of MFT mirror write operations performed by the lazy writer thread.
     * @type {Integer}
     */
    Mft2WritesLazyWriter {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Mft2WritesUserRequest {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * The number of read operations on the root index.
     * @type {Integer}
     */
    RootIndexReads {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * The number of bytes read from the root index.
     * @type {Integer}
     */
    RootIndexReadBytes {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * The number of write operations on the root index.
     * @type {Integer}
     */
    RootIndexWrites {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * The number of bytes written to the root index.
     * @type {Integer}
     */
    RootIndexWriteBytes {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * The number of read operations on the cluster allocation bitmap.
     * @type {Integer}
     */
    BitmapReads {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * The number of bytes read from the cluster allocation bitmap.
     * @type {Integer}
     */
    BitmapReadBytes {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * The number of write operations on the cluster allocation bitmap.
     * @type {Integer}
     */
    BitmapWrites {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * The number of bytes written to the cluster allocation bitmap.
     * @type {Integer}
     */
    BitmapWriteBytes {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * The number of flushes of the bitmap performed because the log file was full.
     * @type {Integer}
     */
    BitmapWritesFlushForLogFileFull {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * The number of bitmap write operations performed by the lazy writer thread.
     * @type {Integer}
     */
    BitmapWritesLazyWriter {
        get => NumGet(this, 188, "uint")
        set => NumPut("uint", value, this, 188)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    BitmapWritesUserRequest {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * 
     * @type {_BitmapWritesUserLevel}
     */
    BitmapWritesUserLevel{
        get {
            if(!this.HasProp("__BitmapWritesUserLevel"))
                this.__BitmapWritesUserLevel := %this.__Class%._BitmapWritesUserLevel(196, this)
            return this.__BitmapWritesUserLevel
        }
    }

    /**
     * The number of read operations on the MFT bitmap.
     * @type {Integer}
     */
    MftBitmapReads {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * The number of bytes read from the MFT bitmap.
     * @type {Integer}
     */
    MftBitmapReadBytes {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }

    /**
     * The number of write operations on the MFT bitmap.
     * @type {Integer}
     */
    MftBitmapWrites {
        get => NumGet(this, 232, "uint")
        set => NumPut("uint", value, this, 232)
    }

    /**
     * The number of bytes written to the MFT bitmap.
     * @type {Integer}
     */
    MftBitmapWriteBytes {
        get => NumGet(this, 240, "uint")
        set => NumPut("uint", value, this, 240)
    }

    /**
     * The number of flushes of the MFT bitmap performed because the log file was full.
     * @type {Integer}
     */
    MftBitmapWritesFlushForLogFileFull {
        get => NumGet(this, 248, "uint")
        set => NumPut("uint", value, this, 248)
    }

    /**
     * The number of MFT bitmap write operations performed by the lazy writer thread.
     * @type {Integer}
     */
    MftBitmapWritesLazyWriter {
        get => NumGet(this, 252, "uint")
        set => NumPut("uint", value, this, 252)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    MftBitmapWritesUserRequest {
        get => NumGet(this, 256, "uint")
        set => NumPut("uint", value, this, 256)
    }

    /**
     * 
     * @type {_MftBitmapWritesUserLevel}
     */
    MftBitmapWritesUserLevel{
        get {
            if(!this.HasProp("__MftBitmapWritesUserLevel"))
                this.__MftBitmapWritesUserLevel := %this.__Class%._MftBitmapWritesUserLevel(260, this)
            return this.__MftBitmapWritesUserLevel
        }
    }

    /**
     * The number of read operations on the user index.
     * @type {Integer}
     */
    UserIndexReads {
        get => NumGet(this, 280, "uint")
        set => NumPut("uint", value, this, 280)
    }

    /**
     * The number of bytes read from the user index.
     * @type {Integer}
     */
    UserIndexReadBytes {
        get => NumGet(this, 288, "uint")
        set => NumPut("uint", value, this, 288)
    }

    /**
     * The number of write operations on the user index.
     * @type {Integer}
     */
    UserIndexWrites {
        get => NumGet(this, 296, "uint")
        set => NumPut("uint", value, this, 296)
    }

    /**
     * The number of bytes written to the user index.
     * @type {Integer}
     */
    UserIndexWriteBytes {
        get => NumGet(this, 304, "uint")
        set => NumPut("uint", value, this, 304)
    }

    /**
     * The number of read operations on the log file.
     * @type {Integer}
     */
    LogFileReads {
        get => NumGet(this, 312, "uint")
        set => NumPut("uint", value, this, 312)
    }

    /**
     * The number of bytes read from the log file.
     * @type {Integer}
     */
    LogFileReadBytes {
        get => NumGet(this, 320, "uint")
        set => NumPut("uint", value, this, 320)
    }

    /**
     * The number of write operations on the log file.
     * @type {Integer}
     */
    LogFileWrites {
        get => NumGet(this, 328, "uint")
        set => NumPut("uint", value, this, 328)
    }

    /**
     * The number of bytes written to the log file.
     * @type {Integer}
     */
    LogFileWriteBytes {
        get => NumGet(this, 336, "uint")
        set => NumPut("uint", value, this, 336)
    }

    /**
     * 
     * @type {_Allocate}
     */
    Allocate{
        get {
            if(!this.HasProp("__Allocate"))
                this.__Allocate := %this.__Class%._Allocate(344, this)
            return this.__Allocate
        }
    }

    /**
     * The number of failed attempts made to acquire a slab of storage for use on the current thinly provisioned volume.
     * @type {Integer}
     */
    DiskResourcesExhausted {
        get => NumGet(this, 400, "uint")
        set => NumPut("uint", value, this, 400)
    }

    /**
     * The number of volume level trim operations issued.
     * @type {Integer}
     */
    VolumeTrimCount {
        get => NumGet(this, 408, "uint")
        set => NumPut("uint", value, this, 408)
    }

    /**
     * The total time elapsed during all volume level trim operations.  This value, divided by the frequency value from <a href="https://docs.microsoft.com/windows/win32/api/profileapi/nf-profileapi-queryperformancefrequency">QueryPerformanceFrequency</a> or <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ntifs/nf-ntifs-kequeryperformancecounter">KeQueryPerformanceCounter</a>,  will give the time in seconds.
     * @type {Integer}
     */
    VolumeTrimTime {
        get => NumGet(this, 416, "uint")
        set => NumPut("uint", value, this, 416)
    }

    /**
     * The total number of bytes issued by all volume level trim operations.
     * @type {Integer}
     */
    VolumeTrimByteCount {
        get => NumGet(this, 424, "uint")
        set => NumPut("uint", value, this, 424)
    }

    /**
     * The number of file level trim operations issued.
     * @type {Integer}
     */
    FileLevelTrimCount {
        get => NumGet(this, 432, "uint")
        set => NumPut("uint", value, this, 432)
    }

    /**
     * The total time elapsed during all file level trim operations. This value, divided by the frequency value from <a href="https://docs.microsoft.com/windows/win32/api/profileapi/nf-profileapi-queryperformancefrequency">QueryPerformanceFrequency</a> or <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ntifs/nf-ntifs-kequeryperformancecounter">KeQueryPerformanceCounter</a>, will give the time in seconds.
     * @type {Integer}
     */
    FileLevelTrimTime {
        get => NumGet(this, 440, "uint")
        set => NumPut("uint", value, this, 440)
    }

    /**
     * The total number of bytes issued by all file level trim operations.
     * @type {Integer}
     */
    FileLevelTrimByteCount {
        get => NumGet(this, 448, "uint")
        set => NumPut("uint", value, this, 448)
    }

    /**
     * The number of times a volume level trim operation was aborted before being sent down through the storage stack.
     * @type {Integer}
     */
    VolumeTrimSkippedCount {
        get => NumGet(this, 456, "uint")
        set => NumPut("uint", value, this, 456)
    }

    /**
     * The number of bytes  that were not sent through a volume level trim operation because they were skipped.
     * @type {Integer}
     */
    VolumeTrimSkippedByteCount {
        get => NumGet(this, 464, "uint")
        set => NumPut("uint", value, this, 464)
    }

    /**
     * 
     * @type {Integer}
     */
    NtfsFillStatInfoFromMftRecordCalledCount {
        get => NumGet(this, 472, "uint")
        set => NumPut("uint", value, this, 472)
    }

    /**
     * 
     * @type {Integer}
     */
    NtfsFillStatInfoFromMftRecordBailedBecauseOfAttributeListCount {
        get => NumGet(this, 480, "uint")
        set => NumPut("uint", value, this, 480)
    }

    /**
     * 
     * @type {Integer}
     */
    NtfsFillStatInfoFromMftRecordBailedBecauseOfNonResReparsePointCount {
        get => NumGet(this, 488, "uint")
        set => NumPut("uint", value, this, 488)
    }
}
