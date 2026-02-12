#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains progress information for a data retrieval operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.retrievalprogress
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class RetrievalProgress extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The number of bytes that have been received in this data retrieval operation.
     * @type {Integer}
     */
    BytesRetrieved {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The total number of bytes to be received during this data retrieval operation.
     * @type {Integer}
     */
    TotalBytesToRetrieve {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
