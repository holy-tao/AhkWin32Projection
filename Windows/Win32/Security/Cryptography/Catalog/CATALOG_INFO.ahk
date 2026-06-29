#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The CATALOG_INFO structure contains the name of a catalog file. This structure is used by the CryptCATCatalogInfoFromContext function.
 * @see https://learn.microsoft.com/windows/win32/api/mscat/ns-mscat-catalog_info
 * @namespace Windows.Win32.Security.Cryptography.Catalog
 */
export default struct CATALOG_INFO {
    #StructPack 4

    /**
     * Specifies the size, in bytes, of this structure.
     */
    cbStruct : UInt32

    /**
     * Name of the catalog file.
     */
    wszCatalogFile : WCHAR[260]

}
