#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\QueryOptions.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class IQueryOptionsFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IQueryOptionsFactory
     * @type {Guid}
     */
    static IID => Guid("{032e1f8c-a9c1-4e71-8011-0dee9d4811a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateCommonFileQuery", "CreateCommonFolderQuery"]

    /**
     * 
     * @param {Integer} query 
     * @param {IIterable<HSTRING>} fileTypeFilter 
     * @returns {QueryOptions} 
     */
    CreateCommonFileQuery(query, fileTypeFilter) {
        result := ComCall(6, this, "int", query, "ptr", fileTypeFilter, "ptr*", &queryOptions_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return QueryOptions(queryOptions_)
    }

    /**
     * 
     * @param {Integer} query 
     * @returns {QueryOptions} 
     */
    CreateCommonFolderQuery(query) {
        result := ComCall(7, this, "int", query, "ptr*", &queryOptions_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return QueryOptions(queryOptions_)
    }
}
