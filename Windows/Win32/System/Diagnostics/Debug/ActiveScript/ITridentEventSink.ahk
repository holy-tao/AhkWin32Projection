#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\EXCEPINFO.ahk" { EXCEPINFO }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\Com\DISPPARAMS.ahk" { DISPPARAMS }
#Import "..\..\..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct ITridentEventSink extends IUnknown {
    /**
     * The interface identifier for ITridentEventSink
     * @type {Guid}
     */
    static IID := Guid("{1dc9ca50-06ef-11d2-8415-006008c3fbfc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITridentEventSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FireEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITridentEventSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pstrEvent 
     * @param {Pointer<DISPPARAMS>} pdp 
     * @param {Pointer<VARIANT>} pvarRes 
     * @param {Pointer<EXCEPINFO>} pei 
     * @returns {HRESULT} 
     */
    FireEvent(pstrEvent, pdp, pvarRes, pei) {
        pstrEvent := pstrEvent is String ? StrPtr(pstrEvent) : pstrEvent

        result := ComCall(3, this, "ptr", pstrEvent, DISPPARAMS.Ptr, pdp, VARIANT.Ptr, pvarRes, EXCEPINFO.Ptr, pei, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITridentEventSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FireEvent := CallbackCreate(GetMethod(implObj, "FireEvent"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FireEvent)
    }
}
