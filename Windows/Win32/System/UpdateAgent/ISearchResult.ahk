#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUpdateExceptionCollection.ahk" { IUpdateExceptionCollection }
#Import ".\OperationResultCode.ahk" { OperationResultCode }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUpdateCollection.ahk" { IUpdateCollection }
#Import ".\ICategoryCollection.ahk" { ICategoryCollection }

/**
 * Represents the result of a search.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-isearchresult
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct ISearchResult extends IDispatch {
    /**
     * The interface identifier for ISearchResult
     * @type {Guid}
     */
    static IID := Guid("{d40cff62-e08c-4498-941a-01e25f0fd33c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISearchResult interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ResultCode     : IntPtr
        get_RootCategories : IntPtr
        get_Updates        : IntPtr
        get_Warnings       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISearchResult.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {OperationResultCode} 
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
     * @returns {OperationResultCode} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-isearchresult-get_resultcode
     */
    get_ResultCode() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets an interface collection of the root categories that are currently available on the computer.
     * @returns {ICategoryCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-isearchresult-get_rootcategories
     */
    get_RootCategories() {
        result := ComCall(8, this, "ptr*", &retval := 0, "HRESULT")
        return ICategoryCollection(retval)
    }

    /**
     * Gets an interface collection of the updates that result from a search.
     * @returns {IUpdateCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-isearchresult-get_updates
     */
    get_Updates() {
        result := ComCall(9, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateCollection(retval)
    }

    /**
     * Gets a collection of the warnings that result from a search.
     * @returns {IUpdateExceptionCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-isearchresult-get_warnings
     */
    get_Warnings() {
        result := ComCall(10, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateExceptionCollection(retval)
    }

    Query(iid) {
        if (ISearchResult.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ResultCode := CallbackCreate(GetMethod(implObj, "get_ResultCode"), flags, 2)
        this.vtbl.get_RootCategories := CallbackCreate(GetMethod(implObj, "get_RootCategories"), flags, 2)
        this.vtbl.get_Updates := CallbackCreate(GetMethod(implObj, "get_Updates"), flags, 2)
        this.vtbl.get_Warnings := CallbackCreate(GetMethod(implObj, "get_Warnings"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ResultCode)
        CallbackFree(this.vtbl.get_RootCategories)
        CallbackFree(this.vtbl.get_Updates)
        CallbackFree(this.vtbl.get_Warnings)
    }
}
