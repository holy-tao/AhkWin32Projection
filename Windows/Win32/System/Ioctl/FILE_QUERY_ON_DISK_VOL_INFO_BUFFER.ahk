#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Receives the volume information from a call to FSCTL_QUERY_ON_DISK_VOLUME_INFO.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-file_query_on_disk_vol_info_buffer
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_QUERY_ON_DISK_VOL_INFO_BUFFER {
    #StructPack 8

    /**
     * The number of directories on the specified disk. This member is -1 if the number is unknown. 
     * 
     * For UDF file systems with a virtual allocation table, this information is available only if the UDF revision is greater than 1.50.
     */
    DirectoryCount : Int64

    /**
     * The number of files on the specified disk. Returns -1 if the number is unknown.
     * 
     * For UDF file systems with a virtual allocation table, this information is available only if the UDF revision is greater than 1.50.
     */
    FileCount : Int64

    /**
     * The major version number of the file system. Returns -1 if the number is unknown or not applicable. On UDF 1.02 file systems, 1 is returned.
     */
    FsFormatMajVersion : UInt16

    /**
     * The minor version number of the file system. Returns -1 if the number is unknown or not applicable.  On UDF 1.02 file systems, 02 is returned.
     */
    FsFormatMinVersion : UInt16

    /**
     * Always returns UDF.
     */
    FsFormatName : WCHAR[12]

    /**
     * The time the media was formatted.
     */
    FormatTime : Int64

    /**
     * The time the media was last updated.
     */
    LastUpdateTime : Int64

    /**
     * Any copyright information associated with the volume.
     */
    CopyrightInfo : WCHAR[34]

    /**
     * Any abstract  information written on the media.
     */
    AbstractInfo : WCHAR[34]

    /**
     * Implementation-specific information; in some cases, it is the operating system version that  the media was formatted by.
     */
    FormattingImplementationInfo : WCHAR[34]

    /**
     * The last implementation that modified the disk. This information is implementation specific; in some cases, it is the operating system version that  the media was last modified by.
     */
    LastModifyingImplementationInfo : WCHAR[34]

}
