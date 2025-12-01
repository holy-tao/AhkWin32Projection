#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The CATALOG_INFO structure contains the name of a catalog file. This structure is used by the CryptCATCatalogInfoFromContext function.
 * @see https://learn.microsoft.com/windows/win32/api/mscat/ns-mscat-catalog_info
 * @namespace Windows.Win32.Security.Cryptography.Catalog
 * @version v4.0.30319
 */
class CATALOG_INFO extends Win32Struct
{
    static sizeof => 524

    static packingSize => 4

    /**
     * Specifies the size, in bytes, of this structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Name of the catalog file.
     * @type {String}
     */
    wszCatalogFile {
        get => StrGet(this.ptr + 4, 259, "UTF-16")
        set => StrPut(value, this.ptr + 4, 259, "UTF-16")
    }
}
