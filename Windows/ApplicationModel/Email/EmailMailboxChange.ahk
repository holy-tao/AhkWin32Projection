#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxChange.ahk
#Include ..\..\..\Guid.ahk

/**
 * The functionality described in this topic is not available to all UWP apps. As part of the store app submission process, Microsoft must approve your use of these APIs and provision your developer account before you can publish an app that uses them.
  * 
  * For more information about the [Windows.ApplicationModel.Email](windows_applicationmodel_email.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * The functionality described in this topic is not available to all UWP apps. As part of the store app submission process, Microsoft must approve your use of these APIs and provision your developer account before you can publish an app that uses them.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxchange
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMailboxChange extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxChange

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxChange.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the type of change that was made to the mailbox. This includes whether it was a folder or message that was changed and whether the item was created, deleted, or modified, or if change tracking was lost for this change.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxchange.changetype
     * @type {Integer} 
     */
    ChangeType {
        get => this.get_ChangeType()
    }

    /**
     * Gets the flags that indicate what actions have been affected on the mailbox.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxchange.mailboxactions
     * @type {IVector<EmailMailboxAction>} 
     */
    MailboxActions {
        get => this.get_MailboxActions()
    }

    /**
     * Gets the message to which the change applies.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxchange.message
     * @type {EmailMessage} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * Gets the folder to which the change applies.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxchange.folder
     * @type {EmailFolder} 
     */
    Folder {
        get => this.get_Folder()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChangeType() {
        if (!this.HasProp("__IEmailMailboxChange")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxChange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxChange := IEmailMailboxChange(outPtr)
        }

        return this.__IEmailMailboxChange.get_ChangeType()
    }

    /**
     * 
     * @returns {IVector<EmailMailboxAction>} 
     */
    get_MailboxActions() {
        if (!this.HasProp("__IEmailMailboxChange")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxChange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxChange := IEmailMailboxChange(outPtr)
        }

        return this.__IEmailMailboxChange.get_MailboxActions()
    }

    /**
     * 
     * @returns {EmailMessage} 
     */
    get_Message() {
        if (!this.HasProp("__IEmailMailboxChange")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxChange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxChange := IEmailMailboxChange(outPtr)
        }

        return this.__IEmailMailboxChange.get_Message()
    }

    /**
     * 
     * @returns {EmailFolder} 
     */
    get_Folder() {
        if (!this.HasProp("__IEmailMailboxChange")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxChange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxChange := IEmailMailboxChange(outPtr)
        }

        return this.__IEmailMailboxChange.get_Folder()
    }

;@endregion Instance Methods
}
