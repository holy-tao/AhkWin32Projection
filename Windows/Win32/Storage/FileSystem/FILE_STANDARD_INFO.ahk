#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Receives extended information for the file.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_standard_info
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_STANDARD_INFO {
    #StructPack 8

    /**
     * The amount of space that is allocated for the file.
     */
    AllocationSize : Int64

    /**
     * The end of the file.
     */
    EndOfFile : Int64

    /**
     * The number of links to the file.
     */
    NumberOfLinks : UInt32

    /**
     * <b>TRUE</b> if the file in the delete queue; otherwise, 
     *       <b>false</b>.
     */
    DeletePending : BOOLEAN

    /**
     * <b>TRUE</b> if  the  file is a directory; otherwise, 
     *       <b>false</b>.
     */
    Directory : BOOLEAN

}
