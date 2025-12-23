#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Receives the volume information from a call to FSCTL_QUERY_ON_DISK_VOLUME_INFO.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-file_query_on_disk_vol_info_buffer
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FILE_QUERY_ON_DISK_VOL_INFO_BUFFER extends Win32Struct
{
    static sizeof => 336

    static packingSize => 8

    /**
     * The number of directories on the specified disk. This member is -1 if the number is unknown. 
     * 
     * For UDF file systems with a virtual allocation table, this information is available only if the UDF revision is greater than 1.50.
     * @type {Integer}
     */
    DirectoryCount {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * The number of files on the specified disk. Returns -1 if the number is unknown.
     * 
     * For UDF file systems with a virtual allocation table, this information is available only if the UDF revision is greater than 1.50.
     * @type {Integer}
     */
    FileCount {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * The major version number of the file system. Returns -1 if the number is unknown or not applicable. On UDF 1.02 file systems, 1 is returned.
     * @type {Integer}
     */
    FsFormatMajVersion {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * The minor version number of the file system. Returns -1 if the number is unknown or not applicable.  On UDF 1.02 file systems, 02 is returned.
     * @type {Integer}
     */
    FsFormatMinVersion {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * Always returns UDF.
     * @type {String}
     */
    FsFormatName {
        get => StrGet(this.ptr + 20, 11, "UTF-16")
        set => StrPut(value, this.ptr + 20, 11, "UTF-16")
    }

    /**
     * The time the media was formatted.
     * @type {Integer}
     */
    FormatTime {
        get => NumGet(this, 48, "int64")
        set => NumPut("int64", value, this, 48)
    }

    /**
     * The time the media was last updated.
     * @type {Integer}
     */
    LastUpdateTime {
        get => NumGet(this, 56, "int64")
        set => NumPut("int64", value, this, 56)
    }

    /**
     * Any copyright information associated with the volume.
     * @type {String}
     */
    CopyrightInfo {
        get => StrGet(this.ptr + 64, 33, "UTF-16")
        set => StrPut(value, this.ptr + 64, 33, "UTF-16")
    }

    /**
     * Any abstract  information written on the media.
     * @type {String}
     */
    AbstractInfo {
        get => StrGet(this.ptr + 132, 33, "UTF-16")
        set => StrPut(value, this.ptr + 132, 33, "UTF-16")
    }

    /**
     * Implementation-specific information; in some cases, it is the operating system version that  the media was formatted by.
     * @type {String}
     */
    FormattingImplementationInfo {
        get => StrGet(this.ptr + 200, 33, "UTF-16")
        set => StrPut(value, this.ptr + 200, 33, "UTF-16")
    }

    /**
     * The last implementation that modified the disk. This information is implementation specific; in some cases, it is the operating system version that  the media was last modified by.
     * @type {String}
     */
    LastModifyingImplementationInfo {
        get => StrGet(this.ptr + 268, 33, "UTF-16")
        set => StrPut(value, this.ptr + 268, 33, "UTF-16")
    }
}
