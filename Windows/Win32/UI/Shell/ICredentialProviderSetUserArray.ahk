#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ICredentialProviderUserArray.ahk" { ICredentialProviderUserArray }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a method that enables a credential provider to receive the set of users that will be shown in the logon or credential UI.
 * @remarks
 * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
 * Implement this interface for credential providers that have a need to know which users will appear in the logon or credential UI.
 * 
 * <h3><a id="When_to_use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to use</h3>
 * This interface is used only by the Windows credential provider framework. Its method should not be called by other parties.
 * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nn-credentialprovider-icredentialprovidersetuserarray
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ICredentialProviderSetUserArray extends IUnknown {
    /**
     * The interface identifier for ICredentialProviderSetUserArray
     * @type {Guid}
     */
    static IID := Guid("{095c1484-1c0c-4388-9c6d-500e61bf84bd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICredentialProviderSetUserArray interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetUserArray : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICredentialProviderSetUserArray.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by the system during the initialization of a logon or credential UI to retrieve the set of users to show in that UI.
     * @remarks
     * Note that this method does not transfer ownership of the <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovideruserarray">ICredentialProviderUserArray</a> from the credential provider framework. The information it provides is cannot be altered.
     * @param {ICredentialProviderUserArray} users A pointer to an array object that contains a set of <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovideruser">ICredentialProviderUser</a> objects, each representing a user that will appear in the logon or credential UI. This array enables the credential provider to enumerate and query each of the user objects for their SID, their associated credential provider's ID, various forms of the user name, and their logon status string.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidersetuserarray-setuserarray
     */
    SetUserArray(users) {
        result := ComCall(3, this, "ptr", users, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICredentialProviderSetUserArray.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetUserArray := CallbackCreate(GetMethod(implObj, "SetUserArray"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetUserArray)
    }
}
