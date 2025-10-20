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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents2-beginfieldupdates
     */
    BeginFieldUpdates() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents2-endfieldupdates
     */
    EndFieldUpdates() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICredentialProviderCredential} credential 
     * @param {Integer} fieldID 
     * @param {Integer} options 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents2-setfieldoptions
     */
    SetFieldOptions(credential, fieldID, options) {
        result := ComCall(15, this, "ptr", credential, "uint", fieldID, "int", options, "HRESULT")
        return result
    }
}
