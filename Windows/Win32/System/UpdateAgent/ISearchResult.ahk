#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-isearchresult-get_resultcode
     */
    get_ResultCode(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ICategoryCollection>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-isearchresult-get_rootcategories
     */
    get_RootCategories(retval) {
        result := ComCall(8, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUpdateCollection>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-isearchresult-get_updates
     */
    get_Updates(retval) {
        result := ComCall(9, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUpdateExceptionCollection>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-isearchresult-get_warnings
     */
    get_Warnings(retval) {
        result := ComCall(10, this, "ptr*", retval, "HRESULT")
        return result
    }
}
