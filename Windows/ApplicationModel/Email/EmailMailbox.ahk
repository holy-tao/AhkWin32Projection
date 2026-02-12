#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailbox.ahk
#Include .\IEmailMailbox2.ahk
#Include .\IEmailMailbox3.ahk
#Include .\IEmailMailbox4.ahk
#Include .\IEmailMailbox5.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\EmailMailbox.ahk
#Include .\EmailMailboxChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents an email mailbox located on a remote email server.
 * @remarks
 * The functionality described in this topic is not available to all UWP apps. As part of the store app submission process, Microsoft must approve your use of these APIs and provision your developer account before you can publish an app that uses them.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMailbox extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailbox

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailbox.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the capabilities associated with the mailbox.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.capabilities
     * @type {EmailMailboxCapabilities} 
     */
    Capabilities {
        get => this.get_Capabilities()
    }

    /**
     * Gets the [EmailMailboxChangeTracker](emailmailboxchangetracker.md) for this mailbox.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.changetracker
     * @type {EmailMailboxChangeTracker} 
     */
    ChangeTracker {
        get => this.get_ChangeTracker()
    }

    /**
     * Gets or sets the name for this mailbox that is suitable for displaying.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * Gets the ID for this mailbox.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets a Boolean value that indicates if this mailbox is owned by the current app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.isownedbycurrentapp
     * @type {Boolean} 
     */
    IsOwnedByCurrentApp {
        get => this.get_IsOwnedByCurrentApp()
    }

    /**
     * Gets a Boolean value that indicates if email data is encrypted when the device is locked.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.isdataencryptedunderlock
     * @type {Boolean} 
     */
    IsDataEncryptedUnderLock {
        get => this.get_IsDataEncryptedUnderLock()
    }

    /**
     * Gets or sets the email address for the mailbox.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.mailaddress
     * @type {HSTRING} 
     */
    MailAddress {
        get => this.get_MailAddress()
        set => this.put_MailAddress(value)
    }

    /**
     * Gets the list of email aliases associated with this mailbox.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.mailaddressaliases
     * @type {IVector<HSTRING>} 
     */
    MailAddressAliases {
        get => this.get_MailAddressAliases()
    }

    /**
     * Gets or sets the read access level to this mailbox for other apps.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.otherappreadaccess
     * @type {Integer} 
     */
    OtherAppReadAccess {
        get => this.get_OtherAppReadAccess()
        set => this.put_OtherAppReadAccess(value)
    }

    /**
     * Gets or sets the write access level to this mailbox for other apps.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.otherappwriteaccess
     * @type {Integer} 
     */
    OtherAppWriteAccess {
        get => this.get_OtherAppWriteAccess()
        set => this.put_OtherAppWriteAccess(value)
    }

    /**
     * Gets the security policies for attachments in this mailbox.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.policies
     * @type {EmailMailboxPolicies} 
     */
    Policies {
        get => this.get_Policies()
    }

    /**
     * Gets the display name of the source mailbox.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.sourcedisplayname
     * @type {HSTRING} 
     */
    SourceDisplayName {
        get => this.get_SourceDisplayName()
    }

    /**
     * Gets the sync manager for the mailbox.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.syncmanager
     * @type {EmailMailboxSyncManager} 
     */
    SyncManager {
        get => this.get_SyncManager()
    }

    /**
     * Gets the ID of the user data account for the mailbox.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.userdataaccountid
     * @type {HSTRING} 
     */
    UserDataAccountId {
        get => this.get_UserDataAccountId()
    }

    /**
     * Gets the identifier for a mailbox linked to this one.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.linkedmailboxid
     * @type {HSTRING} 
     */
    LinkedMailboxId {
        get => this.get_LinkedMailboxId()
    }

    /**
     * Gets the identifier of the email mailbox account within its network.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.networkaccountid
     * @type {HSTRING} 
     */
    NetworkAccountId {
        get => this.get_NetworkAccountId()
    }

    /**
     * Gets the identifier of the network associated with this email mailbox.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.networkid
     * @type {HSTRING} 
     */
    NetworkId {
        get => this.get_NetworkId()
    }

    /**
     * Occurs when the mailbox has changed.
     * @type {TypedEventHandler<EmailMailbox, EmailMailboxChangedEventArgs>}
    */
    OnMailboxChanged {
        get {
            if(!this.HasProp("__OnMailboxChanged")){
                this.__OnMailboxChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{20789b0d-1555-51fc-87a5-2222250b9b06}"),
                    EmailMailbox,
                    EmailMailboxChangedEventArgs
                )
                this.__OnMailboxChangedToken := this.add_MailboxChanged(this.__OnMailboxChanged.iface)
            }
            return this.__OnMailboxChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnMailboxChangedToken")) {
            this.remove_MailboxChanged(this.__OnMailboxChangedToken)
            this.__OnMailboxChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {EmailMailboxCapabilities} 
     */
    get_Capabilities() {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.get_Capabilities()
    }

    /**
     * 
     * @returns {EmailMailboxChangeTracker} 
     */
    get_ChangeTracker() {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.get_ChangeTracker()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.get_DisplayName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.put_DisplayName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.get_Id()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOwnedByCurrentApp() {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.get_IsOwnedByCurrentApp()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDataEncryptedUnderLock() {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.get_IsDataEncryptedUnderLock()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MailAddress() {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.get_MailAddress()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_MailAddress(value) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.put_MailAddress(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_MailAddressAliases() {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.get_MailAddressAliases()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OtherAppReadAccess() {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.get_OtherAppReadAccess()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OtherAppReadAccess(value) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.put_OtherAppReadAccess(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OtherAppWriteAccess() {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.get_OtherAppWriteAccess()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OtherAppWriteAccess(value) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.put_OtherAppWriteAccess(value)
    }

    /**
     * 
     * @returns {EmailMailboxPolicies} 
     */
    get_Policies() {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.get_Policies()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourceDisplayName() {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.get_SourceDisplayName()
    }

    /**
     * 
     * @returns {EmailMailboxSyncManager} 
     */
    get_SyncManager() {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.get_SyncManager()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserDataAccountId() {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.get_UserDataAccountId()
    }

    /**
     * Gets or creates an email conversation reader for this mailbox using the specified query options.
     * @returns {EmailConversationReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.getconversationreader
     */
    GetConversationReader() {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.GetConversationReader()
    }

    /**
     * Gets or creates an email conversation reader for this mailbox if one does not already exist.
     * @param {EmailQueryOptions} options 
     * @returns {EmailConversationReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.getconversationreader
     */
    GetConversationReaderWithOptions(options) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.GetConversationReaderWithOptions(options)
    }

    /**
     * Gets or creates an email conversation reader for this mailbox using the specified query options.
     * @returns {EmailMessageReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.getmessagereader
     */
    GetMessageReader() {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.GetMessageReader()
    }

    /**
     * Gets or creates an email message reader for this mailbox if one does not already exist.
     * @param {EmailQueryOptions} options 
     * @returns {EmailMessageReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.getmessagereader
     */
    GetMessageReaderWithOptions(options) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.GetMessageReaderWithOptions(options)
    }

    /**
     * Asynchronously deletes the mailbox.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.deleteasync
     */
    DeleteAsync() {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.DeleteAsync()
    }

    /**
     * Asynchronously gets the specified email conversation.
     * @param {HSTRING} id The ID of the email conversation to retrieve.
     * @returns {IAsyncOperation<EmailConversation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.getconversationasync
     */
    GetConversationAsync(id) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.GetConversationAsync(id)
    }

    /**
     * Asynchronously gets the specified email folder.
     * @param {HSTRING} id The ID of the folder to retrieve.
     * @returns {IAsyncOperation<EmailFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.getfolderasync
     */
    GetFolderAsync(id) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.GetFolderAsync(id)
    }

    /**
     * Asynchronously gets the specified email message.
     * @param {HSTRING} id The ID of the message to retrieve.
     * @returns {IAsyncOperation<EmailMessage>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.getmessageasync
     */
    GetMessageAsync(id) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.GetMessageAsync(id)
    }

    /**
     * Asynchronously get a special email folder such as Inbox, Outbox, Drafts and so on.
     * @param {Integer} folderType The type of folder to retrieve.
     * @returns {IAsyncOperation<EmailFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.getspecialfolderasync
     */
    GetSpecialFolderAsync(folderType) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.GetSpecialFolderAsync(folderType)
    }

    /**
     * Asynchronously saves the mailbox to the email store.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.saveasync
     */
    SaveAsync() {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.SaveAsync()
    }

    /**
     * Asynchronously marks an email message as seen.
     * @param {HSTRING} messageId The ID of the message to mark as seen.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.markmessageasseenasync
     */
    MarkMessageAsSeenAsync(messageId) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.MarkMessageAsSeenAsync(messageId)
    }

    /**
     * Asynchronously marks all the messages in a folder as seen.
     * @param {HSTRING} folderId The ID of the folder to mark as seen.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.markfolderasseenasync
     */
    MarkFolderAsSeenAsync(folderId) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.MarkFolderAsSeenAsync(folderId)
    }

    /**
     * Asynchronously marks an email message as read or unread.
     * @param {HSTRING} messageId The ID of the message to mark.
     * @param {Boolean} isRead True to mark the message as read, false to mark it as unread.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.markmessagereadasync
     */
    MarkMessageReadAsync(messageId, isRead) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.MarkMessageReadAsync(messageId, isRead)
    }

    /**
     * Asynchronously changes the flag state of an email message.
     * @param {HSTRING} messageId The ID of the email message to change.
     * @param {Integer} flagState The new email flag state.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.changemessageflagstateasync
     */
    ChangeMessageFlagStateAsync(messageId, flagState) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.ChangeMessageFlagStateAsync(messageId, flagState)
    }

    /**
     * Asynchronously attempts to move the specified email message.
     * @param {HSTRING} messageId The ID of the email message to move.
     * @param {HSTRING} newParentFolderId The ID of the new folder where the email message should reside.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.trymovemessageasync
     */
    TryMoveMessageAsync(messageId, newParentFolderId) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.TryMoveMessageAsync(messageId, newParentFolderId)
    }

    /**
     * Asynchronously attempts to move the specified email folder and rename it in the process.
     * @param {HSTRING} folderId The folder to move.
     * @param {HSTRING} newParentFolderId The new parent for the folder specified in the *folderId* parameter.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.trymovefolderasync
     */
    TryMoveFolderAsync(folderId, newParentFolderId) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.TryMoveFolderAsync(folderId, newParentFolderId)
    }

    /**
     * Asynchronously attempts to move the specified email folder.
     * @param {HSTRING} folderId The folder to move.
     * @param {HSTRING} newParentFolderId The new parent for the folder specified in the *folderId* parameter.
     * @param {HSTRING} newFolderName 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.trymovefolderasync
     */
    TryMoveFolderWithNewNameAsync(folderId, newParentFolderId, newFolderName) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.TryMoveFolderWithNewNameAsync(folderId, newParentFolderId, newFolderName)
    }

    /**
     * Asynchronously deletes an email message from the mailbox.
     * @param {HSTRING} messageId The ID of the email message to delete.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.deletemessageasync
     */
    DeleteMessageAsync(messageId) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.DeleteMessageAsync(messageId)
    }

    /**
     * Asynchronously marks a folder as sync enabled or disabled.
     * @param {HSTRING} folderId The ID of the folder to mark.
     * @param {Boolean} isSyncEnabled True to enable to syncing with the server, false to disable syncing.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.markfoldersyncenabledasync
     */
    MarkFolderSyncEnabledAsync(folderId, isSyncEnabled) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.MarkFolderSyncEnabledAsync(folderId, isSyncEnabled)
    }

    /**
     * Asynchronously sends the specified email message.
     * @param {EmailMessage} message The email message to send.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.sendmessageasync
     */
    SendMessageAsync(message) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.SendMessageAsync(message)
    }

    /**
     * Asynchronously saves a draft email message.
     * @param {EmailMessage} message The draft email message to save.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.savedraftasync
     */
    SaveDraftAsync(message) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.SaveDraftAsync(message)
    }

    /**
     * Asynchronously downloads the specified email message.
     * @param {HSTRING} messageId The ID of the message to download.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.downloadmessageasync
     */
    DownloadMessageAsync(messageId) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.DownloadMessageAsync(messageId)
    }

    /**
     * Asynchronously downloads an email attachment.
     * @param {HSTRING} attachmentId The ID of the attachment to download.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.downloadattachmentasync
     */
    DownloadAttachmentAsync(attachmentId) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.DownloadAttachmentAsync(attachmentId)
    }

    /**
     * Creates a new response email such as Reply, Reply All, Forward, and so on.
     * @param {HSTRING} messageId The ID of the message to which to respond.
     * @param {Integer} responseType The type of response such as Reply, Reply All, Forward, and so on.
     * @param {HSTRING} subject The subject for the response message.
     * @param {Integer} responseHeaderType The format of the email body such as plain text or HTML.
     * @param {HSTRING} responseHeader The header for the response message.
     * @returns {IAsyncOperation<EmailMessage>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.createresponsemessageasync
     */
    CreateResponseMessageAsync(messageId, responseType, subject, responseHeaderType, responseHeader) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.CreateResponseMessageAsync(messageId, responseType, subject, responseHeaderType, responseHeader)
    }

    /**
     * Asynchronously attempts to respond to a meeting request.
     * @param {EmailMessage} meeting The meeting request.
     * @param {Integer} response The response to the meeting request, accept, decline, or tentative.
     * @param {HSTRING} subject The subject of the response email message.
     * @param {HSTRING} comment The body of the response email message.
     * @param {Boolean} sendUpdate A Boolean indicating whether or not to send a response to the meeting originator.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.tryupdatemeetingresponseasync
     */
    TryUpdateMeetingResponseAsync(meeting, response, subject, comment, sendUpdate) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.TryUpdateMeetingResponseAsync(meeting, response, subject, comment, sendUpdate)
    }

    /**
     * Asynchronously attempts to forward a meeting request.
     * @param {EmailMessage} meeting The meeting to forward.
     * @param {IIterable<EmailRecipient>} recipients The list of new recipients.
     * @param {HSTRING} subject The subject of the email.
     * @param {Integer} forwardHeaderType The email message format, HTML or plain text.
     * @param {HSTRING} forwardHeader The email forward header.
     * @param {HSTRING} comment The body of the message.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.tryforwardmeetingasync
     */
    TryForwardMeetingAsync(meeting, recipients, subject, forwardHeaderType, forwardHeader, comment) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.TryForwardMeetingAsync(meeting, recipients, subject, forwardHeaderType, forwardHeader, comment)
    }

    /**
     * Asynchronously attempts to send a meeting request proposing a new time.
     * @param {EmailMessage} meeting The meeting for which to propose a new time.
     * @param {DateTime} newStartTime The proposed new time for the meeting to start.
     * @param {TimeSpan} newDuration The proposed duration of the meeting.
     * @param {HSTRING} subject The subject of the meeting email.
     * @param {HSTRING} comment The body of the message.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.tryproposenewtimeformeetingasync
     */
    TryProposeNewTimeForMeetingAsync(meeting, newStartTime, newDuration, subject, comment) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.TryProposeNewTimeForMeetingAsync(meeting, newStartTime, newDuration, subject, comment)
    }

    /**
     * 
     * @param {TypedEventHandler<EmailMailbox, EmailMailboxChangedEventArgs>} pHandler 
     * @returns {EventRegistrationToken} 
     */
    add_MailboxChanged(pHandler) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.add_MailboxChanged(pHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MailboxChanged(token) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.remove_MailboxChanged(token)
    }

    /**
     * Asynchronously sends the specified email message.
     * @param {EmailMessage} message The email message to send.
     * @param {Boolean} smartSend 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.sendmessageasync
     */
    SmartSendMessageAsync(message, smartSend) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.SmartSendMessageAsync(message, smartSend)
    }

    /**
     * Asynchronously attempts to set the auto-reply settings for the mailbox.
     * @param {EmailMailboxAutoReplySettings} autoReplySettings The new auto-reply settings.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.trysetautoreplysettingsasync
     */
    TrySetAutoReplySettingsAsync(autoReplySettings) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.TrySetAutoReplySettingsAsync(autoReplySettings)
    }

    /**
     * Asynchronously attempts to get the auto-reply settings for the mailbox.
     * @param {Integer} requestedFormat The requested text format of the auto-reply message, HTML or plain text.
     * @returns {IAsyncOperation<EmailMailboxAutoReplySettings>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.trygetautoreplysettingsasync
     */
    TryGetAutoReplySettingsAsync(requestedFormat) {
        if (!this.HasProp("__IEmailMailbox")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox := IEmailMailbox(outPtr)
        }

        return this.__IEmailMailbox.TryGetAutoReplySettingsAsync(requestedFormat)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LinkedMailboxId() {
        if (!this.HasProp("__IEmailMailbox2")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox2 := IEmailMailbox2(outPtr)
        }

        return this.__IEmailMailbox2.get_LinkedMailboxId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NetworkAccountId() {
        if (!this.HasProp("__IEmailMailbox2")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox2 := IEmailMailbox2(outPtr)
        }

        return this.__IEmailMailbox2.get_NetworkAccountId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NetworkId() {
        if (!this.HasProp("__IEmailMailbox2")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox2 := IEmailMailbox2(outPtr)
        }

        return this.__IEmailMailbox2.get_NetworkId()
    }

    /**
     * Resolves a list of one or more email addresses.
     * @param {IIterable<HSTRING>} recipients The list of email addresses.
     * @returns {IAsyncOperation<IVectorView<EmailRecipientResolutionResult>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.resolverecipientsasync
     */
    ResolveRecipientsAsync(recipients) {
        if (!this.HasProp("__IEmailMailbox3")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox3 := IEmailMailbox3(outPtr)
        }

        return this.__IEmailMailbox3.ResolveRecipientsAsync(recipients)
    }

    /**
     * Validates the certificate against the sync provider service.
     * @param {IIterable<Certificate>} certificates The certificate to validate.
     * @returns {IAsyncOperation<IVectorView<Integer>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.validatecertificatesasync
     */
    ValidateCertificatesAsync(certificates) {
        if (!this.HasProp("__IEmailMailbox3")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox3 := IEmailMailbox3(outPtr)
        }

        return this.__IEmailMailbox3.ValidateCertificatesAsync(certificates)
    }

    /**
     * Asynchronously attempt to delete the contents of an email folder.
     * @param {HSTRING} folderId The [Id](emailfolder_id.md) of the folder to empty.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.tryemptyfolderasync
     */
    TryEmptyFolderAsync(folderId) {
        if (!this.HasProp("__IEmailMailbox3")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox3 := IEmailMailbox3(outPtr)
        }

        return this.__IEmailMailbox3.TryEmptyFolderAsync(folderId)
    }

    /**
     * Asynchronously attempts to create a new email folder.
     * @param {HSTRING} parentFolderId The [Id](emailfolder_id.md) of the parent email folder.
     * @param {HSTRING} name The name for the new folder.
     * @returns {IAsyncOperation<EmailMailboxCreateFolderResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.trycreatefolderasync
     */
    TryCreateFolderAsync(parentFolderId, name) {
        if (!this.HasProp("__IEmailMailbox3")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox3 := IEmailMailbox3(outPtr)
        }

        return this.__IEmailMailbox3.TryCreateFolderAsync(parentFolderId, name)
    }

    /**
     * Asynchronously attempts to delete an email folder.
     * @param {HSTRING} folderId The [Id](emailfolder_id.md) of the folder to delete.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.trydeletefolderasync
     */
    TryDeleteFolderAsync(folderId) {
        if (!this.HasProp("__IEmailMailbox3")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox3 := IEmailMailbox3(outPtr)
        }

        return this.__IEmailMailbox3.TryDeleteFolderAsync(folderId)
    }

    /**
     * Asynchronously registers this mailbox as a sync provider.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.registersyncmanagerasync
     */
    RegisterSyncManagerAsync() {
        if (!this.HasProp("__IEmailMailbox4")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox4 := IEmailMailbox4(outPtr)
        }

        return this.__IEmailMailbox4.RegisterSyncManagerAsync()
    }

    /**
     * Gets a [EmailMailboxChangeTracker](emailmailboxchangetracker.md) that provides functionality for monitoring changes to items in the [EmailMailbox](emailmailbox.md).
     * @remarks
     * You can create multiple [EmailMailboxChangeTracker](emailmailboxchangetracker.md) instances by using this method. If you pass in a string that identifies a [EmailMailboxChangeTracker](emailmailboxchangetracker.md) that already exists in the [EmailMailbox](emailmailbox.md), this method returns that instance. If the string that you pass into this method does not identify an existing an existing [EmailMailboxChangeTracker](emailmailboxchangetracker.md), this method returns a new [EmailMailboxChangeTracker](emailmailboxchangetracker.md).
     * 
     * You can use the [IsTracking](emailmailboxchangetracker_istracking.md) property of the [EmailMailboxChangeTracker](emailmailboxchangetracker.md) to determine whether change tracking is enabled for the [EmailMailboxChangeTracker](emailmailboxchangetracker.md).
     * @param {HSTRING} identity A string that identifies the [EmailMailboxChangeTracker](emailmailboxchangetracker.md) instance in the [EmailMailbox](emailmailbox.md).
     * @returns {EmailMailboxChangeTracker} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailbox.getchangetracker
     */
    GetChangeTracker(identity) {
        if (!this.HasProp("__IEmailMailbox5")) {
            if ((queryResult := this.QueryInterface(IEmailMailbox5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailbox5 := IEmailMailbox5(outPtr)
        }

        return this.__IEmailMailbox5.GetChangeTracker(identity)
    }

;@endregion Instance Methods
}
