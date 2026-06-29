#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IScriptEventHandler.ahk" { IScriptEventHandler }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDOMEventRegistrationCallback extends IUnknown {
    /**
     * The interface identifier for IDOMEventRegistrationCallback
     * @type {Guid}
     */
    static IID := Guid("{3051083b-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMEventRegistrationCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnDOMEventListenerAdded   : IntPtr
        OnDOMEventListenerRemoved : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMEventRegistrationCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszEventType 
     * @param {IScriptEventHandler} pHandler 
     * @returns {HRESULT} 
     */
    OnDOMEventListenerAdded(pszEventType, pHandler) {
        pszEventType := pszEventType is String ? StrPtr(pszEventType) : pszEventType

        result := ComCall(3, this, "ptr", pszEventType, "ptr", pHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullCookie 
     * @returns {HRESULT} 
     */
    OnDOMEventListenerRemoved(ullCookie) {
        result := ComCall(4, this, "uint", ullCookie, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDOMEventRegistrationCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnDOMEventListenerAdded := CallbackCreate(GetMethod(implObj, "OnDOMEventListenerAdded"), flags, 3)
        this.vtbl.OnDOMEventListenerRemoved := CallbackCreate(GetMethod(implObj, "OnDOMEventListenerRemoved"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnDOMEventListenerAdded)
        CallbackFree(this.vtbl.OnDOMEventListenerRemoved)
    }
}
