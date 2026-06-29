#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the subscriber when a COM+ application instance is created or reconfigured.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-isystemappeventdata
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ISystemAppEventData extends IUnknown {
    /**
     * The interface identifier for ISystemAppEventData
     * @type {Guid}
     */
    static IID := Guid("{d6d48a3c-d5c5-49e7-8c74-99e4889ed52f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISystemAppEventData interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Startup       : IntPtr
        OnDataChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISystemAppEventData.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Invoked when a COM+ application instance is created.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isystemappeventdata-startup
     */
    Startup() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Generated when the configuration of a COM+ application instance is changed.
     * @param {Integer} dwPID The process identifier of the application instance for which the configuration was changed.
     * @param {Integer} dwMask The event mask used to determine which tracing event fires.
     * @param {Integer} dwNumberSinks Always set equal to SinkType::NUMBER_SINKS.
     * @param {BSTR} bstrDwMethodMask The event mask used to determine to which events the user has subscribed.
     * @param {Integer} dwReason Always set equal to INFO_MASKCHANGED.
     * @param {Integer} u64TraceHandle A handle to the relevant tracing session.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isystemappeventdata-ondatachanged
     */
    OnDataChanged(dwPID, dwMask, dwNumberSinks, bstrDwMethodMask, dwReason, u64TraceHandle) {
        bstrDwMethodMask := bstrDwMethodMask is String ? BSTR.Alloc(bstrDwMethodMask).Value : bstrDwMethodMask

        result := ComCall(4, this, "uint", dwPID, "uint", dwMask, "uint", dwNumberSinks, BSTR, bstrDwMethodMask, "uint", dwReason, "uint", u64TraceHandle, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISystemAppEventData.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Startup := CallbackCreate(GetMethod(implObj, "Startup"), flags, 1)
        this.vtbl.OnDataChanged := CallbackCreate(GetMethod(implObj, "OnDataChanged"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Startup)
        CallbackFree(this.vtbl.OnDataChanged)
    }
}
