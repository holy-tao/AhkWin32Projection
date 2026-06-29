#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMPWindowMessageSink.ahk" { IWMPWindowMessageSink }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPNodeWindowless extends IWMPWindowMessageSink {
    /**
     * The interface identifier for IWMPNodeWindowless
     * @type {Guid}
     */
    static IID := Guid("{9b9199ad-780c-4eda-b816-261eba5d1575}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPNodeWindowless interfaces
    */
    struct Vtbl extends IWMPWindowMessageSink.Vtbl {
        OnDraw : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPNodeWindowless.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} _hdc 
     * @param {Pointer<RECT>} prcDraw 
     * @returns {HRESULT} 
     */
    OnDraw(_hdc, prcDraw) {
        result := ComCall(4, this, "ptr", _hdc, RECT.Ptr, prcDraw, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPNodeWindowless.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnDraw := CallbackCreate(GetMethod(implObj, "OnDraw"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnDraw)
    }
}
