#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides an asynchronous callback mechanism used by a credential provider to notify it of changes in the list of credentials or their fields.
 * @remarks
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * An implementation of <b>ICredentialProviderEvents</b> is provided for use by outside parties implementing a credential provider.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Outside parties do not need to implement <b>ICredentialProviderEvents</b> themselves.
 * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nn-credentialprovider-icredentialproviderevents
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ICredentialProviderEvents extends IUnknown {
    /**
     * The interface identifier for ICredentialProviderEvents
     * @type {Guid}
     */
    static IID := Guid("{34201e5a-a787-41a3-a5a4-bd6dcf2a854e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICredentialProviderEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CredentialsChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICredentialProviderEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Signals the Logon UI or Credential UI that the enumerated list of credentials has changed.
     * @remarks
     * In the past, many credential providers used <b>ICredentialProviderEvents::CredentialsChanged</b> to update UI. While this works, it causes a re-enumeration of all the credentials from the calling credential provider. The processing of this event can, under some circumstances, lead to flashing or focus changes in the UI due to this re-enumeration. Therefore, using <b>ICredentialProviderEvents::CredentialsChanged</b> solely for UI updates is discouraged. The new recommendation is as follows:
     * 
     *                 
     * 
     * <ul>
     * <li>Use <b>ICredentialProviderEvents::CredentialsChanged</b> only if a credential provider needs to do an auto logon or change the number of credentials it is enumerating.</li>
     * <li>Use <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredentialevents2">ICredentialProviderCredentialEvents2</a> to update a credential provider's Logon UI or Credential UI.</li>
     * </ul>
     * @param {Pointer} upAdviseContext Type: <b>UINT_PTR</b>
     * 
     * A pointer to an integer that uniquely identifies which credential provider has requested re-enumeration. The credential provider should pass back the interface pointer it received from <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovider-advise">Advise</a> in this parameter.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialproviderevents-credentialschanged
     */
    CredentialsChanged(upAdviseContext) {
        result := ComCall(3, this, "ptr", upAdviseContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICredentialProviderEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CredentialsChanged := CallbackCreate(GetMethod(implObj, "CredentialsChanged"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CredentialsChanged)
    }
}
