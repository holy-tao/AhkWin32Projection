#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CASTING_CONNECTION_STATE.ahk" { CASTING_CONNECTION_STATE }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\CASTING_CONNECTION_ERROR_STATUS.ahk" { CASTING_CONNECTION_ERROR_STATUS }

/**
 * @namespace Windows.Win32.System.WinRT
 */
export default struct ICastingEventHandler extends IUnknown {
    /**
     * The interface identifier for ICastingEventHandler
     * @type {Guid}
     */
    static IID := Guid("{c79a6cb7-bebd-47a6-a2ad-4d45ad79c7bc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICastingEventHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnStateChanged : IntPtr
        OnError        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICastingEventHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {CASTING_CONNECTION_STATE} newState 
     * @returns {HRESULT} 
     */
    OnStateChanged(newState) {
        result := ComCall(3, this, CASTING_CONNECTION_STATE, newState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {CASTING_CONNECTION_ERROR_STATUS} errorStatus 
     * @param {PWSTR} errorMessage 
     * @returns {HRESULT} 
     */
    OnError(errorStatus, errorMessage) {
        errorMessage := errorMessage is String ? StrPtr(errorMessage) : errorMessage

        result := ComCall(4, this, CASTING_CONNECTION_ERROR_STATUS, errorStatus, "ptr", errorMessage, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICastingEventHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnStateChanged := CallbackCreate(GetMethod(implObj, "OnStateChanged"), flags, 2)
        this.vtbl.OnError := CallbackCreate(GetMethod(implObj, "OnError"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnStateChanged)
        CallbackFree(this.vtbl.OnError)
    }
}
