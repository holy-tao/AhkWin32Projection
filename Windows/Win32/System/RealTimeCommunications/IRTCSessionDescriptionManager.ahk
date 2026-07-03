#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCSessionDescriptionManager extends IUnknown {
    /**
     * The interface identifier for IRTCSessionDescriptionManager
     * @type {Guid}
     */
    static IID := Guid("{ba7f518e-d336-4070-93a6-865395c843f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCSessionDescriptionManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EvaluateSessionDescription : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCSessionDescriptionManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrContentType 
     * @param {BSTR} bstrSessionDescription 
     * @param {Pointer<VARIANT_BOOL>} pfApplicationSession 
     * @returns {HRESULT} 
     */
    EvaluateSessionDescription(bstrContentType, bstrSessionDescription, pfApplicationSession) {
        bstrContentType := bstrContentType is String ? BSTR.Alloc(bstrContentType).Value : bstrContentType
        bstrSessionDescription := bstrSessionDescription is String ? BSTR.Alloc(bstrSessionDescription).Value : bstrSessionDescription

        pfApplicationSessionMarshal := pfApplicationSession is VarRef ? "short*" : "ptr"

        result := ComCall(3, this, BSTR, bstrContentType, BSTR, bstrSessionDescription, pfApplicationSessionMarshal, pfApplicationSession, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRTCSessionDescriptionManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EvaluateSessionDescription := CallbackCreate(GetMethod(implObj, "EvaluateSessionDescription"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EvaluateSessionDescription)
    }
}
