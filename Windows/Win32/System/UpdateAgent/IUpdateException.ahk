#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\UpdateExceptionContext.ahk" { UpdateExceptionContext }

/**
 * Represents info about the aspects of search results returned in the ISearchResult object that were incomplete.
 * @remarks
 * The <b>IUpdateException</b> object is returned as part of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-isearchresult-get_warnings">ISearchResult::Warnings</a> property when a search succeeds but can't return complete results. For example, Windows Update might not have been able to retrieve all of the update metadata for a given update from the server. In this situation, the search results returned in the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-isearchresult">ISearchResult</a> object are usable, but they aren't necessarily complete. The properties of the <b>IUpdateException</b> objects that are returned by the <b>ISearchResult::Warnings</b> property contain info about the  aspects of the search that were incomplete. This info is unlikely to be useful programmatically, but can sometimes be useful for debugging.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdateexception
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdateException extends IDispatch {
    /**
     * The interface identifier for IUpdateException
     * @type {Guid}
     */
    static IID := Guid("{a376dd5e-09d4-427f-af7c-fed5b6e1c1d6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdateException interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Message : IntPtr
        get_HResult : IntPtr
        get_Context : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdateException.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * @type {Integer} 
     */
    HResult {
        get => this.get_HResult()
    }

    /**
     * @type {UpdateExceptionContext} 
     */
    Context {
        get => this.get_Context()
    }

    /**
     * Gets a message that describes the search results.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateexception-get_message
     */
    get_Message() {
        retval := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets the Windows-based HRESULT code for the search results.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateexception-get_hresult
     */
    get_HResult() {
        result := ComCall(8, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the context of search results.
     * @returns {UpdateExceptionContext} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateexception-get_context
     */
    get_Context() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    Query(iid) {
        if (IUpdateException.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Message := CallbackCreate(GetMethod(implObj, "get_Message"), flags, 2)
        this.vtbl.get_HResult := CallbackCreate(GetMethod(implObj, "get_HResult"), flags, 2)
        this.vtbl.get_Context := CallbackCreate(GetMethod(implObj, "get_Context"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Message)
        CallbackFree(this.vtbl.get_HResult)
        CallbackFree(this.vtbl.get_Context)
    }
}
