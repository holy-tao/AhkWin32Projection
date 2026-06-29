#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPWindowMessageSink extends IUnknown {
    /**
     * The interface identifier for IWMPWindowMessageSink
     * @type {Guid}
     */
    static IID := Guid("{3a0daa30-908d-4789-ba87-aed879b5c49b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPWindowMessageSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnWindowMessage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPWindowMessageSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} uMsg 
     * @param {WPARAM} _wparam 
     * @param {LPARAM} _lparam 
     * @param {Pointer<LRESULT>} plRet 
     * @param {Pointer<BOOL>} pfHandled 
     * @returns {HRESULT} 
     */
    OnWindowMessage(uMsg, _wparam, _lparam, plRet, pfHandled) {
        plRetMarshal := plRet is VarRef ? "ptr*" : "ptr"
        pfHandledMarshal := pfHandled is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "uint", uMsg, WPARAM, _wparam, LPARAM, _lparam, plRetMarshal, plRet, pfHandledMarshal, pfHandled, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPWindowMessageSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnWindowMessage := CallbackCreate(GetMethod(implObj, "OnWindowMessage"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnWindowMessage)
    }
}
