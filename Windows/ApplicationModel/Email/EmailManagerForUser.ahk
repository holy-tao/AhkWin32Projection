#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailManagerForUser.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a service that source apps can call to access email data for a specific user.
 * @remarks
 * Call the [EmailManager.GetForUser](emailmanager_getforuser_2058550280.md) method to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmanagerforuser
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailManagerForUser extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailManagerForUser

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailManagerForUser.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [User](../windows.system/user.md) represented by this email manager.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmanagerforuser.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Launches the email application with a new message displayed.
     * @remarks
     * >[!NOTE]
     * This method only sends plain text messages. You can't set the body of the message to the HTML format.
     * @param {EmailMessage} message The email message that is displayed when the email application is launched.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmanagerforuser.showcomposenewemailasync
     */
    ShowComposeNewEmailAsync(message) {
        if (!this.HasProp("__IEmailManagerForUser")) {
            if ((queryResult := this.QueryInterface(IEmailManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailManagerForUser := IEmailManagerForUser(outPtr)
        }

        return this.__IEmailManagerForUser.ShowComposeNewEmailAsync(message)
    }

    /**
     * Asynchronously returns the [EmailStore](emailstore.md) from the system.
     * @param {Integer} accessType Specifies the access type, such as **AllMailboxesLimitedReadWrite** for all mailboxes or **AppMailboxesReadWrite** for the calling app's mailboxes.
     * @returns {IAsyncOperation<EmailStore>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmanagerforuser.requeststoreasync
     */
    RequestStoreAsync(accessType) {
        if (!this.HasProp("__IEmailManagerForUser")) {
            if ((queryResult := this.QueryInterface(IEmailManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailManagerForUser := IEmailManagerForUser(outPtr)
        }

        return this.__IEmailManagerForUser.RequestStoreAsync(accessType)
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IEmailManagerForUser")) {
            if ((queryResult := this.QueryInterface(IEmailManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailManagerForUser := IEmailManagerForUser(outPtr)
        }

        return this.__IEmailManagerForUser.get_User()
    }

;@endregion Instance Methods
}
