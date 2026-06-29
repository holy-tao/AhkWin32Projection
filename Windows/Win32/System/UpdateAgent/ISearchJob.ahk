#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Contains properties and methods that are available to a search operation.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-isearchjob
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct ISearchJob extends IDispatch {
    /**
     * The interface identifier for ISearchJob
     * @type {Guid}
     */
    static IID := Guid("{7366ea16-7a1a-4ea2-b042-973d3e9cd99b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISearchJob interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_AsyncState  : IntPtr
        get_IsCompleted : IntPtr
        CleanUp         : IntPtr
        RequestAbort    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISearchJob.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    AsyncState {
        get => this.get_AsyncState()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsCompleted {
        get => this.get_IsCompleted()
    }

    /**
     * Gets the caller-specific state object that is passed to the IUpdateSearch.BeginSearch method.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-isearchjob-get_asyncstate
     */
    get_AsyncState() {
        retval := VARIANT()
        result := ComCall(7, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether the call to the IUpdateSearch.BeginSearch method is completely processed.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-isearchjob-get_iscompleted
     */
    get_IsCompleted() {
        result := ComCall(8, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Waits for an asynchronous operation to complete and then releases all the callbacks.
     * @remarks
     * When you use any asynchronous WUA API in your app, you might need to implement a time-out mechanism. For more info about how to perform asynchronous WUA operations, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/guidelines-for-asynchronous-wua-operations">Guidelines for Asynchronous WUA Operations</a>.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-isearchjob-cleanup
     */
    CleanUp() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Makes a request to cancel the asynchronous search.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns  a COM or Windows error code.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-isearchjob-requestabort
     */
    RequestAbort() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISearchJob.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AsyncState := CallbackCreate(GetMethod(implObj, "get_AsyncState"), flags, 2)
        this.vtbl.get_IsCompleted := CallbackCreate(GetMethod(implObj, "get_IsCompleted"), flags, 2)
        this.vtbl.CleanUp := CallbackCreate(GetMethod(implObj, "CleanUp"), flags, 1)
        this.vtbl.RequestAbort := CallbackCreate(GetMethod(implObj, "RequestAbort"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AsyncState)
        CallbackFree(this.vtbl.get_IsCompleted)
        CallbackFree(this.vtbl.CleanUp)
        CallbackFree(this.vtbl.RequestAbort)
    }
}
