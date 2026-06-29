#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\CREDENTIAL_PROVIDER_CREDENTIAL_FIELD_OPTIONS.ahk" { CREDENTIAL_PROVIDER_CREDENTIAL_FIELD_OPTIONS }

/**
 * Provides a method that enables the credential provider framework to determine whether you've made a customization to a field's option in a logon or credential UI.
 * @remarks
 * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
 * Implement this interface if your credential provider overrides the default field options through <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents2-setfieldoptions">ICredentialProviderCredentialEvents2::SetFieldOptions</a>. This enables the credential provider framework to determine the field options that you've specified .
 * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nn-credentialprovider-icredentialprovidercredentialwithfieldoptions
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ICredentialProviderCredentialWithFieldOptions extends IUnknown {
    /**
     * The interface identifier for ICredentialProviderCredentialWithFieldOptions
     * @type {Guid}
     */
    static IID := Guid("{dbc6fb30-c843-49e3-a645-573e6f39446a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICredentialProviderCredentialWithFieldOptions interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFieldOptions : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICredentialProviderCredentialWithFieldOptions.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the current option set for a specified field in a logon or credential UI. Called by the credential provider framework.
     * @param {Integer} fieldID The ID of the field in the logon or credential UI.
     * @returns {CREDENTIAL_PROVIDER_CREDENTIAL_FIELD_OPTIONS} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/ne-credentialprovider-credential_provider_credential_field_options">CREDENTIAL_PROVIDER_CREDENTIAL_FIELD_OPTIONS</a> value that, when this method returns successfully, receives one or more flags that specify the current options for the field.
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredentialwithfieldoptions-getfieldoptions
     */
    GetFieldOptions(fieldID) {
        result := ComCall(3, this, "uint", fieldID, "int*", &options := 0, "HRESULT")
        return options
    }

    Query(iid) {
        if (ICredentialProviderCredentialWithFieldOptions.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFieldOptions := CallbackCreate(GetMethod(implObj, "GetFieldOptions"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFieldOptions)
    }
}
