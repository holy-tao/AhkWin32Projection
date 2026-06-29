#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IActiveScriptError.ahk" { IActiveScriptError }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptWinRTErrorDebug extends IActiveScriptError {
    /**
     * The interface identifier for IActiveScriptWinRTErrorDebug
     * @type {Guid}
     */
    static IID := Guid("{73a3f82a-0fe9-4b33-ba3b-fe095f697e0a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptWinRTErrorDebug interfaces
    */
    struct Vtbl extends IActiveScriptError.Vtbl {
        GetRestrictedErrorString    : IntPtr
        GetRestrictedErrorReference : IntPtr
        GetCapabilitySid            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptWinRTErrorDebug.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetRestrictedErrorString() {
        errorString := BSTR.Owned()
        result := ComCall(6, this, BSTR.Ptr, errorString, "HRESULT")
        return errorString
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetRestrictedErrorReference() {
        referenceString := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, referenceString, "HRESULT")
        return referenceString
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetCapabilitySid() {
        capabilitySid := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, capabilitySid, "HRESULT")
        return capabilitySid
    }

    Query(iid) {
        if (IActiveScriptWinRTErrorDebug.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRestrictedErrorString := CallbackCreate(GetMethod(implObj, "GetRestrictedErrorString"), flags, 2)
        this.vtbl.GetRestrictedErrorReference := CallbackCreate(GetMethod(implObj, "GetRestrictedErrorReference"), flags, 2)
        this.vtbl.GetCapabilitySid := CallbackCreate(GetMethod(implObj, "GetCapabilitySid"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRestrictedErrorString)
        CallbackFree(this.vtbl.GetRestrictedErrorReference)
        CallbackFree(this.vtbl.GetCapabilitySid)
    }
}
