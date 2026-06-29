#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaEngineAudioEndpointId extends IUnknown {
    /**
     * The interface identifier for IMFMediaEngineAudioEndpointId
     * @type {Guid}
     */
    static IID := Guid("{7a3bac98-0e76-49fb-8c20-8a86fd98eaf2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaEngineAudioEndpointId interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAudioEndpointId : IntPtr
        GetAudioEndpointId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaEngineAudioEndpointId.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszEndpointId 
     * @returns {HRESULT} 
     */
    SetAudioEndpointId(pszEndpointId) {
        pszEndpointId := pszEndpointId is String ? StrPtr(pszEndpointId) : pszEndpointId

        result := ComCall(3, this, "ptr", pszEndpointId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetAudioEndpointId() {
        result := ComCall(4, this, PWSTR.Ptr, &ppszEndpointId := 0, "HRESULT")
        return ppszEndpointId
    }

    Query(iid) {
        if (IMFMediaEngineAudioEndpointId.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAudioEndpointId := CallbackCreate(GetMethod(implObj, "SetAudioEndpointId"), flags, 2)
        this.vtbl.GetAudioEndpointId := CallbackCreate(GetMethod(implObj, "GetAudioEndpointId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAudioEndpointId)
        CallbackFree(this.vtbl.GetAudioEndpointId)
    }
}
