#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICategoryCollection.ahk
#Include .\IUpdateCollection.ahk
#Include .\IUpdateExceptionCollection.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Exposes information and properties regarding the result set.
 * @remarks
 * The **ISearchResult** interface inherits from the [**IUnknown**](/windows/desktop/api/unknwn/nn-unknwn-iunknown) interface. **ISearchResult** also has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * These methods expose properties and actions applicable to the result set.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/lwef/-search-2x-isearchresult
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
     * Gets an OperationResultCode enumeration that specifies the result of a search.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wuapi/nf-wuapi-isearchresult-get_resultcode
     */
    get_ResultCode() {
        result := ComCall(7, this, "int*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * Gets an interface collection of the root categories that are currently available on the computer.
     * @returns {ICategoryCollection} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wuapi/nf-wuapi-isearchresult-get_rootcategories
     */
    get_RootCategories() {
        result := ComCall(8, this, "ptr*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ICategoryCollection(retval)
    }

    /**
     * Gets an interface collection of the updates that result from a search.
     * @returns {IUpdateCollection} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wuapi/nf-wuapi-isearchresult-get_updates
     */
    get_Updates() {
        result := ComCall(9, this, "ptr*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUpdateCollection(retval)
    }

    /**
     * Gets a collection of the warnings that result from a search.
     * @returns {IUpdateExceptionCollection} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wuapi/nf-wuapi-isearchresult-get_warnings
     */
    get_Warnings() {
        result := ComCall(10, this, "ptr*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUpdateExceptionCollection(retval)
    }
}
