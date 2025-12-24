#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICredentialProviderCredential.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetUsageScenario", "SetSerialization", "Advise", "UnAdvise", "GetFieldDescriptorCount", "GetFieldDescriptorAt", "GetCredentialCount", "GetCredentialAt"]

    /**
     * Defines the scenarios for which the credential provider is valid. Called whenever the credential provider is initialized.
     * @param {Integer} cpus Type: <b><a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_usage_scenario">CREDENTIAL_PROVIDER_USAGE_SCENARIO</a></b>
     * 
     * The scenario the credential provider has been created in. This is the usage scenario that needs to be supported. See the Remarks for more information.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovider-setusagescenario
     */
    SetUsageScenario(cpus, dwFlags) {
        result := ComCall(3, this, "int", cpus, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Sets the serialization characteristics of the credential provider.
     * @param {Pointer<CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION>} pcpcs Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ns-credentialprovider-credential_provider_credential_serialization">CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ns-credentialprovider-credential_provider_credential_serialization">CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION</a> structure that stores the serialization characteristics of the credential provider.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovider-setserialization
     */
    SetSerialization(pcpcs) {
        result := ComCall(4, this, "ptr", pcpcs, "HRESULT")
        return result
    }

    /**
     * Allows a credential provider to initiate events in the Logon UI or Credential UI through a callback interface.
     * @param {ICredentialProviderEvents} pcpe Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialproviderevents">ICredentialProviderEvents</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialproviderevents">ICredentialProviderEvents</a> callback interface to be used as the notification mechanism.
     * @param {Pointer} upAdviseContext Type: <b>UINT_PTR</b>
     * 
     * A pointer to an integer that uniquely identifies which credential provider has requested re-enumeration.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovider-advise
     */
    Advise(pcpe, upAdviseContext) {
        result := ComCall(5, this, "ptr", pcpe, "ptr", upAdviseContext, "HRESULT")
        return result
    }

    /**
     * Used by the Logon UI or Credential UI to advise the credential provider that event callbacks are no longer accepted.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovider-unadvise
     */
    UnAdvise() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the count of fields in the needed to display this provider's credentials.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * Pointer to the field count.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovider-getfielddescriptorcount
     */
    GetFieldDescriptorCount() {
        result := ComCall(7, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * Gets metadata that describes a specified field.
     * @param {Integer} dwIndex Type: <b>DWORD</b>
     * 
     * The zero-based index of the field for which the information should be retrieved.
     * @returns {Pointer<CREDENTIAL_PROVIDER_FIELD_DESCRIPTOR>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ns-credentialprovider-credential_provider_field_descriptor">CREDENTIAL_PROVIDER_FIELD_DESCRIPTOR</a>**</b>
     * 
     * The address of a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ns-credentialprovider-credential_provider_field_descriptor">CREDENTIAL_PROVIDER_FIELD_DESCRIPTOR</a> structure which receives the information about the field.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovider-getfielddescriptorat
     */
    GetFieldDescriptorAt(dwIndex) {
        result := ComCall(8, this, "uint", dwIndex, "ptr*", &ppcpfd := 0, "HRESULT")
        return ppcpfd
    }

    /**
     * Gets the number of available credentials under this credential provider.
     * @param {Pointer<Integer>} pdwCount Type: <b>DWORD*</b>
     * 
     * A pointer to a <b>DWORD</b> value that receives the count of credentials.
     * @param {Pointer<Integer>} pdwDefault Type: <b>DWORD*</b>
     * 
     * A pointer to a <b>DWORD</b> value that receives the index of the credential to be used as the default. If no default value has been set, this value should be set to <b>CREDENTIAL_PROVIDER_NO_DEFAULT</b>.
     * @param {Pointer<BOOL>} pbAutoLogonWithDefault Type: <b>BOOL*</b>
     * 
     * A pointer to a <b>BOOL</b> value indicating if the default credential identified by <i>pdwDefault</i> should be used for an auto logon attempt. An auto logon attempt means the Logon UI or Credential UI will immediately call <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential-getserialization">GetSerialization</a> on the provider's default tile.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovider-getcredentialcount
     */
    GetCredentialCount(pdwCount, pdwDefault, pbAutoLogonWithDefault) {
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"
        pdwDefaultMarshal := pdwDefault is VarRef ? "uint*" : "ptr"
        pbAutoLogonWithDefaultMarshal := pbAutoLogonWithDefault is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pdwCountMarshal, pdwCount, pdwDefaultMarshal, pdwDefault, pbAutoLogonWithDefaultMarshal, pbAutoLogonWithDefault, "HRESULT")
        return result
    }

    /**
     * Gets a specific credential.
     * @param {Integer} dwIndex Type: <b>DWORD</b>
     * 
     * The zero-based index of the credential within the set of credentials enumerated for this credential provider.
     * @returns {ICredentialProviderCredential} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredential">ICredentialProviderCredential</a>**</b>
     * 
     * The address of a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredential">ICredentialProviderCredential</a> instance representing the credential.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovider-getcredentialat
     */
    GetCredentialAt(dwIndex) {
        result := ComCall(10, this, "uint", dwIndex, "ptr*", &ppcpc := 0, "HRESULT")
        return ICredentialProviderCredential(ppcpc)
    }
}
