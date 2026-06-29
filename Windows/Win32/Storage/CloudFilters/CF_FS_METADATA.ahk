#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\FileSystem\FILE_BASIC_INFO.ahk" { FILE_BASIC_INFO }

/**
 * Placeholder file or directory metadata.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_fs_metadata
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_FS_METADATA {
    #StructPack 8

    /**
     * Basic file information in a [FILE_BASIC_INFO](/windows/win32/api/winbase/ns-winbase-file_basic_info) structure.
     */
    BasicInfo : FILE_BASIC_INFO

    /**
     * The size of the file, in bytes.
     */
    FileSize : Int64

}
