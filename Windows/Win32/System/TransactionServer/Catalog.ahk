#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used by ISearchCatalogManager::GetCatalogStatus to determine the reason the catalog is paused.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ne-searchapi-catalogpausedreason
 * @namespace Windows.Win32.System.TransactionServer
 */
class Catalog extends Win32Struct {
    static sizeof => 0

    static packingSize => 1
}
