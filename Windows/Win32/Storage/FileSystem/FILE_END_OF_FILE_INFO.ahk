#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the specified value to which the end of the file should be set.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_end_of_file_info
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_END_OF_FILE_INFO {
    #StructPack 8

    /**
     * The specified value for the new end of the file.
     */
    EndOfFile : Int64

}
