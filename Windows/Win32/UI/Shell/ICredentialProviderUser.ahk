#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods used to retrieve certain properties of an individual user included in a logon or credential UI.
 * @remarks
 * 
  * Windows 8 introduces the ability to group credential providers by user. The logon UI can display a set of users rather than a set of multiple credential providers for each user. Selecting a user then displays the individual credential provider options associated with that user.
  * 
  * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
  * Third-parties do not implement this interface. An implementation is included with Windows.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nn-credentialprovider-icredentialprovideruser
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICredentialProviderUser extends IUnknown{
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
     * 
     * @param {Pointer<PWSTR>} sid 
     * @returns {HRESULT} 
     */
    GetSid(sid) {
        result := ComCall(3, this, "ptr", sid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} providerID 
     * @returns {HRESULT} 
     */
    GetProviderID(providerID) {
        result := ComCall(4, this, "ptr", providerID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PWSTR>} stringValue 
     * @returns {HRESULT} 
     */
    GetStringValue(key, stringValue) {
        result := ComCall(5, this, "ptr", key, "ptr", stringValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPVARIANT>} value 
     * @returns {HRESULT} 
     */
    GetValue(key, value) {
        result := ComCall(6, this, "ptr", key, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
