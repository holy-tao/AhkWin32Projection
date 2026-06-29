#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }

/**
 * Contains information about the completion of an asynchronous search. It also acts as a parameter to the SearchCompletedCallback delegate.
 * @remarks
 * The <b>ISearchCompletedCallbackArgs</b> interface is reserved for future use and has no properties or methods.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-isearchcompletedcallbackargs
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct ISearchCompletedCallbackArgs extends IDispatch {
    /**
     * The interface identifier for ISearchCompletedCallbackArgs
     * @type {Guid}
     */
    static IID := Guid("{a700a634-2850-4c47-938a-9e4b6e5af9a6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISearchCompletedCallbackArgs interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISearchCompletedCallbackArgs.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (ISearchCompletedCallbackArgs.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
