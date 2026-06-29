#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SCRIPT_TIMER_TYPE.ahk" { SCRIPT_TIMER_TYPE }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\DOM_EVENT_PHASE.ahk" { DOM_EVENT_PHASE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IScriptEventHandler.ahk" { IScriptEventHandler }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDebugCallbackNotificationHandler extends IUnknown {
    /**
     * The interface identifier for IDebugCallbackNotificationHandler
     * @type {Guid}
     */
    static IID := Guid("{30510842-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugCallbackNotificationHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RequestedCallbackTypes    : IntPtr
        BeforeDispatchEvent       : IntPtr
        DispatchEventComplete     : IntPtr
        BeforeInvokeDomCallback   : IntPtr
        InvokeDomCallbackComplete : IntPtr
        BeforeInvokeCallback      : IntPtr
        InvokeCallbackComplete    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugCallbackNotificationHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    RequestedCallbackTypes() {
        result := ComCall(3, this, "uint*", &pCallbackMask := 0, "HRESULT")
        return pCallbackMask
    }

    /**
     * 
     * @param {IUnknown} pEvent 
     * @returns {HRESULT} 
     */
    BeforeDispatchEvent(pEvent) {
        result := ComCall(4, this, "ptr", pEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pEvent 
     * @param {Integer} propagationStatus 
     * @returns {HRESULT} 
     */
    DispatchEventComplete(pEvent, propagationStatus) {
        result := ComCall(5, this, "ptr", pEvent, "uint", propagationStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pEvent 
     * @param {IScriptEventHandler} pCallback 
     * @param {DOM_EVENT_PHASE} eStage 
     * @param {Integer} propagationStatus 
     * @returns {HRESULT} 
     */
    BeforeInvokeDomCallback(pEvent, pCallback, eStage, propagationStatus) {
        result := ComCall(6, this, "ptr", pEvent, "ptr", pCallback, DOM_EVENT_PHASE, eStage, "uint", propagationStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pEvent 
     * @param {IScriptEventHandler} pCallback 
     * @param {DOM_EVENT_PHASE} eStage 
     * @param {Integer} propagationStatus 
     * @returns {HRESULT} 
     */
    InvokeDomCallbackComplete(pEvent, pCallback, eStage, propagationStatus) {
        result := ComCall(7, this, "ptr", pEvent, "ptr", pCallback, DOM_EVENT_PHASE, eStage, "uint", propagationStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SCRIPT_TIMER_TYPE} eCallbackType 
     * @param {Integer} callbackCookie 
     * @param {IDispatch} pDispHandler 
     * @param {Integer} ullHandlerCookie 
     * @param {BSTR} functionName 
     * @param {Integer} line 
     * @param {Integer} _column 
     * @param {Integer} cchLength 
     * @param {IUnknown} pDebugDocumentContext 
     * @returns {HRESULT} 
     */
    BeforeInvokeCallback(eCallbackType, callbackCookie, pDispHandler, ullHandlerCookie, functionName, line, _column, cchLength, pDebugDocumentContext) {
        functionName := functionName is String ? BSTR.Alloc(functionName).Value : functionName

        result := ComCall(8, this, SCRIPT_TIMER_TYPE, eCallbackType, "uint", callbackCookie, "ptr", pDispHandler, "uint", ullHandlerCookie, BSTR, functionName, "uint", line, "uint", _column, "uint", cchLength, "ptr", pDebugDocumentContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SCRIPT_TIMER_TYPE} eCallbackType 
     * @param {Integer} callbackCookie 
     * @param {IDispatch} pDispHandler 
     * @param {Integer} ullHandlerCookie 
     * @param {BSTR} functionName 
     * @param {Integer} line 
     * @param {Integer} _column 
     * @param {Integer} cchLength 
     * @param {IUnknown} pDebugDocumentContext 
     * @returns {HRESULT} 
     */
    InvokeCallbackComplete(eCallbackType, callbackCookie, pDispHandler, ullHandlerCookie, functionName, line, _column, cchLength, pDebugDocumentContext) {
        functionName := functionName is String ? BSTR.Alloc(functionName).Value : functionName

        result := ComCall(9, this, SCRIPT_TIMER_TYPE, eCallbackType, "uint", callbackCookie, "ptr", pDispHandler, "uint", ullHandlerCookie, BSTR, functionName, "uint", line, "uint", _column, "uint", cchLength, "ptr", pDebugDocumentContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugCallbackNotificationHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RequestedCallbackTypes := CallbackCreate(GetMethod(implObj, "RequestedCallbackTypes"), flags, 2)
        this.vtbl.BeforeDispatchEvent := CallbackCreate(GetMethod(implObj, "BeforeDispatchEvent"), flags, 2)
        this.vtbl.DispatchEventComplete := CallbackCreate(GetMethod(implObj, "DispatchEventComplete"), flags, 3)
        this.vtbl.BeforeInvokeDomCallback := CallbackCreate(GetMethod(implObj, "BeforeInvokeDomCallback"), flags, 5)
        this.vtbl.InvokeDomCallbackComplete := CallbackCreate(GetMethod(implObj, "InvokeDomCallbackComplete"), flags, 5)
        this.vtbl.BeforeInvokeCallback := CallbackCreate(GetMethod(implObj, "BeforeInvokeCallback"), flags, 10)
        this.vtbl.InvokeCallbackComplete := CallbackCreate(GetMethod(implObj, "InvokeCallbackComplete"), flags, 10)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RequestedCallbackTypes)
        CallbackFree(this.vtbl.BeforeDispatchEvent)
        CallbackFree(this.vtbl.DispatchEventComplete)
        CallbackFree(this.vtbl.BeforeInvokeDomCallback)
        CallbackFree(this.vtbl.InvokeDomCallbackComplete)
        CallbackFree(this.vtbl.BeforeInvokeCallback)
        CallbackFree(this.vtbl.InvokeCallbackComplete)
    }
}
