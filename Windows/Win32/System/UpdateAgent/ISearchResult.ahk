#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICategoryCollection.ahk
#Include .\IUpdateCollection.ahk
#Include .\IUpdateExceptionCollection.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents the result of a search.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-isearchresult
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class ISearchResult extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchResult
     * @type {Guid}
     */
    static IID => Guid("{d40cff62-e08c-4498-941a-01e25f0fd33c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ResultCode", "get_RootCategories", "get_Updates", "get_Warnings"]

    /**
     * @type {Integer} 
     */
    ResultCode {
        get => this.get_ResultCode()
    }

    /**
     * @type {ICategoryCollection} 
     */
    RootCategories {
        get => this.get_RootCategories()
    }

    /**
     * @type {IUpdateCollection} 
     */
    Updates {
        get => this.get_Updates()
    }

    /**
     * @type {IUpdateExceptionCollection} 
     */
    Warnings {
        get => this.get_Warnings()
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-isearchresult-get_resultcode
     */
    get_ResultCode() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {ICategoryCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-isearchresult-get_rootcategories
     */
    get_RootCategories() {
        result := ComCall(8, this, "ptr*", &retval := 0, "HRESULT")
        return ICategoryCollection(retval)
    }

    /**
     * 
     * @returns {IUpdateCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-isearchresult-get_updates
     */
    get_Updates() {
        result := ComCall(9, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateCollection(retval)
    }

    /**
     * 
     * @returns {IUpdateExceptionCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-isearchresult-get_warnings
     */
    get_Warnings() {
        result := ComCall(10, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateExceptionCollection(retval)
    }
}
