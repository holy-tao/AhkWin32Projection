#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailManagerStatics.ahk
#Include .\IEmailManagerStatics2.ahk
#Include .\IEmailManagerStatics3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Allows an application to launch the email application with a new message displayed. Use this to allow users to send email from your application.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmanager
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailManager extends IInspectable {
;@region Static Methods
    /**
     * Launches the email application with a new message displayed.
     * @remarks
     * Call this method from the main UI thread.
     * 
     * >[!NOTE]
     * This method only sends plain text messages. You can't set the body of the message to the HTML format.
     * @param {EmailMessage} message The email message that is displayed when the email application is launched.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmanager.showcomposenewemailasync
     */
    static ShowComposeNewEmailAsync(message) {
        if (!EmailManager.HasProp("__IEmailManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Email.EmailManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEmailManagerStatics.IID)
            EmailManager.__IEmailManagerStatics := IEmailManagerStatics(factoryPtr)
        }

        return EmailManager.__IEmailManagerStatics.ShowComposeNewEmailAsync(message)
    }

    /**
     * Gets an email store that is within the specified scope.
     * @param {Integer} accessType The enumerator of scope.
     * @returns {IAsyncOperation<EmailStore>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmanager.requeststoreasync
     */
    static RequestStoreAsync(accessType) {
        if (!EmailManager.HasProp("__IEmailManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Email.EmailManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEmailManagerStatics2.IID)
            EmailManager.__IEmailManagerStatics2 := IEmailManagerStatics2(factoryPtr)
        }

        return EmailManager.__IEmailManagerStatics2.RequestStoreAsync(accessType)
    }

    /**
     * Gets the [EmailManagerForUser](emailmanagerforuser.md) object for the specified user.
     * @param {User} user_ The user account to use to get the [EmailManagerForUser](emailmanagerforuser.md) object.
     * @returns {EmailManagerForUser} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmanager.getforuser
     */
    static GetForUser(user_) {
        if (!EmailManager.HasProp("__IEmailManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Email.EmailManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEmailManagerStatics3.IID)
            EmailManager.__IEmailManagerStatics3 := IEmailManagerStatics3(factoryPtr)
        }

        return EmailManager.__IEmailManagerStatics3.GetForUser(user_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
