#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Guid>} guidProviderToFilterTo 
     * @returns {HRESULT} 
     */
    SetProviderFilter(guidProviderToFilterTo) {
        result := ComCall(3, this, "ptr", guidProviderToFilterTo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} credentialProviderAccountOptions 
     * @returns {HRESULT} 
     */
    GetAccountOptions(credentialProviderAccountOptions) {
        result := ComCall(4, this, "int*", credentialProviderAccountOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} userCount 
     * @returns {HRESULT} 
     */
    GetCount(userCount) {
        result := ComCall(5, this, "uint*", userCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} userIndex 
     * @param {Pointer<ICredentialProviderUser>} user 
     * @returns {HRESULT} 
     */
    GetAt(userIndex, user) {
        result := ComCall(6, this, "uint", userIndex, "ptr", user, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
