#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ICredentialProviderUser.ahk" { ICredentialProviderUser }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CREDENTIAL_PROVIDER_ACCOUNT_OPTIONS.ahk" { CREDENTIAL_PROVIDER_ACCOUNT_OPTIONS }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents the set of users that will appear in the logon or credential UI. This information enables the credential provider to enumerate the set to retrieve property information about each user to populate fields or filter the set.
 * @remarks
 * This object is provided by the Windows credential provider framework to your credential provider through the <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovidersetuserarray-setuserarray">ICredentialProviderSetUserArray::SetUserArray</a> method. Ownership of this object remains with the credential provider framework.
 * 
 * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
 * Third-parties do not implement this interface. An implementation is included with Windows.
 * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nn-credentialprovider-icredentialprovideruserarray
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ICredentialProviderUserArray extends IUnknown {
    /**
     * The interface identifier for ICredentialProviderUserArray
     * @type {Guid}
     */
    static IID := Guid("{90c119ae-0f18-4520-a1f1-114366a40fe8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICredentialProviderUserArray interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetProviderFilter : IntPtr
        GetAccountOptions : IntPtr
        GetCount          : IntPtr
        GetAt             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICredentialProviderUserArray.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Limits the set of users in the array to either local accounts or Microsoft accounts.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_usage_scenario">ICredentialProviderUserArray</a> object contains all of the available users in the current <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/ne-credentialprovider-credential_provider_usage_scenario">scenario</a>. This method enables your credential provider to specify a particular subset of those users. For example, if your credential provider handles only Microsoft account users from a specific connected provider, it can call this method with the Microsoft account provider's ID to filter out users that belong to other providers.
     * 
     * This method can only be called once, to filter for a single account provider. If the method is called again, the call will fail with a return value of E_UNEXPECTED.
     * @param {Pointer<Guid>} guidProviderToFilterTo Set this parameter to Identity_LocalUserProvider for the local accounts credential provider; otherwise set it to the GUID of the Microsoft account provider.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovideruserarray-setproviderfilter
     */
    SetProviderFilter(guidProviderToFilterTo) {
        result := ComCall(3, this, Guid.Ptr, guidProviderToFilterTo, "HRESULT")
        return result
    }

    /**
     * Retrieves a value that indicates whether the &quot;Other user&quot; tile for local or Microsoft accounts is shown in the logon or credential UI.
     * @returns {CREDENTIAL_PROVIDER_ACCOUNT_OPTIONS} A pointer to a value that, when this method returns successfully, receives one or more flags that specify which empty tiles are shown by the logon or credential UI.
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovideruserarray-getaccountoptions
     */
    GetAccountOptions() {
        result := ComCall(4, this, "int*", &credentialProviderAccountOptions := 0, "HRESULT")
        return credentialProviderAccountOptions
    }

    /**
     * Retrieves the number of ICredentialProviderUser objects in the user array.
     * @returns {Integer} A pointer to a value that, when this method returns successfully, receives the number of users in the array.
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovideruserarray-getcount
     */
    GetCount() {
        result := ComCall(5, this, "uint*", &userCount := 0, "HRESULT")
        return userCount
    }

    /**
     * Retrieves a specified user from the array.
     * @param {Integer} userIndex The 0-based array index of the user. The size of the array can be obtained through the <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovideruserarray-getcount">GetCount</a> method.
     * @returns {ICredentialProviderUser} The address of a pointer to an object that, when this method returns successfully, represents the specified user. It is the responsibility of the caller to free this object when it is no longer needed by calling its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovideruserarray-getat
     */
    GetAt(userIndex) {
        result := ComCall(6, this, "uint", userIndex, "ptr*", &user := 0, "HRESULT")
        return ICredentialProviderUser(user)
    }

    Query(iid) {
        if (ICredentialProviderUserArray.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetProviderFilter := CallbackCreate(GetMethod(implObj, "SetProviderFilter"), flags, 2)
        this.vtbl.GetAccountOptions := CallbackCreate(GetMethod(implObj, "GetAccountOptions"), flags, 2)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetAt := CallbackCreate(GetMethod(implObj, "GetAt"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetProviderFilter)
        CallbackFree(this.vtbl.GetAccountOptions)
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetAt)
    }
}
