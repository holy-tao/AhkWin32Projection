#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct ITridentTouchInput extends IUnknown {
    /**
     * The interface identifier for ITridentTouchInput
     * @type {Guid}
     */
    static IID := Guid("{30510850-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITridentTouchInput interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnPointerMessage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITridentTouchInput.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} _msg 
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {BOOL} 
     */
    OnPointerMessage(_msg, _wParam, _lParam) {
        result := ComCall(3, this, "uint", _msg, WPARAM, _wParam, LPARAM, _lParam, BOOL.Ptr, &pfAllowManipulations := 0, "HRESULT")
        return pfAllowManipulations
    }

    Query(iid) {
        if (ITridentTouchInput.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnPointerMessage := CallbackCreate(GetMethod(implObj, "OnPointerMessage"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnPointerMessage)
    }
}
