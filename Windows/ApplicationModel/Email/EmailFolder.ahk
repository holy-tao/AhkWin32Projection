#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailFolder.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an email folder.
 * @remarks
 * The [Folder](emailmailboxchange_folder.md) property returns an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailfolder
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailFolder extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailFolder

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailFolder.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID of the email folder.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailfolder.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets or sets the remote ID of the corresponding folder on the server.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailfolder.remoteid
     * @type {HSTRING} 
     */
    RemoteId {
        get => this.get_RemoteId()
        set => this.put_RemoteId(value)
    }

    /**
     * Gets the ID of the mailbox that contains this folder.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailfolder.mailboxid
     * @type {HSTRING} 
     */
    MailboxId {
        get => this.get_MailboxId()
    }

    /**
     * Gets the ID of this folder's parent folder.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailfolder.parentfolderid
     * @type {HSTRING} 
     */
    ParentFolderId {
        get => this.get_ParentFolderId()
    }

    /**
     * Gets or sets the display name for the folder.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailfolder.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * Gets or sets a Boolean value indicating if the folder is sync enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailfolder.issyncenabled
     * @type {Boolean} 
     */
    IsSyncEnabled {
        get => this.get_IsSyncEnabled()
        set => this.put_IsSyncEnabled(value)
    }

    /**
     * Gets or sets the last time the folder was successfully synced with the server.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailfolder.lastsuccessfulsynctime
     * @type {DateTime} 
     */
    LastSuccessfulSyncTime {
        get => this.get_LastSuccessfulSyncTime()
        set => this.put_LastSuccessfulSyncTime(value)
    }

    /**
     * Gets the type of the folder such as inbox, outbox, drafts, sent, and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailfolder.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
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
        if (!this.HasProp("__IEmailFolder")) {
            if ((queryResult := this.QueryInterface(IEmailFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailFolder := IEmailFolder(outPtr)
        }

        return this.__IEmailFolder.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteId() {
        if (!this.HasProp("__IEmailFolder")) {
            if ((queryResult := this.QueryInterface(IEmailFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailFolder := IEmailFolder(outPtr)
        }

        return this.__IEmailFolder.get_RemoteId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_RemoteId(value) {
        if (!this.HasProp("__IEmailFolder")) {
            if ((queryResult := this.QueryInterface(IEmailFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailFolder := IEmailFolder(outPtr)
        }

        return this.__IEmailFolder.put_RemoteId(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MailboxId() {
        if (!this.HasProp("__IEmailFolder")) {
            if ((queryResult := this.QueryInterface(IEmailFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailFolder := IEmailFolder(outPtr)
        }

        return this.__IEmailFolder.get_MailboxId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ParentFolderId() {
        if (!this.HasProp("__IEmailFolder")) {
            if ((queryResult := this.QueryInterface(IEmailFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailFolder := IEmailFolder(outPtr)
        }

        return this.__IEmailFolder.get_ParentFolderId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IEmailFolder")) {
            if ((queryResult := this.QueryInterface(IEmailFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailFolder := IEmailFolder(outPtr)
        }

        return this.__IEmailFolder.get_DisplayName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if (!this.HasProp("__IEmailFolder")) {
            if ((queryResult := this.QueryInterface(IEmailFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailFolder := IEmailFolder(outPtr)
        }

        return this.__IEmailFolder.put_DisplayName(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSyncEnabled() {
        if (!this.HasProp("__IEmailFolder")) {
            if ((queryResult := this.QueryInterface(IEmailFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailFolder := IEmailFolder(outPtr)
        }

        return this.__IEmailFolder.get_IsSyncEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSyncEnabled(value) {
        if (!this.HasProp("__IEmailFolder")) {
            if ((queryResult := this.QueryInterface(IEmailFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailFolder := IEmailFolder(outPtr)
        }

        return this.__IEmailFolder.put_IsSyncEnabled(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_LastSuccessfulSyncTime() {
        if (!this.HasProp("__IEmailFolder")) {
            if ((queryResult := this.QueryInterface(IEmailFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailFolder := IEmailFolder(outPtr)
        }

        return this.__IEmailFolder.get_LastSuccessfulSyncTime()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_LastSuccessfulSyncTime(value) {
        if (!this.HasProp("__IEmailFolder")) {
            if ((queryResult := this.QueryInterface(IEmailFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailFolder := IEmailFolder(outPtr)
        }

        return this.__IEmailFolder.put_LastSuccessfulSyncTime(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IEmailFolder")) {
            if ((queryResult := this.QueryInterface(IEmailFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailFolder := IEmailFolder(outPtr)
        }

        return this.__IEmailFolder.get_Kind()
    }

    /**
     * Asynchronously creates a new folder.
     * @param {HSTRING} name The name for the new folder.
     * @returns {IAsyncOperation<EmailFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailfolder.createfolderasync
     */
    CreateFolderAsync(name) {
        if (!this.HasProp("__IEmailFolder")) {
            if ((queryResult := this.QueryInterface(IEmailFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailFolder := IEmailFolder(outPtr)
        }

        return this.__IEmailFolder.CreateFolderAsync(name)
    }

    /**
     * Asynchronously deletes this folder.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailfolder.deleteasync
     */
    DeleteAsync() {
        if (!this.HasProp("__IEmailFolder")) {
            if ((queryResult := this.QueryInterface(IEmailFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailFolder := IEmailFolder(outPtr)
        }

        return this.__IEmailFolder.DeleteAsync()
    }

    /**
     * Asynchronously finds the child folders of this folder.
     * @returns {IAsyncOperation<IVectorView<EmailFolder>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailfolder.findchildfoldersasync
     */
    FindChildFoldersAsync() {
        if (!this.HasProp("__IEmailFolder")) {
            if ((queryResult := this.QueryInterface(IEmailFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailFolder := IEmailFolder(outPtr)
        }

        return this.__IEmailFolder.FindChildFoldersAsync()
    }

    /**
     * Gets an instance of the [EmailConversationReader](emailconversationreader.md) class using the specified query options.
     * @returns {EmailConversationReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailfolder.getconversationreader
     */
    GetConversationReader() {
        if (!this.HasProp("__IEmailFolder")) {
            if ((queryResult := this.QueryInterface(IEmailFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailFolder := IEmailFolder(outPtr)
        }

        return this.__IEmailFolder.GetConversationReader()
    }

    /**
     * Gets an instance of the [EmailConversationReader](emailconversationreader.md) class.
     * @param {EmailQueryOptions} options 
     * @returns {EmailConversationReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailfolder.getconversationreader
     */
    GetConversationReaderWithOptions(options) {
        if (!this.HasProp("__IEmailFolder")) {
            if ((queryResult := this.QueryInterface(IEmailFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailFolder := IEmailFolder(outPtr)
        }

        return this.__IEmailFolder.GetConversationReaderWithOptions(options)
    }

    /**
     * Asynchronously gets the specified message from the folder.
     * @param {HSTRING} id The ID of the message to retrieve.
     * @returns {IAsyncOperation<EmailMessage>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailfolder.getmessageasync
     */
    GetMessageAsync(id) {
        if (!this.HasProp("__IEmailFolder")) {
            if ((queryResult := this.QueryInterface(IEmailFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailFolder := IEmailFolder(outPtr)
        }

        return this.__IEmailFolder.GetMessageAsync(id)
    }

    /**
     * Gets an instance of the [EmailMessageReader](emailmessagereader.md) class using the specified query options.
     * @returns {EmailMessageReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailfolder.getmessagereader
     */
    GetMessageReader() {
        if (!this.HasProp("__IEmailFolder")) {
            if ((queryResult := this.QueryInterface(IEmailFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailFolder := IEmailFolder(outPtr)
        }

        return this.__IEmailFolder.GetMessageReader()
    }

    /**
     * Gets an instance of the [EmailMessageReader](emailmessagereader.md) class.
     * @param {EmailQueryOptions} options 
     * @returns {EmailMessageReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailfolder.getmessagereader
     */
    GetMessageReaderWithOptions(options) {
        if (!this.HasProp("__IEmailFolder")) {
            if ((queryResult := this.QueryInterface(IEmailFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailFolder := IEmailFolder(outPtr)
        }

        return this.__IEmailFolder.GetMessageReaderWithOptions(options)
    }

    /**
     * Asynchronously gets the counts of email items such as flagged emails, important emails, unread emails, total emails, and so on.
     * @returns {IAsyncOperation<EmailItemCounts>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailfolder.getmessagecountsasync
     */
    GetMessageCountsAsync() {
        if (!this.HasProp("__IEmailFolder")) {
            if ((queryResult := this.QueryInterface(IEmailFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailFolder := IEmailFolder(outPtr)
        }

        return this.__IEmailFolder.GetMessageCountsAsync()
    }

    /**
     * Asynchronously attempts to move this folder to the specified folder and rename it in the process.
     * @param {EmailFolder} newParentFolder The new location for this folder.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailfolder.trymoveasync
     */
    TryMoveAsync(newParentFolder) {
        if (!this.HasProp("__IEmailFolder")) {
            if ((queryResult := this.QueryInterface(IEmailFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailFolder := IEmailFolder(outPtr)
        }

        return this.__IEmailFolder.TryMoveAsync(newParentFolder)
    }

    /**
     * Asynchronously attempts to move this folder to the specified folder.
     * @param {EmailFolder} newParentFolder The new location for this folder.
     * @param {HSTRING} newFolderName 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailfolder.trymoveasync
     */
    TryMoveWithNewNameAsync(newParentFolder, newFolderName) {
        if (!this.HasProp("__IEmailFolder")) {
            if ((queryResult := this.QueryInterface(IEmailFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailFolder := IEmailFolder(outPtr)
        }

        return this.__IEmailFolder.TryMoveWithNewNameAsync(newParentFolder, newFolderName)
    }

    /**
     * Asynchronously attempts to save changes to the folder.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailfolder.trysaveasync
     */
    TrySaveAsync() {
        if (!this.HasProp("__IEmailFolder")) {
            if ((queryResult := this.QueryInterface(IEmailFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailFolder := IEmailFolder(outPtr)
        }

        return this.__IEmailFolder.TrySaveAsync()
    }

    /**
     * Asynchronously saves the specified email message to the folder.
     * @param {EmailMessage} message The email message to save.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailfolder.savemessageasync
     */
    SaveMessageAsync(message) {
        if (!this.HasProp("__IEmailFolder")) {
            if ((queryResult := this.QueryInterface(IEmailFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailFolder := IEmailFolder(outPtr)
        }

        return this.__IEmailFolder.SaveMessageAsync(message)
    }

;@endregion Instance Methods
}
