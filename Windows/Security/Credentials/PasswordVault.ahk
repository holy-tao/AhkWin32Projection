#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPasswordVault.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a Credential Locker of credentials. Lockers are specific to a user.
  * 
  * Apps running in an AppContainer (for example, UWP apps) can only access the contents of their own locker (for the current user). Apps not running in an AppContainer (for example, regular Desktop apps) can access all the user's lockers, including those of AppContainer apps.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.passwordvault
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class PasswordVault extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPasswordVault

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPasswordVault.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Creates and initializes a new instance of the [PasswordVault](passwordvault.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Security.Credentials.PasswordVault")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Adds a credential to the **Credential Locker**.
     * @remarks
     * You can only store up to 20 credentials per app in the [Credential Locker](/windows/uwp/security/credential-locker). If you try to store more than 20 credentials, you will encounter an [Exception](/dotnet/api/system.exception?view=dotnet-uwp-10.0&preserve-view=true).
     * 
     * > [!NOTE]
     * > The limit of 20 credentials per app only applies when using the Credential Locker from a UWP app or from a desktop app [running in an **AppContainer**](/windows/win32/secauthz/appcontainer-for-legacy-applications-).
     * @param {PasswordCredential} credential The credential to be added.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.passwordvault.add
     */
    Add(credential) {
        if (!this.HasProp("__IPasswordVault")) {
            if ((queryResult := this.QueryInterface(IPasswordVault.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordVault := IPasswordVault(outPtr)
        }

        return this.__IPasswordVault.Add(credential)
    }

    /**
     * Removes a credential from the Credential Locker.
     * @param {PasswordCredential} credential The credential to be removed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.passwordvault.remove
     */
    Remove(credential) {
        if (!this.HasProp("__IPasswordVault")) {
            if ((queryResult := this.QueryInterface(IPasswordVault.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordVault := IPasswordVault(outPtr)
        }

        return this.__IPasswordVault.Remove(credential)
    }

    /**
     * Reads a credential from the Credential Locker.
     * @remarks
     * If a match does not exist, an exception will throw.
     * @param {HSTRING} resource The resource for which the credential is used.
     * @param {HSTRING} userName The user name that must be present in the credential.
     * @returns {PasswordCredential} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.passwordvault.retrieve
     */
    Retrieve(resource, userName) {
        if (!this.HasProp("__IPasswordVault")) {
            if ((queryResult := this.QueryInterface(IPasswordVault.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordVault := IPasswordVault(outPtr)
        }

        return this.__IPasswordVault.Retrieve(resource, userName)
    }

    /**
     * Searches the Credential Locker for credentials matching the resource specified.
     * @remarks
     * Each object returned will have the proper resource and user name, but it will not include the password.
     * @param {HSTRING} resource The resource to be searched for. If a match does not exist, an exception will throw.
     * @returns {IVectorView<PasswordCredential>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.passwordvault.findallbyresource
     */
    FindAllByResource(resource) {
        if (!this.HasProp("__IPasswordVault")) {
            if ((queryResult := this.QueryInterface(IPasswordVault.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordVault := IPasswordVault(outPtr)
        }

        return this.__IPasswordVault.FindAllByResource(resource)
    }

    /**
     * Searches the Credential Locker for credentials that match the user name specified.
     * @remarks
     * Each object returned will have the proper resource and user name, but it will not include the password.
     * @param {HSTRING} userName The user name to be searched for. If a match does not exist, an exception will throw.
     * @returns {IVectorView<PasswordCredential>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.passwordvault.findallbyusername
     */
    FindAllByUserName(userName) {
        if (!this.HasProp("__IPasswordVault")) {
            if ((queryResult := this.QueryInterface(IPasswordVault.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordVault := IPasswordVault(outPtr)
        }

        return this.__IPasswordVault.FindAllByUserName(userName)
    }

    /**
     * Retrieves all of the credentials stored in the Credential Locker.
     * @returns {IVectorView<PasswordCredential>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.passwordvault.retrieveall
     */
    RetrieveAll() {
        if (!this.HasProp("__IPasswordVault")) {
            if ((queryResult := this.QueryInterface(IPasswordVault.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordVault := IPasswordVault(outPtr)
        }

        return this.__IPasswordVault.RetrieveAll()
    }

;@endregion Instance Methods
}
