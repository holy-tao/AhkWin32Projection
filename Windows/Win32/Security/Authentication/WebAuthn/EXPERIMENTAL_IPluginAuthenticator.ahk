#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 * @version v4.0.30319
 */
class EXPERIMENTAL_IPluginAuthenticator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for EXPERIMENTAL_IPluginAuthenticator
     * @type {Guid}
     */
    static IID => Guid("{e6466e9a-b2f3-47c5-b88d-89bc14a8d998}")

    /**
     * The class identifier for EXPERIMENTAL_IPluginAuthenticator
     * @type {Guid}
     */
    static CLSID => Guid("{e6466e9a-b2f3-47c5-b88d-89bc14a8d998}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EXPERIMENTAL_PluginMakeCredential", "EXPERIMENTAL_PluginGetAssertion", "EXPERIMENTAL_PluginCancelOperation"]

    /**
     * 
     * @param {Pointer<EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_REQUEST>} request 
     * @returns {Pointer<EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_RESPONSE>} 
     */
    EXPERIMENTAL_PluginMakeCredential(request) {
        result := ComCall(3, this, "ptr", request, "ptr*", &response := 0, "HRESULT")
        return response
    }

    /**
     * 
     * @param {Pointer<EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_REQUEST>} request 
     * @returns {Pointer<EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_RESPONSE>} 
     */
    EXPERIMENTAL_PluginGetAssertion(request) {
        result := ComCall(4, this, "ptr", request, "ptr*", &response := 0, "HRESULT")
        return response
    }

    /**
     * 
     * @param {Pointer<EXPERIMENTAL_WEBAUTHN_PLUGIN_CANCEL_OPERATION_REQUEST>} request 
     * @returns {HRESULT} 
     */
    EXPERIMENTAL_PluginCancelOperation(request) {
        result := ComCall(5, this, "ptr", request, "HRESULT")
        return result
    }
}
