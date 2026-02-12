#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContentIndexerQuery.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class IContentIndexerQueryOperations extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentIndexerQueryOperations
     * @type {Guid}
     */
    static IID => Guid("{28823e10-4786-42f1-9730-792b3566b150}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateQueryWithSortOrderAndLanguage", "CreateQueryWithSortOrder", "CreateQuery2"]

    /**
     * 
     * @param {HSTRING} searchFilter 
     * @param {IIterable<HSTRING>} propertiesToRetrieve 
     * @param {IIterable<SortEntry>} sortOrder 
     * @param {HSTRING} searchFilterLanguage 
     * @returns {ContentIndexerQuery} 
     */
    CreateQueryWithSortOrderAndLanguage(searchFilter, propertiesToRetrieve, sortOrder, searchFilterLanguage) {
        if(searchFilter is String) {
            pin := HSTRING.Create(searchFilter)
            searchFilter := pin.Value
        }
        searchFilter := searchFilter is Win32Handle ? NumGet(searchFilter, "ptr") : searchFilter
        if(searchFilterLanguage is String) {
            pin := HSTRING.Create(searchFilterLanguage)
            searchFilterLanguage := pin.Value
        }
        searchFilterLanguage := searchFilterLanguage is Win32Handle ? NumGet(searchFilterLanguage, "ptr") : searchFilterLanguage

        result := ComCall(6, this, "ptr", searchFilter, "ptr", propertiesToRetrieve, "ptr", sortOrder, "ptr", searchFilterLanguage, "ptr*", &query := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContentIndexerQuery(query)
    }

    /**
     * 
     * @param {HSTRING} searchFilter 
     * @param {IIterable<HSTRING>} propertiesToRetrieve 
     * @param {IIterable<SortEntry>} sortOrder 
     * @returns {ContentIndexerQuery} 
     */
    CreateQueryWithSortOrder(searchFilter, propertiesToRetrieve, sortOrder) {
        if(searchFilter is String) {
            pin := HSTRING.Create(searchFilter)
            searchFilter := pin.Value
        }
        searchFilter := searchFilter is Win32Handle ? NumGet(searchFilter, "ptr") : searchFilter

        result := ComCall(7, this, "ptr", searchFilter, "ptr", propertiesToRetrieve, "ptr", sortOrder, "ptr*", &query := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContentIndexerQuery(query)
    }

    /**
     * 
     * @param {HSTRING} searchFilter 
     * @param {IIterable<HSTRING>} propertiesToRetrieve 
     * @returns {ContentIndexerQuery} 
     */
    CreateQuery2(searchFilter, propertiesToRetrieve) {
        if(searchFilter is String) {
            pin := HSTRING.Create(searchFilter)
            searchFilter := pin.Value
        }
        searchFilter := searchFilter is Win32Handle ? NumGet(searchFilter, "ptr") : searchFilter

        result := ComCall(8, this, "ptr", searchFilter, "ptr", propertiesToRetrieve, "ptr*", &query := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContentIndexerQuery(query)
    }
}
