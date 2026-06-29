#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Describes the status of a document to be indexed.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ns-searchapi-search_item_indexing_status
 * @namespace Windows.Win32.System.Search
 */
export default struct SEARCH_ITEM_INDEXING_STATUS {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * Document identifier.
     */
    dwDocID : UInt32

    /**
     * Type: <b>HRESULT</b>
     * 
     * An <b>HRESULT</b> value that corresponds to a system error code or a Component Object Model (COM) error code. S_OK if successful, or an error value otherwise.
     */
    hrIndexingStatus : HRESULT

}
