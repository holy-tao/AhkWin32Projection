#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICredentialProviderUser.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the set of users that will appear in the logon or credential UI. This information enables the credential provider to enumerate the set to retrieve property information about each user to populate fields or filter the set.
 * @remarks
 * 
 * This object is provided by the Windows credential provider framework to your credential provider through the <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovidersetuserarray-setuserarray">ICredentialProviderSetUserArray::SetUserArray</a> method. Ownership of this object remains with the credential provider framework.
 * 
 * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
 * Third-parties do not implement this interface. An implementation is included with Windows.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nn-credentialprovider-icredentialprovideruserarray
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICredentialProviderUserArray extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICredentialProviderUserArray
     * @type {Guid}
     */
    static IID => Guid("{90c119ae-0f18-4520-a1f1-114366a40fe8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProviderFilter", "GetAccountOptions", "GetCount", "GetAt"]

    /**
     * Limits the set of users in the array to either local accounts or Microsoft accounts.
     * @param {Pointer<Guid>} guidProviderToFilterTo Set this parameter to Identity_LocalUserProvider for the local accounts credential provider; otherwise set it to the GUID of the Microsoft account provider.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovideruserarray-setproviderfilter
     */
    SetProviderFilter(guidProviderToFilterTo) {
        result := ComCall(3, this, "ptr", guidProviderToFilterTo, "HRESULT")
        return result
    }

    /**
     * Retrieves a value that indicates whether the &quot;Other user&quot; tile for local or Microsoft accounts is shown in the logon or credential UI.
     * @returns {Integer} A pointer to a value that, when this method returns successfully, receives one or more flags that specify which empty tiles are shown by the logon or credential UI.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovideruserarray-getaccountoptions
     */
    GetAccountOptions() {
        result := ComCall(4, this, "int*", &credentialProviderAccountOptions := 0, "HRESULT")
        return credentialProviderAccountOptions
    }

    /**
     * Retrieves the number of ICredentialProviderUser objects in the user array.
     * @returns {Integer} A pointer to a value that, when this method returns successfully, receives the number of users in the array.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovideruserarray-getcount
     */
    GetCount() {
        result := ComCall(5, this, "uint*", &userCount := 0, "HRESULT")
        return userCount
    }

    /**
     * Retrieves a specified user from the array.
     * @param {Integer} userIndex The 0-based array index of the user. The size of the array can be obtained through the <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovideruserarray-getcount">GetCount</a> method.
     * @returns {ICredentialProviderUser} The address of a pointer to an object that, when this method returns successfully, represents the specified user. It is the responsibility of the caller to free this object when it is no longer needed by calling its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovideruserarray-getat
     */
    GetAt(userIndex) {
        result := ComCall(6, this, "uint", userIndex, "ptr*", &user := 0, "HRESULT")
        return ICredentialProviderUser(user)
    }
}
