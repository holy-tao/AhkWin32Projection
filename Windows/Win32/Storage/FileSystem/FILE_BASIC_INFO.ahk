#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the basic information for a file. Used for file handles.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_basic_info
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_BASIC_INFO {
    #StructPack 8

    /**
     * The time the file was created in <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> format, 
     *       which is a 64-bit value representing the number of 100-nanosecond intervals since January 1, 1601 (UTC).
     */
    CreationTime : Int64

    /**
     * The time the file was last accessed in <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> 
     *       format.
     */
    LastAccessTime : Int64

    /**
     * The time the file was last written to in <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> 
     *       format.
     */
    LastWriteTime : Int64

    /**
     * The time the file was changed in <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> 
     *       format.
     */
    ChangeTime : Int64

    /**
     * The file attributes. For a list of attributes, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-attribute-constants">File Attribute Constants</a>. If this is set 
     *       to 0 in a <b>FILE_BASIC_INFO</b> structure passed to 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfileinformationbyhandle">SetFileInformationByHandle</a> then none of the 
     *       attributes are changed.
     */
    FileAttributes : UInt32

}
