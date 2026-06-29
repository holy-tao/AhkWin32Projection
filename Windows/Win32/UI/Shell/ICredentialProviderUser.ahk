#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods used to retrieve certain properties of an individual user included in a logon or credential UI.
 * @remarks
 * Windows 8 introduces the ability to group credential providers by user. The logon UI can display a set of users rather than a set of multiple credential providers for each user. Selecting a user then displays the individual credential provider options associated with that user.
 * 
 * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
 * Third-parties do not implement this interface. An implementation is included with Windows.
 * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nn-credentialprovider-icredentialprovideruser
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ICredentialProviderUser extends IUnknown {
    /**
     * The interface identifier for ICredentialProviderUser
     * @type {Guid}
     */
    static IID := Guid("{13793285-3ea6-40fd-b420-15f47da41fbb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICredentialProviderUser interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSid         : IntPtr
        GetProviderID  : IntPtr
        GetStringValue : IntPtr
        GetValue       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICredentialProviderUser.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the user's security identifier (SID). (ICredentialProviderUser.GetSid)
     * @remarks
     * This SID applies to both logon and credential UI.
     * 
     * This value can also be retrieved as a <b>PROPVARIANT</b> through <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovideruser-getvalue">ICredentialProviderUser::GetValue</a>.
     * @returns {PWSTR} The address of a pointer to a buffer that, when this method returns successfully, receives the user's SID. It is the responsibility of the caller to free this resource by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovideruser-getsid
     */
    GetSid() {
        result := ComCall(3, this, PWSTR.Ptr, &_sid := 0, "HRESULT")
        return _sid
    }

    /**
     * Retrieves the ID of the account provider for this user.
     * @remarks
     * This GUID applies to both logon and credential UI.
     * 
     * This value can also be retrieved as a <b>PROPVARIANT</b> through <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovideruser-getvalue">ICredentialProviderUser::GetValue</a>.
     * @returns {Guid} A pointer to a value that, when this method returns successfully, receives the GUID of the user's account provider.
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovideruser-getproviderid
     */
    GetProviderID() {
        providerID := Guid()
        result := ComCall(4, this, Guid.Ptr, providerID, "HRESULT")
        return providerID
    }

    /**
     * Retrieves string properties from the ICredentialProviderUser object based on the input value.
     * @remarks
     * Each of these values can also be retrieved as a <b>PROPVARIANT</b> through <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovideruser-getvalue">ICredentialProviderUser::GetValue</a>.
     * 
     * Consider a scenario with the following users.
     * 
     * <ul>
     * <li>Domain user:<ul>
     * <li>Domain: contoso</li>
     * <li>User name: lisa</li>
     * <li>Friendly name: Lisa Andrews</li>
     * </ul>
     * </li>
     * <li>Local user:<ul>
     * <li>PC name: lisa-pc</li>
     * <li>User name: lisa</li>
     * <li>Friendly name: Lisa Andrews</li>
     * </ul>
     * </li>
     * <li>Microsoft account:<ul>
     * <li>Email address: lisa@contoso.com</li>
     * <li>Friendly name: Lisa Andrews</li>
     * </ul>
     * </li>
     * </ul>
     * In this scenario, the following table provides some sample data for each of the <i>key</i> values.
     * 
     * <table>
     * <tr>
     * <th>REFPROPERTYKEY</th>
     * <th>Domain user</th>
     * <th>Local user</th>
     * <th>Microsoft account</th>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-identity-displayname">PKEY_Identity_DisplayName</a>
     * </td>
     * <td>"Lisa Andrews"</td>
     * <td>"Lisa Andrews"</td>
     * <td>"Lisa Andrews"</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-identity-logonstatusstring">PKEY_Identity_LogonStatusString</a>
     * </td>
     * <td>"Signed-in"</td>
     * <td>"Locked"</td>
     * <td>"Remotely signed in from lisa-pc"</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-identity-primarysid">PKEY_Identity_PrimarySid</a>
     * </td>
     * <td>"{S-1-5-21-2279990834-2601404236-735077814-1001}"</td>
     * <td>"{S-1-5-21-2279990834-2601404236-735077814-1001}"</td>
     * <td>"{S-1-5-21-2279990834-2601404236-735077814-1001}"</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-identity-providerid">PKEY_Identity_ProviderID</a>
     * </td>
     * <td>"{A198529B-730F-4089-B646-A12557F5665E}"</td>
     * <td>"{A198529B-730F-4089-B646-A12557F5665E}"</td>
     * <td>Not pre-defined</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-identity-qualifiedusername">PKEY_Identity_QualifiedUserName</a>
     * </td>
     * <td>"contoso\lisa"</td>
     * <td>"lisa-pc\lisa"</td>
     * <td>"&lt;account provider name&gt;\lisa@contoso.com"</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-identity-username">PKEY_Identity_UserName</a>
     * </td>
     * <td>"contoso\lisa"</td>
     * <td>"lisa"</td>
     * <td>"lisa@contoso.com"</td>
     * </tr>
     * </table>
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {PWSTR} The address of a pointer to a buffer that, when this method returns successfully, receives the requested string.
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovideruser-getstringvalue
     */
    GetStringValue(key) {
        result := ComCall(5, this, PROPERTYKEY.Ptr, key, PWSTR.Ptr, &stringValue := 0, "HRESULT")
        return stringValue
    }

    /**
     * Retrieves a specified property value set for the user.
     * @remarks
     * The PKEY_Identity_DisplayName, PKEY_Identity_UserName, PKEY_Identity_QualifiedUserName, and PKEY_Identity_LogonStatusString values can be retrieved directly as strings through the <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovideruser-getstringvalue">GetStringValue</a> method.
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {PROPVARIANT} A pointer to a value that, when this method returns successfully, receives the requested property value.
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovideruser-getvalue
     */
    GetValue(key) {
        value := PROPVARIANT()
        result := ComCall(6, this, PROPERTYKEY.Ptr, key, PROPVARIANT.Ptr, value, "HRESULT")
        return value
    }

    Query(iid) {
        if (ICredentialProviderUser.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSid := CallbackCreate(GetMethod(implObj, "GetSid"), flags, 2)
        this.vtbl.GetProviderID := CallbackCreate(GetMethod(implObj, "GetProviderID"), flags, 2)
        this.vtbl.GetStringValue := CallbackCreate(GetMethod(implObj, "GetStringValue"), flags, 3)
        this.vtbl.GetValue := CallbackCreate(GetMethod(implObj, "GetValue"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSid)
        CallbackFree(this.vtbl.GetProviderID)
        CallbackFree(this.vtbl.GetStringValue)
        CallbackFree(this.vtbl.GetValue)
    }
}
