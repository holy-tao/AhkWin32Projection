#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains information passed to the IUrlAccessor object about the current item; for example, the application name and catalog name.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ns-searchapi-item_info
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ITEM_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Size of the structure in bytes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string containing an email address that is notified in case of error.
     * @type {PWSTR}
     */
    pcwszFromEMail{
        get {
            if(!this.HasProp("__pcwszFromEMail"))
                this.__pcwszFromEMail := PWSTR(this.ptr + 8)
            return this.__pcwszFromEMail
        }
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string containing the application name.
     * @type {PWSTR}
     */
    pcwszApplicationName{
        get {
            if(!this.HasProp("__pcwszApplicationName"))
                this.__pcwszApplicationName := PWSTR(this.ptr + 16)
            return this.__pcwszApplicationName
        }
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string containing the workspace name from which the crawl to this content source was initiated.
     * @type {PWSTR}
     */
    pcwszCatalogName{
        get {
            if(!this.HasProp("__pcwszCatalogName"))
                this.__pcwszCatalogName := PWSTR(this.ptr + 24)
            return this.__pcwszCatalogName
        }
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Not used by protocol handlers.
     * @type {PWSTR}
     */
    pcwszContentClass{
        get {
            if(!this.HasProp("__pcwszContentClass"))
                this.__pcwszContentClass := PWSTR(this.ptr + 32)
            return this.__pcwszContentClass
        }
    }
}
