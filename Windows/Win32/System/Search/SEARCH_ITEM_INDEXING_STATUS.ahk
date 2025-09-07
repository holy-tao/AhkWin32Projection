#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the status of a document to be indexed.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ns-searchapi-search_item_indexing_status
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class SEARCH_ITEM_INDEXING_STATUS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * Document identifier.
     * @type {Integer}
     */
    dwDocID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>HRESULT</b>
     * 
     * An <b>HRESULT</b> value that corresponds to a system error code or a Component Object Model (COM) error code. S_OK if successful, or an error value otherwise.
     * @type {Integer}
     */
    hrIndexingStatus {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
