#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILE_ID_128.ahk" { FILE_ID_128 }

/**
 * Contains identification information for a file. (FILE_ID_INFO)
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_id_info
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_ID_INFO {
    #StructPack 8

    /**
     * The serial number of the volume that contains a file.
     */
    VolumeSerialNumber : Int64

    /**
     * The 128-bit file identifier for the file. The file identifier and the volume serial number uniquely identify 
     *      a file on a single computer. To determine whether two open handles represent the same file, combine the 
     *      identifier and the volume serial number for each file and compare them.
     */
    FileId : FILE_ID_128

}
