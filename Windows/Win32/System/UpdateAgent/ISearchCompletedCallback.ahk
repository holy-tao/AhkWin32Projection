#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISearchJob.ahk" { ISearchJob }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ISearchCompletedCallbackArgs.ahk" { ISearchCompletedCallbackArgs }

/**
 * Contains a method that handles the notification about the completion of an asynchronous search operation.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-isearchcompletedcallback
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct ISearchCompletedCallback extends IUnknown {
    /**
     * The interface identifier for ISearchCompletedCallback
     * @type {Guid}
     */
    static IID := Guid("{88aee058-d4b0-4725-a2f1-814a67ae964c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISearchCompletedCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Invoke : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISearchCompletedCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Handles the notification of the completion of an asynchronous search that is initiated by calling the IUpdateSearcher.BeginSearch method.
     * @param {ISearchJob} searchJob An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-isearchjob">ISearchJob</a> interface that contains search information.
     * @param {ISearchCompletedCallbackArgs} callbackArgs This parameter is reserved for future use and can be ignored. An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/aa386067(v=vs.85)">ISearchCompletedCallbackArgs</a> interface that contains information on the completion of an asynchronous search.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-isearchcompletedcallback-invoke
     */
    Invoke(searchJob, callbackArgs) {
        result := ComCall(3, this, "ptr", searchJob, "ptr", callbackArgs, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISearchCompletedCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Invoke := CallbackCreate(GetMethod(implObj, "Invoke"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Invoke)
    }
}
