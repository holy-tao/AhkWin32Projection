#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods used to retrieve certain properties of an individual user included in a logon or credential UI.
 * @remarks
 * Windows 8 introduces the ability to group credential providers by user. The logon UI can display a set of users rather than a set of multiple credential providers for each user. Selecting a user then displays the individual credential provider options associated with that user.
 * 
 * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
 * Third-parties do not implement this interface. An implementation is included with Windows.
 * @see https://learn.microsoft.com/windows/win32/api//content/credentialprovider/nn-credentialprovider-icredentialprovideruser
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICredentialProviderUser extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICredentialProviderUser
     * @type {Guid}
     */
    static IID => Guid("{13793285-3ea6-40fd-b420-15f47da41fbb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSid", "GetProviderID", "GetStringValue", "GetValue"]

    /**
     * Retrieves the user's security identifier (SID). (ICredentialProviderUser.GetSid)
     * @remarks
     * This SID applies to both logon and credential UI.
     * 
     * This value can also be retrieved as a <b>PROPVARIANT</b> through <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovideruser-getvalue">ICredentialProviderUser::GetValue</a>.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/credentialprovider/nf-credentialprovider-icredentialprovideruser-getsid
     */
    GetSid() {
        result := ComCall(3, this, "ptr*", &sid_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return sid_
    }

    /**
     * Retrieves the ID of the account provider for this user.
     * @remarks
     * This GUID applies to both logon and credential UI.
     * 
     * This value can also be retrieved as a <b>PROPVARIANT</b> through <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovideruser-getvalue">ICredentialProviderUser::GetValue</a>.
     * @returns {Guid} A pointer to a value that, when this method returns successfully, receives the GUID of the user's account provider.
     * @see https://learn.microsoft.com/windows/win32/api//content/credentialprovider/nf-credentialprovider-icredentialprovideruser-getproviderid
     */
    GetProviderID() {
        providerID := Guid()
        result := ComCall(4, this, "ptr", providerID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/credentialprovider/nf-credentialprovider-icredentialprovideruser-getstringvalue
     */
    GetStringValue(key) {
        result := ComCall(5, this, "ptr", key, "ptr*", &stringValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return stringValue
    }

    /**
     * Retrieves a specified property value set for the user.
     * @remarks
     * The PKEY_Identity_DisplayName, PKEY_Identity_UserName, PKEY_Identity_QualifiedUserName, and PKEY_Identity_LogonStatusString values can be retrieved directly as strings through the <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovideruser-getstringvalue">GetStringValue</a> method.
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {PROPVARIANT} A pointer to a value that, when this method returns successfully, receives the requested property value.
     * @see https://learn.microsoft.com/windows/win32/api//content/credentialprovider/nf-credentialprovider-icredentialprovideruser-getvalue
     */
    GetValue(key) {
        value := PROPVARIANT()
        result := ComCall(6, this, "ptr", key, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
