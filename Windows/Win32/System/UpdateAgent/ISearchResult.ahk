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
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_ResultCode(retval) {
        result := ComCall(7, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICategoryCollection>} retval 
     * @returns {HRESULT} 
     */
    get_RootCategories(retval) {
        result := ComCall(8, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUpdateCollection>} retval 
     * @returns {HRESULT} 
     */
    get_Updates(retval) {
        result := ComCall(9, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUpdateExceptionCollection>} retval 
     * @returns {HRESULT} 
     */
    get_Warnings(retval) {
        result := ComCall(10, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
