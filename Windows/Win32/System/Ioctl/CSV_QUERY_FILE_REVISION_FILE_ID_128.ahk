#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Storage\FileSystem\FILE_ID_128.ahk" { FILE_ID_128 }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct CSV_QUERY_FILE_REVISION_FILE_ID_128 {
    #StructPack 8

    FileId : FILE_ID_128

    FileRevision : Int64[3]

}
