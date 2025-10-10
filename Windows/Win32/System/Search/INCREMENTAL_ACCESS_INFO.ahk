#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Contains access information used by an incremental crawl, such as the last access date and modification time.
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/ns-searchapi-incremental_access_info
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class INCREMENTAL_ACCESS_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Size of the file in bytes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a></b>
     * 
     * Last time the file was modified.
     * @type {FILETIME}
     */
    ftLastModifiedTime{
        get {
            if(!this.HasProp("__ftLastModifiedTime"))
                this.__ftLastModifiedTime := FILETIME(this.ptr + 8)
            return this.__ftLastModifiedTime
        }
    }
}
