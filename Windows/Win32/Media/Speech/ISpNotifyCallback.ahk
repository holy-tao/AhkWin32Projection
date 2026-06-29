#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpNotifyCallback extends Win32ComInterface {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpNotifyCallback interfaces
    */
    struct Vtbl {
        NotifyCallback : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpNotifyCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {HRESULT} 
     */
    NotifyCallback(_wParam, _lParam) {
        result := ComCall(0, this, WPARAM, _wParam, LPARAM, _lParam, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpNotifyCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }
}
