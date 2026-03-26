#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\WEBAUTHN_PLUGIN_OPERATION_RESPONSE.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 * @version v4.0.30319
 */
class IPluginAuthenticator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPluginAuthenticator
     * @type {Guid}
     */
    static IID => Guid("{d26bcf6f-b54c-43ff-9f06-d5bf148625f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MakeCredential", "GetAssertion", "CancelOperation", "GetLockStatus"]

    /**
     * 
     * @param {Pointer<WEBAUTHN_PLUGIN_OPERATION_REQUEST>} request 
     * @returns {WEBAUTHN_PLUGIN_OPERATION_RESPONSE} 
     */
    MakeCredential(request) {
        response := WEBAUTHN_PLUGIN_OPERATION_RESPONSE()
        result := ComCall(3, this, "ptr", request, "ptr", response, "HRESULT")
        return response
    }

    /**
     * 
     * @param {Pointer<WEBAUTHN_PLUGIN_OPERATION_REQUEST>} request 
     * @returns {WEBAUTHN_PLUGIN_OPERATION_RESPONSE} 
     */
    GetAssertion(request) {
        response := WEBAUTHN_PLUGIN_OPERATION_RESPONSE()
        result := ComCall(4, this, "ptr", request, "ptr", response, "HRESULT")
        return response
    }

    /**
     * 
     * @param {Pointer<WEBAUTHN_PLUGIN_CANCEL_OPERATION_REQUEST>} request 
     * @returns {HRESULT} 
     */
    CancelOperation(request) {
        result := ComCall(5, this, "ptr", request, "HRESULT")
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/SecProv/getlockstatus-win32-encryptablevolume
     */
    GetLockStatus() {
        result := ComCall(6, this, "int*", &lockStatus := 0, "HRESULT")
        return lockStatus
    }
}
