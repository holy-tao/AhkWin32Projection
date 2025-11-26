#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICredentialProviderCredentialEvents.ahk

/**
 * Extends the ICredentialProviderCredentialEvents interface by adding methods that enable batch updating of fields in theLogon UI or Credential UI.
 * @remarks
 * 
 * In Windows 7 and Windows Vista, many credential providers used <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialproviderevents-credentialschanged">ICredentialProviderEvents::CredentialsChanged</a> to update UI. While this works, it causes a re-enumeration of all the credentials from the calling credential provider. The processing of this event can, under some circumstances, lead to flashing or focus changes in the UI due to this re-enumeration. Therefore, using <b>ICredentialProviderEvents::CredentialsChanged</b> solely for UI updates is discouraged. The new recommendation is as follows:
 * 
 *                 
 * 
 * <ul>
 * <li>Use <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialproviderevents-credentialschanged">ICredentialProviderEvents::CredentialsChanged</a> only if a credential provider needs to do automatically logon a user or change the number of credentials it is enumerating.</li>
 * <li>Use <b>ICredentialProviderCredentialEvents2</b> to update a credential provider's UI.</li>
 * </ul>
 * <b>ICredentialProviderCredentialEvents2</b> includes all of the methods inherited from <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredentialevents">ICredentialProviderCredentialEvents</a>. This includes all of the inherited methods except <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents-oncreatingwindow">OnCreatingWindow</a>.
 * 
 * When interacting with a background thread, the use of <b>ICredentialProviderCredentialEvents2</b> is similar to the use of <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredentialevents">ICredentialProviderCredentialEvents</a>, in that proper inter-thread communication methods must be used.
 * 
 * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
 * Third-parties do not implement this interface. Call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method on <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredentialevents">ICredentialProviderCredentialEvents</a> to obtain this object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nn-credentialprovider-icredentialprovidercredentialevents2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICredentialProviderCredentialEvents2 extends ICredentialProviderCredentialEvents{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICredentialProviderCredentialEvents2
     * @type {Guid}
     */
    static IID => Guid("{b53c00b6-9922-4b78-b1f4-ddfe774dc39b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginFieldUpdates", "EndFieldUpdates", "SetFieldOptions"]

    /**
     * Starts a batch update to fields in the logon or credential UI.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents2-beginfieldupdates
     */
    BeginFieldUpdates() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Finishes and commits the batch updates started by BeginFieldUpdates.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents2-endfieldupdates
     */
    EndFieldUpdates() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * Specifies whether a specified field in the logon or credential UI should display a &quot;password reveal&quot; glyph or is expected to receive an e-mail address.
     * @param {ICredentialProviderCredential} credential An <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredential">ICredentialProviderCredential</a> interface pointer to the credential object.
     * @param {Integer} fieldID The ID of the field in the logon or credential UI for which this option applies.
     * @param {Integer} options One or more of the <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/ne-credentialprovider-credential_provider_credential_field_options">CREDENTIAL_PROVIDER_CREDENTIAL_FIELD_OPTIONS</a> values, which specify the field options.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents2-setfieldoptions
     */
    SetFieldOptions(credential, fieldID, options) {
        result := ComCall(15, this, "ptr", credential, "uint", fieldID, "int", options, "HRESULT")
        return result
    }
}
