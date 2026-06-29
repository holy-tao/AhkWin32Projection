#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Contains access information used by an incremental crawl, such as the last access date and modification time.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ns-searchapi-incremental_access_info
 * @namespace Windows.Win32.System.Search
 */
export default struct INCREMENTAL_ACCESS_INFO {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * Size of the file in bytes.
     */
    dwSize : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a></b>
     * 
     * Last time the file was modified.
     */
    ftLastModifiedTime : FILETIME

}
