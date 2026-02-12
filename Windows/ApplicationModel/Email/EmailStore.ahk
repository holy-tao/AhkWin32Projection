#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailStore.ahk
#Include ..\..\..\Guid.ahk

/**
 * The functionality described in this topic is not available to all UWP apps. As part of the store app submission process, Microsoft must approve your use of these APIs and provision your developer account before you can publish an app that uses them.
  * 
  * For more information about the [Windows.ApplicationModel.Email](windows_applicationmodel_email.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * The functionality described in this topic is not available to all UWP apps. As part of the store app submission process, Microsoft must approve your use of these APIs and provision your developer account before you can publish an app that uses them.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailstore
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailStore extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailStore

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailStore.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets all mailboxes within the current scope.
     * @returns {IAsyncOperation<IVectorView<EmailMailbox>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailstore.findmailboxesasync
     */
    FindMailboxesAsync() {
        if (!this.HasProp("__IEmailStore")) {
            if ((queryResult := this.QueryInterface(IEmailStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailStore := IEmailStore(outPtr)
        }

        return this.__IEmailStore.FindMailboxesAsync()
    }

    /**
     * Gets a batch of email conversations using the specified email query options.
     * @returns {EmailConversationReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailstore.getconversationreader
     */
    GetConversationReader() {
        if (!this.HasProp("__IEmailStore")) {
            if ((queryResult := this.QueryInterface(IEmailStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailStore := IEmailStore(outPtr)
        }

        return this.__IEmailStore.GetConversationReader()
    }

    /**
     * Gets a batch of email conversations.
     * @param {EmailQueryOptions} options 
     * @returns {EmailConversationReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailstore.getconversationreader
     */
    GetConversationReaderWithOptions(options) {
        if (!this.HasProp("__IEmailStore")) {
            if ((queryResult := this.QueryInterface(IEmailStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailStore := IEmailStore(outPtr)
        }

        return this.__IEmailStore.GetConversationReaderWithOptions(options)
    }

    /**
     * Gets a message reader using the specified query options.
     * @returns {EmailMessageReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailstore.getmessagereader
     */
    GetMessageReader() {
        if (!this.HasProp("__IEmailStore")) {
            if ((queryResult := this.QueryInterface(IEmailStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailStore := IEmailStore(outPtr)
        }

        return this.__IEmailStore.GetMessageReader()
    }

    /**
     * Gets a message reader.
     * @param {EmailQueryOptions} options 
     * @returns {EmailMessageReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailstore.getmessagereader
     */
    GetMessageReaderWithOptions(options) {
        if (!this.HasProp("__IEmailStore")) {
            if ((queryResult := this.QueryInterface(IEmailStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailStore := IEmailStore(outPtr)
        }

        return this.__IEmailStore.GetMessageReaderWithOptions(options)
    }

    /**
     * Gets a mailbox from an identifier.
     * @param {HSTRING} id The identifier for the mailbox.
     * @returns {IAsyncOperation<EmailMailbox>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailstore.getmailboxasync
     */
    GetMailboxAsync(id) {
        if (!this.HasProp("__IEmailStore")) {
            if ((queryResult := this.QueryInterface(IEmailStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailStore := IEmailStore(outPtr)
        }

        return this.__IEmailStore.GetMailboxAsync(id)
    }

    /**
     * Gets an email conversation from the provided identifier.
     * @param {HSTRING} id The identifier of the conversation.
     * @returns {IAsyncOperation<EmailConversation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailstore.getconversationasync
     */
    GetConversationAsync(id) {
        if (!this.HasProp("__IEmailStore")) {
            if ((queryResult := this.QueryInterface(IEmailStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailStore := IEmailStore(outPtr)
        }

        return this.__IEmailStore.GetConversationAsync(id)
    }

    /**
     * Gets an email folder from an identifier.
     * @param {HSTRING} id The identifier for the email folder.
     * @returns {IAsyncOperation<EmailFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailstore.getfolderasync
     */
    GetFolderAsync(id) {
        if (!this.HasProp("__IEmailStore")) {
            if ((queryResult := this.QueryInterface(IEmailStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailStore := IEmailStore(outPtr)
        }

        return this.__IEmailStore.GetFolderAsync(id)
    }

    /**
     * Gets the specified email message.
     * @param {HSTRING} id The identifier for the email message.
     * @returns {IAsyncOperation<EmailMessage>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailstore.getmessageasync
     */
    GetMessageAsync(id) {
        if (!this.HasProp("__IEmailStore")) {
            if ((queryResult := this.QueryInterface(IEmailStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailStore := IEmailStore(outPtr)
        }

        return this.__IEmailStore.GetMessageAsync(id)
    }

    /**
     * Allows an app to create an email account from an account name, an email address, and the user data account in which the mailbox will reside.
     * @param {HSTRING} accountName The name of the account.
     * @param {HSTRING} accountAddress The email address associated with the account.
     * @returns {IAsyncOperation<EmailMailbox>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailstore.createmailboxasync
     */
    CreateMailboxAsync(accountName, accountAddress) {
        if (!this.HasProp("__IEmailStore")) {
            if ((queryResult := this.QueryInterface(IEmailStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailStore := IEmailStore(outPtr)
        }

        return this.__IEmailStore.CreateMailboxAsync(accountName, accountAddress)
    }

    /**
     * Allows an app to create an email account from an account name and an email address.
     * @param {HSTRING} accountName The name of the account.
     * @param {HSTRING} accountAddress The email address associated with the account.
     * @param {HSTRING} userDataAccountId 
     * @returns {IAsyncOperation<EmailMailbox>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailstore.createmailboxasync
     */
    CreateMailboxInAccountAsync(accountName, accountAddress, userDataAccountId) {
        if (!this.HasProp("__IEmailStore")) {
            if ((queryResult := this.QueryInterface(IEmailStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailStore := IEmailStore(outPtr)
        }

        return this.__IEmailStore.CreateMailboxInAccountAsync(accountName, accountAddress, userDataAccountId)
    }

;@endregion Instance Methods
}
