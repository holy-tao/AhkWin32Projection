#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICredentialCommand.ahk
#Include .\ICredentialCommandFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Deprecated. Represents a command for changing web account credentials in the account settings pane.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.credentialcommand
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class CredentialCommand extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICredentialCommand

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICredentialCommand.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [CredentialCommand](credentialcommand.md) class with a [PasswordCredential](../windows.security.credentials/passwordcredential.md) object.
     * @param {PasswordCredential} passwordCredential_ The password credential.
     * @returns {CredentialCommand} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.credentialcommand.#ctor
     */
    static CreateCredentialCommand(passwordCredential_) {
        if (!CredentialCommand.HasProp("__ICredentialCommandFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.ApplicationSettings.CredentialCommand")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICredentialCommandFactory.IID)
            CredentialCommand.__ICredentialCommandFactory := ICredentialCommandFactory(factoryPtr)
        }

        return CredentialCommand.__ICredentialCommandFactory.CreateCredentialCommand(passwordCredential_)
    }

    /**
     * Initializes a new instance of the [CredentialCommand](credentialcommand.md) class with a [PasswordCredential](../windows.security.credentials/passwordcredential.md) object and a [CredentialCommandCredentialDeletedHandler](credentialcommandcredentialdeletedhandler.md) delegate.
     * @param {PasswordCredential} passwordCredential_ The password credential.
     * @param {CredentialCommandCredentialDeletedHandler} deleted The delegate that handles credential deletion.
     * @returns {CredentialCommand} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.credentialcommand.#ctor
     */
    static CreateCredentialCommandWithHandler(passwordCredential_, deleted) {
        if (!CredentialCommand.HasProp("__ICredentialCommandFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.ApplicationSettings.CredentialCommand")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICredentialCommandFactory.IID)
            CredentialCommand.__ICredentialCommandFactory := ICredentialCommandFactory(factoryPtr)
        }

        return CredentialCommand.__ICredentialCommandFactory.CreateCredentialCommandWithHandler(passwordCredential_, deleted)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the password credential that the current command applies to.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.credentialcommand.passwordcredential
     * @type {PasswordCredential} 
     */
    PasswordCredential {
        get => this.get_PasswordCredential()
    }

    /**
     * Gets the delegate that's invoked by the account settings pane when the user deletes a credential.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.credentialcommand.credentialdeleted
     * @type {CredentialCommandCredentialDeletedHandler} 
     */
    CredentialDeleted {
        get => this.get_CredentialDeleted()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_PasswordCredential() {
        if (!this.HasProp("__ICredentialCommand")) {
            if ((queryResult := this.QueryInterface(ICredentialCommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialCommand := ICredentialCommand(outPtr)
        }

        return this.__ICredentialCommand.get_PasswordCredential()
    }

    /**
     * 
     * @returns {CredentialCommandCredentialDeletedHandler} 
     */
    get_CredentialDeleted() {
        if (!this.HasProp("__ICredentialCommand")) {
            if ((queryResult := this.QueryInterface(ICredentialCommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialCommand := ICredentialCommand(outPtr)
        }

        return this.__ICredentialCommand.get_CredentialDeleted()
    }

;@endregion Instance Methods
}
