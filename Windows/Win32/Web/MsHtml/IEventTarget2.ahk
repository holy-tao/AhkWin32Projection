#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDOMEventRegistrationCallback.ahk" { IDOMEventRegistrationCallback }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IEventTarget2 extends IUnknown {
    /**
     * The interface identifier for IEventTarget2
     * @type {Guid}
     */
    static IID := Guid("{30510839-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEventTarget2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRegisteredEventTypes        : IntPtr
        GetListenersForType            : IntPtr
        RegisterForDOMEventListeners   : IntPtr
        UnregisterForDOMEventListeners : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEventTarget2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     */
    GetRegisteredEventTypes() {
        result := ComCall(3, this, "ptr*", &ppEventTypeArray := 0, "HRESULT")
        return ppEventTypeArray
    }

    /**
     * 
     * @param {PWSTR} pszEventType 
     * @returns {Pointer<SAFEARRAY>} 
     */
    GetListenersForType(pszEventType) {
        pszEventType := pszEventType is String ? StrPtr(pszEventType) : pszEventType

        result := ComCall(4, this, "ptr", pszEventType, "ptr*", &ppEventHandlerArray := 0, "HRESULT")
        return ppEventHandlerArray
    }

    /**
     * 
     * @param {IDOMEventRegistrationCallback} pCallback 
     * @returns {HRESULT} 
     */
    RegisterForDOMEventListeners(pCallback) {
        result := ComCall(5, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDOMEventRegistrationCallback} pCallback 
     * @returns {HRESULT} 
     */
    UnregisterForDOMEventListeners(pCallback) {
        result := ComCall(6, this, "ptr", pCallback, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEventTarget2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRegisteredEventTypes := CallbackCreate(GetMethod(implObj, "GetRegisteredEventTypes"), flags, 2)
        this.vtbl.GetListenersForType := CallbackCreate(GetMethod(implObj, "GetListenersForType"), flags, 3)
        this.vtbl.RegisterForDOMEventListeners := CallbackCreate(GetMethod(implObj, "RegisterForDOMEventListeners"), flags, 2)
        this.vtbl.UnregisterForDOMEventListeners := CallbackCreate(GetMethod(implObj, "UnregisterForDOMEventListeners"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRegisteredEventTypes)
        CallbackFree(this.vtbl.GetListenersForType)
        CallbackFree(this.vtbl.RegisterForDOMEventListeners)
        CallbackFree(this.vtbl.UnregisterForDOMEventListeners)
    }
}
