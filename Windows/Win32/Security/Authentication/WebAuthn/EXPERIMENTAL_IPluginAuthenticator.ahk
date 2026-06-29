#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\EXPERIMENTAL_WEBAUTHN_PLUGIN_CANCEL_OPERATION_REQUEST.ahk" { EXPERIMENTAL_WEBAUTHN_PLUGIN_CANCEL_OPERATION_REQUEST }
#Import ".\EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_REQUEST.ahk" { EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_REQUEST }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_RESPONSE.ahk" { EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_RESPONSE }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct EXPERIMENTAL_IPluginAuthenticator extends IUnknown {
    /**
     * The interface identifier for EXPERIMENTAL_IPluginAuthenticator
     * @type {Guid}
     */
    static IID := Guid("{e6466e9a-b2f3-47c5-b88d-89bc14a8d998}")

    /**
     * The class identifier for EXPERIMENTAL_IPluginAuthenticator
     * @type {Guid}
     */
    static CLSID := Guid("{e6466e9a-b2f3-47c5-b88d-89bc14a8d998}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for EXPERIMENTAL_IPluginAuthenticator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EXPERIMENTAL_PluginMakeCredential  : IntPtr
        EXPERIMENTAL_PluginGetAssertion    : IntPtr
        EXPERIMENTAL_PluginCancelOperation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := EXPERIMENTAL_IPluginAuthenticator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_REQUEST>} request 
     * @returns {Pointer<EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_RESPONSE>} 
     */
    EXPERIMENTAL_PluginMakeCredential(request) {
        result := ComCall(3, this, EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_REQUEST.Ptr, request, "ptr*", &response := 0, "HRESULT")
        return response
    }

    /**
     * 
     * @param {Pointer<EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_REQUEST>} request 
     * @returns {Pointer<EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_RESPONSE>} 
     */
    EXPERIMENTAL_PluginGetAssertion(request) {
        result := ComCall(4, this, EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_REQUEST.Ptr, request, "ptr*", &response := 0, "HRESULT")
        return response
    }

    /**
     * 
     * @param {Pointer<EXPERIMENTAL_WEBAUTHN_PLUGIN_CANCEL_OPERATION_REQUEST>} request 
     * @returns {HRESULT} 
     */
    EXPERIMENTAL_PluginCancelOperation(request) {
        result := ComCall(5, this, EXPERIMENTAL_WEBAUTHN_PLUGIN_CANCEL_OPERATION_REQUEST.Ptr, request, "HRESULT")
        return result
    }

    Query(iid) {
        if (EXPERIMENTAL_IPluginAuthenticator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EXPERIMENTAL_PluginMakeCredential := CallbackCreate(GetMethod(implObj, "EXPERIMENTAL_PluginMakeCredential"), flags, 3)
        this.vtbl.EXPERIMENTAL_PluginGetAssertion := CallbackCreate(GetMethod(implObj, "EXPERIMENTAL_PluginGetAssertion"), flags, 3)
        this.vtbl.EXPERIMENTAL_PluginCancelOperation := CallbackCreate(GetMethod(implObj, "EXPERIMENTAL_PluginCancelOperation"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EXPERIMENTAL_PluginMakeCredential)
        CallbackFree(this.vtbl.EXPERIMENTAL_PluginGetAssertion)
        CallbackFree(this.vtbl.EXPERIMENTAL_PluginCancelOperation)
    }
}
