#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailConversation.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an email conversation.
 * @remarks
 * Obtain an instance of this class by calling [EmailConversationReader.ReadBatchAsync](emailconversationreader_readbatchasync_888788553.md).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailconversation
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailConversation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailConversation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailConversation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the unique identifier for the [EmailConversation](emailconversation.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailconversation.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the ID for the mailbox.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailconversation.mailboxid
     * @type {HSTRING} 
     */
    MailboxId {
        get => this.get_MailboxId()
    }

    /**
     * Gets the [EmailFlagState](emailflagstate.md) for the conversation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailconversation.flagstate
     * @type {Integer} 
     */
    FlagState {
        get => this.get_FlagState()
    }

    /**
     * Gets a Boolean value indicating if the conversation has an attachment.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailconversation.hasattachment
     * @type {Boolean} 
     */
    HasAttachment {
        get => this.get_HasAttachment()
    }

    /**
     * Gets the value that specifies the importance of the conversation; normal, high or low.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailconversation.importance
     * @type {Integer} 
     */
    Importance {
        get => this.get_Importance()
    }

    /**
     * Gets the last [EmailMessageResponseKind](emailmessageresponsekind.md) for the conversation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailconversation.lastemailresponsekind
     * @type {Integer} 
     */
    LastEmailResponseKind {
        get => this.get_LastEmailResponseKind()
    }

    /**
     * Gets the number of messages in the conversation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailconversation.messagecount
     * @type {Integer} 
     */
    MessageCount {
        get => this.get_MessageCount()
    }

    /**
     * Gets the ID of the most recent message in the conversation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailconversation.mostrecentmessageid
     * @type {HSTRING} 
     */
    MostRecentMessageId {
        get => this.get_MostRecentMessageId()
    }

    /**
     * Gets the time of the most recent message in the conversation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailconversation.mostrecentmessagetime
     * @type {DateTime} 
     */
    MostRecentMessageTime {
        get => this.get_MostRecentMessageTime()
    }

    /**
     * Gets a preview of the latest message in the conversation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailconversation.preview
     * @type {HSTRING} 
     */
    Preview {
        get => this.get_Preview()
    }

    /**
     * Gets the latest sender in the conversation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailconversation.latestsender
     * @type {EmailRecipient} 
     */
    LatestSender {
        get => this.get_LatestSender()
    }

    /**
     * Gets the subject of the latest message in the conversation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailconversation.subject
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
    }

    /**
     * Gets the number of unread messages in the conversation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailconversation.unreadmessagecount
     * @type {Integer} 
     */
    UnreadMessageCount {
        get => this.get_UnreadMessageCount()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IEmailConversation")) {
            if ((queryResult := this.QueryInterface(IEmailConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailConversation := IEmailConversation(outPtr)
        }

        return this.__IEmailConversation.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MailboxId() {
        if (!this.HasProp("__IEmailConversation")) {
            if ((queryResult := this.QueryInterface(IEmailConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailConversation := IEmailConversation(outPtr)
        }

        return this.__IEmailConversation.get_MailboxId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FlagState() {
        if (!this.HasProp("__IEmailConversation")) {
            if ((queryResult := this.QueryInterface(IEmailConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailConversation := IEmailConversation(outPtr)
        }

        return this.__IEmailConversation.get_FlagState()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasAttachment() {
        if (!this.HasProp("__IEmailConversation")) {
            if ((queryResult := this.QueryInterface(IEmailConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailConversation := IEmailConversation(outPtr)
        }

        return this.__IEmailConversation.get_HasAttachment()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Importance() {
        if (!this.HasProp("__IEmailConversation")) {
            if ((queryResult := this.QueryInterface(IEmailConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailConversation := IEmailConversation(outPtr)
        }

        return this.__IEmailConversation.get_Importance()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastEmailResponseKind() {
        if (!this.HasProp("__IEmailConversation")) {
            if ((queryResult := this.QueryInterface(IEmailConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailConversation := IEmailConversation(outPtr)
        }

        return this.__IEmailConversation.get_LastEmailResponseKind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageCount() {
        if (!this.HasProp("__IEmailConversation")) {
            if ((queryResult := this.QueryInterface(IEmailConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailConversation := IEmailConversation(outPtr)
        }

        return this.__IEmailConversation.get_MessageCount()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MostRecentMessageId() {
        if (!this.HasProp("__IEmailConversation")) {
            if ((queryResult := this.QueryInterface(IEmailConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailConversation := IEmailConversation(outPtr)
        }

        return this.__IEmailConversation.get_MostRecentMessageId()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_MostRecentMessageTime() {
        if (!this.HasProp("__IEmailConversation")) {
            if ((queryResult := this.QueryInterface(IEmailConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailConversation := IEmailConversation(outPtr)
        }

        return this.__IEmailConversation.get_MostRecentMessageTime()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Preview() {
        if (!this.HasProp("__IEmailConversation")) {
            if ((queryResult := this.QueryInterface(IEmailConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailConversation := IEmailConversation(outPtr)
        }

        return this.__IEmailConversation.get_Preview()
    }

    /**
     * 
     * @returns {EmailRecipient} 
     */
    get_LatestSender() {
        if (!this.HasProp("__IEmailConversation")) {
            if ((queryResult := this.QueryInterface(IEmailConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailConversation := IEmailConversation(outPtr)
        }

        return this.__IEmailConversation.get_LatestSender()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        if (!this.HasProp("__IEmailConversation")) {
            if ((queryResult := this.QueryInterface(IEmailConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailConversation := IEmailConversation(outPtr)
        }

        return this.__IEmailConversation.get_Subject()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UnreadMessageCount() {
        if (!this.HasProp("__IEmailConversation")) {
            if ((queryResult := this.QueryInterface(IEmailConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailConversation := IEmailConversation(outPtr)
        }

        return this.__IEmailConversation.get_UnreadMessageCount()
    }

    /**
     * Asynchronously gets a batch of messages in the conversation.
     * @returns {IAsyncOperation<IVectorView<EmailMessage>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailconversation.findmessagesasync
     */
    FindMessagesAsync() {
        if (!this.HasProp("__IEmailConversation")) {
            if ((queryResult := this.QueryInterface(IEmailConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailConversation := IEmailConversation(outPtr)
        }

        return this.__IEmailConversation.FindMessagesAsync()
    }

    /**
     * Asynchronously gets a batch of messages in the conversation.
     * @param {Integer} count 
     * @returns {IAsyncOperation<IVectorView<EmailMessage>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailconversation.findmessagesasync
     */
    FindMessagesWithCountAsync(count) {
        if (!this.HasProp("__IEmailConversation")) {
            if ((queryResult := this.QueryInterface(IEmailConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailConversation := IEmailConversation(outPtr)
        }

        return this.__IEmailConversation.FindMessagesWithCountAsync(count)
    }

;@endregion Instance Methods
}
