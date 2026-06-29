#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Indicates whether a file should be deleted. Used for any handles.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_disposition_info
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_DISPOSITION_INFO {
    #StructPack 1

    /**
     * Indicates whether the file should be deleted. Set to <b>TRUE</b> to delete the file. 
     *       This member has no effect if the handle was opened with 
     *       <b>FILE_FLAG_DELETE_ON_CLOSE</b>.
     */
    DeleteFile : BOOLEAN

}
