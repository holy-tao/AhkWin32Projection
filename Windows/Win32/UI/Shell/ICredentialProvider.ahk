#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods used in the setup and manipulation of a credential provider. All credential providers must implement this interface.
 * @remarks
 * 
  * This interface is how you will interact with the Logon UI and the Credential UI for your app.
  * 
  * An instantiated credential provider is maintained for the entire lifetime of a Logon UI. Because of this, the Logon UI can maintain the state of a credential provider. In particular, it remembers which provider and tile provided a credential. This means that you can potentially store state information when you are using a <a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_usage_scenario">CREDENTIAL_PROVIDER_USAGE_SCENARIO</a> of <b>CPUS_LOGON</b>, <b>CPUS_UNLOCK_WORKSTATION</b>, and <b>CPUS_CHANGE_PASSWORD</b>. This is not the case with the Credential UI. The Credential UI creates a new instance of the provider every time an application calls <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduipromptforwindowscredentialsa">CredUIPromptForWindowsCredentials</a>. Because of this, the Credential UI cannot remember a credential provider's state.
  * 
  * Be aware that  a <a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ns-credentialprovider-credential_provider_credential_serialization">CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION</a> generated in one scenario might be saved and used in a subsequent usage scenario. Because of this, it is necessary to make sure your <b>ICredentialProvider</b> implementation is robust enough to handle this scenario.
  * 
  * Windows 8 adds new functionality in the credential providers API, primarily the ability to group credentials by user.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nn-credentialprovider-icredentialprovider
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICredentialProvider extends IUnknown{
    /**
     * The interface identifier for ICredentialProvider
     * @type {Guid}
     */
    static IID => Guid("{d27c3481-5a1c-45b2-8aaa-c20ebbe8229e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cpus 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetUsageScenario(cpus, dwFlags) {
        result := ComCall(3, this, "int", cpus, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION>} pcpcs 
     * @returns {HRESULT} 
     */
    SetSerialization(pcpcs) {
        result := ComCall(4, this, "ptr", pcpcs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICredentialProviderEvents>} pcpe 
     * @param {Pointer} upAdviseContext 
     * @returns {HRESULT} 
     */
    Advise(pcpe, upAdviseContext) {
        result := ComCall(5, this, "ptr", pcpe, "ptr", upAdviseContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnAdvise() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwCount 
     * @returns {HRESULT} 
     */
    GetFieldDescriptorCount(pdwCount) {
        result := ComCall(7, this, "uint*", pdwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<CREDENTIAL_PROVIDER_FIELD_DESCRIPTOR>} ppcpfd 
     * @returns {HRESULT} 
     */
    GetFieldDescriptorAt(dwIndex, ppcpfd) {
        result := ComCall(8, this, "uint", dwIndex, "ptr", ppcpfd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwCount 
     * @param {Pointer<UInt32>} pdwDefault 
     * @param {Pointer<BOOL>} pbAutoLogonWithDefault 
     * @returns {HRESULT} 
     */
    GetCredentialCount(pdwCount, pdwDefault, pbAutoLogonWithDefault) {
        result := ComCall(9, this, "uint*", pdwCount, "uint*", pdwDefault, "ptr", pbAutoLogonWithDefault, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<ICredentialProviderCredential>} ppcpc 
     * @returns {HRESULT} 
     */
    GetCredentialAt(dwIndex, ppcpc) {
        result := ComCall(10, this, "uint", dwIndex, "ptr", ppcpc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
