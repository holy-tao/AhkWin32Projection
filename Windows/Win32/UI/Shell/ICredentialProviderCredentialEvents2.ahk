#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ICredentialProviderCredentialEvents.ahk" { ICredentialProviderCredentialEvents }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CREDENTIAL_PROVIDER_CREDENTIAL_FIELD_OPTIONS.ahk" { CREDENTIAL_PROVIDER_CREDENTIAL_FIELD_OPTIONS }
#Import ".\ICredentialProviderCredential.ahk" { ICredentialProviderCredential }

/**
 * Extends the ICredentialProviderCredentialEvents interface by adding methods that enable batch updating of fields in theLogon UI or Credential UI.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nn-credentialprovider-icredentialprovidercredentialevents2
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ICredentialProviderCredentialEvents2 extends ICredentialProviderCredentialEvents {
    /**
     * The interface identifier for ICredentialProviderCredentialEvents2
     * @type {Guid}
     */
    static IID := Guid("{b53c00b6-9922-4b78-b1f4-ddfe774dc39b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICredentialProviderCredentialEvents2 interfaces
    */
    struct Vtbl extends ICredentialProviderCredentialEvents.Vtbl {
        BeginFieldUpdates : IntPtr
        EndFieldUpdates   : IntPtr
        SetFieldOptions   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICredentialProviderCredentialEvents2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Starts a batch update to fields in the logon or credential UI.
     * @remarks
     * A call to this method must be made at the beginning of the code that updates the credential's UI fields.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents2-beginfieldupdates
     */
    BeginFieldUpdates() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Finishes and commits the batch updates started by BeginFieldUpdates.
     * @remarks
     * A call to this method must be made at the end of the code that updates the credential's UI fields.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents2-endfieldupdates
     */
    EndFieldUpdates() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * Specifies whether a specified field in the logon or credential UI should display a &quot;password reveal&quot; glyph or is expected to receive an e-mail address.
     * @param {ICredentialProviderCredential} credential An <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredential">ICredentialProviderCredential</a> interface pointer to the credential object.
     * @param {Integer} fieldID The ID of the field in the logon or credential UI for which this option applies.
     * @param {CREDENTIAL_PROVIDER_CREDENTIAL_FIELD_OPTIONS} options One or more of the <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/ne-credentialprovider-credential_provider_credential_field_options">CREDENTIAL_PROVIDER_CREDENTIAL_FIELD_OPTIONS</a> values, which specify the field options.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents2-setfieldoptions
     */
    SetFieldOptions(credential, fieldID, options) {
        result := ComCall(15, this, "ptr", credential, "uint", fieldID, CREDENTIAL_PROVIDER_CREDENTIAL_FIELD_OPTIONS, options, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICredentialProviderCredentialEvents2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BeginFieldUpdates := CallbackCreate(GetMethod(implObj, "BeginFieldUpdates"), flags, 1)
        this.vtbl.EndFieldUpdates := CallbackCreate(GetMethod(implObj, "EndFieldUpdates"), flags, 1)
        this.vtbl.SetFieldOptions := CallbackCreate(GetMethod(implObj, "SetFieldOptions"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BeginFieldUpdates)
        CallbackFree(this.vtbl.EndFieldUpdates)
        CallbackFree(this.vtbl.SetFieldOptions)
    }
}
