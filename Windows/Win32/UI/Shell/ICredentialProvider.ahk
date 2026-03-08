#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICredentialProviderCredential.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods used in the setup and manipulation of a credential provider. All credential providers must implement this interface.
 * @remarks
 * This interface is how you will interact with the Logon UI and the Credential UI for your app.
 * 
 * An instantiated credential provider is maintained for the entire lifetime of a Logon UI. Because of this, the Logon UI can maintain the state of a credential provider. In particular, it remembers which provider and tile provided a credential. This means that you can potentially store state information when you are using a <a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_usage_scenario">CREDENTIAL_PROVIDER_USAGE_SCENARIO</a> of <b>CPUS_LOGON</b>, <b>CPUS_UNLOCK_WORKSTATION</b>, and <b>CPUS_CHANGE_PASSWORD</b>. This is not the case with the Credential UI. The Credential UI creates a new instance of the provider every time an application calls <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduipromptforwindowscredentialsa">CredUIPromptForWindowsCredentials</a>. Because of this, the Credential UI cannot remember a credential provider's state.
 * 
 * Be aware that  a <a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ns-credentialprovider-credential_provider_credential_serialization">CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION</a> generated in one scenario might be saved and used in a subsequent usage scenario. Because of this, it is necessary to make sure your <b>ICredentialProvider</b> implementation is robust enough to handle this scenario.
 * 
 * Windows 8 adds new functionality in the credential providers API, primarily the ability to group credentials by user.
 * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nn-credentialprovider-icredentialprovider
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
     * @remarks
     * This method is required and enables the credential provider to indicate how it will be used.
     * 
     * This method should return <b>E_NOTIMPL</b> if the call completes but the requested usage scenario is not supported. This method should return <b>S_OK</b> if the method is successful and the usage scenario is supported.
     * @param {Integer} cpus Type: <b><a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_usage_scenario">CREDENTIAL_PROVIDER_USAGE_SCENARIO</a></b>
     * 
     * The scenario the credential provider has been created in. This is the usage scenario that needs to be supported. See the Remarks for more information.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovider-setusagescenario
     */
    SetUsageScenario(cpus, dwFlags) {
        result := ComCall(3, this, "int", cpus, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Sets the serialization characteristics of the credential provider.
     * @remarks
     * This method is required. It accepts a credential and determines if <i>pcpcs</i> was a partial or a full credential. If it is a partial credential, it is either incomplete or was passed for the purpose of displaying some information to the user. If it is a full credential, it should be serialized and submitted. Use the members of the <a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ns-credentialprovider-credential_provider_credential_serialization">CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION</a> and the flags passed in <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovider-setusagescenario">SetUsageScenario</a> to determine how to handle the input. The responsibility is on the credential provider to verify the integrity of the input. The Credential UI and Logon UI do not perform any checks on the structure before passing it to the credential provider.
     * 
     * <b>SetSerialization</b> is always called after <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovider-setusagescenario">SetUsageScenario</a>. The Logon UI also calls <b>SetSerialization</b> when a filter returns a credential through <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialproviderfilter-updateremotecredential">UpdateRemoteCredential</a>. It does not use this method when re-enumerating tiles because of a call to <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialproviderevents-credentialschanged">CredentialsChanged</a>. The Credential UI calls <b>SetSerialization</b> when an input credential has been suppled by an application.
     * 
     * The Credential UI enforces the following rules based on the <i>dwFlags</i> for this content provider instance defined when <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovider-setusagescenario">SetUsageScenario</a> was called.
     * 
     * <ul>
     * <li>If the flags include <b>CREDUIWIN_IN_CRED_ONLY</b>, all credential providers returning <b>S_OK</b> are enabled.</li>
     * <li>If the flags include <b>CREDUIWIN_AUTHPACKAGE_ONLY</b>, all credential providers returning a success status are enabled.</li>
     * <li>If neither of those flags are included, then the Credential UI follows the same logic as the Logon UI and all credential providers that implement the <a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_usage_scenario">CREDENTIAL_PROVIDER_USAGE_SCENARIO</a><b>CPUS_REDUI</b> will be enabled regardless of the returned status value.</li>
     * </ul>
     * Credential providers that implement a <a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_usage_scenario">CREDENTIAL_PROVIDER_USAGE_SCENARIO</a> of <b>CPUS_LOGON</b> and return a failure from this method will still be enabled.
     * @param {Pointer<CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION>} pcpcs Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ns-credentialprovider-credential_provider_credential_serialization">CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ns-credentialprovider-credential_provider_credential_serialization">CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION</a> structure that stores the serialization characteristics of the credential provider.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovider-setserialization
     */
    SetSerialization(pcpcs) {
        result := ComCall(4, this, "ptr", pcpcs, "HRESULT")
        return result
    }

    /**
     * Allows a credential provider to initiate events in the Logon UI or Credential UI through a callback interface.
     * @remarks
     * The method does not need to be implemented, and should return <b>E_NOTIMPL</b> if it doesn't. There might be no reason to call it, such as if the Logon UI or Credential UI never changes or updates.
     * 
     * This method enables the Logon UI and the Credential UI to pass an <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialproviderevents">ICredentialProviderEvents</a> pointer to the credential provider. This enables the credential provider to have asynchronous callback communication with the Logon or Credential UI. For example, a smart card provider might want to enumerate credentials again when a new smart card is inserted. In order to trigger the Logon UI to get credentials again,  the credential provider should call <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialproviderevents-credentialschanged">CredentialsChanged</a> providing the <i>upAdviseContext</i> identifier.
     * 
     * Credential providers that implement this method have the responsibility of calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the provided <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialproviderevents">ICredentialProviderEvents</a>. Those credential providers also need to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> during the <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovider-unadvise">UnAdvise</a> method.
     * @param {ICredentialProviderEvents} pcpe Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialproviderevents">ICredentialProviderEvents</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialproviderevents">ICredentialProviderEvents</a> callback interface to be used as the notification mechanism.
     * @param {Pointer} upAdviseContext Type: <b>UINT_PTR</b>
     * 
     * A pointer to an integer that uniquely identifies which credential provider has requested re-enumeration.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovider-advise
     */
    Advise(pcpe, upAdviseContext) {
        result := ComCall(5, this, "ptr", pcpe, "ptr", upAdviseContext, "HRESULT")
        return result
    }

    /**
     * Used by the Logon UI or Credential UI to advise the credential provider that event callbacks are no longer accepted.
     * @remarks
     * This method does not need to be implemented, and should return <b>E_NOTIMPL</b> if it does not. There might be no reason to call it, such as if the Logon UI or Credential UI never changes or updates.
     * 
     * If this method is called, it indicates that the <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialproviderevents">ICredentialProviderEvents</a> pointer provided in <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovider-advise">Advise</a> is no longer valid. It is the responsibility of the credential provider to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the provided <b>ICredentialProviderEvents</b> pointer during this method.
     * 
     * <div class="alert"><b>Important</b>  <p class="note">You should not use this method to clean up allocated memory for the credential provider. you should do that in the destructor of the credential provider as normal.
     * 
     * </div>
     * <div> </div>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovider-unadvise
     */
    UnAdvise() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the count of fields in the needed to display this provider's credentials.
     * @remarks
     * This method is required.
     * 
     * The count provided by this method must be valid for the entire usage scenario. This means that you need to include all fields, even those that are hidden or only shown under special circumstances. This value cannot be changed during a usage scenario and can only be changed when a new <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovider-setusagescenario">SetUsageScenario</a> call is made to the provider or the <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialproviderevents">ICredentialProviderEvents</a> instance forces another enumeration.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * Pointer to the field count.
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovider-getfielddescriptorcount
     */
    GetFieldDescriptorCount() {
        result := ComCall(7, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * Gets metadata that describes a specified field.
     * @remarks
     * This method is required.
     * @param {Integer} dwIndex Type: <b>DWORD</b>
     * 
     * The zero-based index of the field for which the information should be retrieved.
     * @returns {Pointer<CREDENTIAL_PROVIDER_FIELD_DESCRIPTOR>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ns-credentialprovider-credential_provider_field_descriptor">CREDENTIAL_PROVIDER_FIELD_DESCRIPTOR</a>**</b>
     * 
     * The address of a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ns-credentialprovider-credential_provider_field_descriptor">CREDENTIAL_PROVIDER_FIELD_DESCRIPTOR</a> structure which receives the information about the field.
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovider-getfielddescriptorat
     */
    GetFieldDescriptorAt(dwIndex) {
        result := ComCall(8, this, "uint", dwIndex, "ptr*", &ppcpfd := 0, "HRESULT")
        return ppcpfd
    }

    /**
     * Gets the number of available credentials under this credential provider.
     * @remarks
     * This method is required.
     * 
     * When a Logon UI or Credential UI is ready for user interaction, a default credential is selected by default. Since each credential provider supplies a default credential, the following rules determine if <i>pdwDefault</i> will receive focus or if the credential will be automatically logged in.
     * 
     * <ul>
     * <li>If a default credential has already been specified, that credential is not intended to be used for auto logon, and the <i>pdwDefault</i> is used for auto logon, then <i>pdwDefault</i> will be used as the default.</li>
     * <li>If <i>pdwDefault</i> is from the last logged on provider and there isn't already a default with auto logon, then <i>pdwDefault</i> will be used as the default.</li>
     * <li>If no default has been specified, then <i>pdwDefault</i> will be used as the default.</li>
     * </ul>
     * If the number of valid credentials change, the credential provider should call <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialproviderevents-credentialschanged">CredentialsChanged</a> on the  <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialproviderevents">ICredentialProviderEvents</a> instance provided in <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovider-advise">Advise</a>.
     * 
     * <h3><a id="Credential_Provider_Best_Practices"></a><a id="credential_provider_best_practices"></a><a id="CREDENTIAL_PROVIDER_BEST_PRACTICES"></a>Credential Provider Best Practices</h3>
     * Credential providers handle extremely sensitive user secrets in order to complete logon and unlock requests. As a best practice, secret information such as passwords and PINs should be handled with the utmost care. Proper techniques for handling secret information within a credential provider are: 
     * 
     *                 
     * 
     * <ul>
     * <li>Always securely discard secrets. To do this, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> before freeing the memory used to hold any secret.</li>
     * <li>Securely discard secrets promptly after they are used.</li>
     * <li>Securely discard secrets if they are not used for their intended purpose within an expected amount of time.</li>
     * </ul>
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovider-getcredentialcount
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
     * @remarks
     * This method is required.
     * 
     * The number of available credentials is retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovider-getcredentialcount">ICredentialProvider::GetCredentialCount</a>. This method is used by the Logon UI or Credential UI in conjunction with <b>GetCredentialCount</b> to enumerate the credentials.
     * @param {Integer} dwIndex Type: <b>DWORD</b>
     * 
     * The zero-based index of the credential within the set of credentials enumerated for this credential provider.
     * @returns {ICredentialProviderCredential} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredential">ICredentialProviderCredential</a>**</b>
     * 
     * The address of a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredential">ICredentialProviderCredential</a> instance representing the credential.
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovider-getcredentialat
     */
    GetCredentialAt(dwIndex) {
        result := ComCall(10, this, "uint", dwIndex, "ptr*", &ppcpc := 0, "HRESULT")
        return ICredentialProviderCredential(ppcpc)
    }
}
