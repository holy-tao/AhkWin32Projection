#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method that enables a credential provider to receive the set of users that will be shown in the logon or credential UI.
 * @remarks
 * 
 * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
 * Implement this interface for credential providers that have a need to know which users will appear in the logon or credential UI.
 * 
 * <h3><a id="When_to_use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to use</h3>
 * This interface is used only by the Windows credential provider framework. Its method should not be called by other parties.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nn-credentialprovider-icredentialprovidersetuserarray
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICredentialProviderSetUserArray extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICredentialProviderSetUserArray
     * @type {Guid}
     */
    static IID => Guid("{095c1484-1c0c-4388-9c6d-500e61bf84bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetUserArray"]

    /**
     * Called by the system during the initialization of a logon or credential UI to retrieve the set of users to show in that UI.
     * @param {ICredentialProviderUserArray} users A pointer to an array object that contains a set of <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovideruser">ICredentialProviderUser</a> objects, each representing a user that will appear in the logon or credential UI. This array enables the credential provider to enumerate and query each of the user objects for their SID, their associated credential provider's ID, various forms of the user name, and their logon status string.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovidersetuserarray-setuserarray
     */
    SetUserArray(users) {
        result := ComCall(3, this, "ptr", users, "HRESULT")
        return result
    }
}
