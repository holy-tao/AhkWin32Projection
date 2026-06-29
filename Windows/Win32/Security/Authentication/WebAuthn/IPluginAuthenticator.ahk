#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\PLUGIN_LOCK_STATUS.ahk" { PLUGIN_LOCK_STATUS }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WEBAUTHN_PLUGIN_OPERATION_RESPONSE.ahk" { WEBAUTHN_PLUGIN_OPERATION_RESPONSE }
#Import ".\WEBAUTHN_PLUGIN_OPERATION_REQUEST.ahk" { WEBAUTHN_PLUGIN_OPERATION_REQUEST }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\WEBAUTHN_PLUGIN_CANCEL_OPERATION_REQUEST.ahk" { WEBAUTHN_PLUGIN_CANCEL_OPERATION_REQUEST }

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct IPluginAuthenticator extends IUnknown {
    /**
     * The interface identifier for IPluginAuthenticator
     * @type {Guid}
     */
    static IID := Guid("{d26bcf6f-b54c-43ff-9f06-d5bf148625f7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPluginAuthenticator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        MakeCredential  : IntPtr
        GetAssertion    : IntPtr
        CancelOperation : IntPtr
        GetLockStatus   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPluginAuthenticator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<WEBAUTHN_PLUGIN_OPERATION_REQUEST>} request 
     * @returns {WEBAUTHN_PLUGIN_OPERATION_RESPONSE} 
     */
    MakeCredential(request) {
        response := WEBAUTHN_PLUGIN_OPERATION_RESPONSE()
        result := ComCall(3, this, WEBAUTHN_PLUGIN_OPERATION_REQUEST.Ptr, request, WEBAUTHN_PLUGIN_OPERATION_RESPONSE.Ptr, response, "HRESULT")
        return response
    }

    /**
     * 
     * @param {Pointer<WEBAUTHN_PLUGIN_OPERATION_REQUEST>} request 
     * @returns {WEBAUTHN_PLUGIN_OPERATION_RESPONSE} 
     */
    GetAssertion(request) {
        response := WEBAUTHN_PLUGIN_OPERATION_RESPONSE()
        result := ComCall(4, this, WEBAUTHN_PLUGIN_OPERATION_REQUEST.Ptr, request, WEBAUTHN_PLUGIN_OPERATION_RESPONSE.Ptr, response, "HRESULT")
        return response
    }

    /**
     * 
     * @param {Pointer<WEBAUTHN_PLUGIN_CANCEL_OPERATION_REQUEST>} request 
     * @returns {HRESULT} 
     */
    CancelOperation(request) {
        result := ComCall(5, this, WEBAUTHN_PLUGIN_CANCEL_OPERATION_REQUEST.Ptr, request, "HRESULT")
        return result
    }

    /**
     * Indicates whether the contents of the volume are accessible from Windows.
     * @remarks
     * Use the [**UnlockWithExternalKey**](unlockwithexternalkey-win32-encryptablevolume.md) and [**UnlockWithNumericalPassword**](unlockwithnumericalpassword-win32-encryptablevolume.md) to get access to the volume contents. Use the [**Lock**](lock-win32-encryptablevolume.md) method to relinquish access to volume contents.
     * 
     * The volume that contains the currently running operating system is always accessible and cannot be locked.
     * 
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @returns {PLUGIN_LOCK_STATUS} 
     * @see https://learn.microsoft.com/windows/win32/SecProv/getlockstatus-win32-encryptablevolume
     */
    GetLockStatus() {
        result := ComCall(6, this, "int*", &lockStatus := 0, "HRESULT")
        return lockStatus
    }

    Query(iid) {
        if (IPluginAuthenticator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.MakeCredential := CallbackCreate(GetMethod(implObj, "MakeCredential"), flags, 3)
        this.vtbl.GetAssertion := CallbackCreate(GetMethod(implObj, "GetAssertion"), flags, 3)
        this.vtbl.CancelOperation := CallbackCreate(GetMethod(implObj, "CancelOperation"), flags, 2)
        this.vtbl.GetLockStatus := CallbackCreate(GetMethod(implObj, "GetLockStatus"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.MakeCredential)
        CallbackFree(this.vtbl.GetAssertion)
        CallbackFree(this.vtbl.CancelOperation)
        CallbackFree(this.vtbl.GetLockStatus)
    }
}
