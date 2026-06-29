#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information passed to the IUrlAccessor object about the current item; for example, the application name and catalog name.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ns-searchapi-item_info
 * @namespace Windows.Win32.System.Search
 */
export default struct ITEM_INFO {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Size of the structure in bytes.
     */
    dwSize : UInt32

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string containing an email address that is notified in case of error.
     */
    pcwszFromEMail : PWSTR

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string containing the application name.
     */
    pcwszApplicationName : PWSTR

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string containing the workspace name from which the crawl to this content source was initiated.
     */
    pcwszCatalogName : PWSTR

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Not used by protocol handlers.
     */
    pcwszContentClass : PWSTR

}
