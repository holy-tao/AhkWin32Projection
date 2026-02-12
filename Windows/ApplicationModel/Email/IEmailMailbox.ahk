#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\EmailMailboxCapabilities.ahk
#Include .\EmailMailboxChangeTracker.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\EmailMailboxPolicies.ahk
#Include .\EmailMailboxSyncManager.ahk
#Include .\EmailConversationReader.ahk
#Include .\EmailMessageReader.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\EmailConversation.ahk
#Include .\EmailFolder.ahk
#Include .\EmailMessage.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\EmailMailboxAutoReplySettings.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailMailbox extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailMailbox
     * @type {Guid}
     */
    static IID => Guid("{a8790649-cf5b-411b-80b1-4a6a1484ce25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Capabilities", "get_ChangeTracker", "get_DisplayName", "put_DisplayName", "get_Id", "get_IsOwnedByCurrentApp", "get_IsDataEncryptedUnderLock", "get_MailAddress", "put_MailAddress", "get_MailAddressAliases", "get_OtherAppReadAccess", "put_OtherAppReadAccess", "get_OtherAppWriteAccess", "put_OtherAppWriteAccess", "get_Policies", "get_SourceDisplayName", "get_SyncManager", "get_UserDataAccountId", "GetConversationReader", "GetConversationReaderWithOptions", "GetMessageReader", "GetMessageReaderWithOptions", "DeleteAsync", "GetConversationAsync", "GetFolderAsync", "GetMessageAsync", "GetSpecialFolderAsync", "SaveAsync", "MarkMessageAsSeenAsync", "MarkFolderAsSeenAsync", "MarkMessageReadAsync", "ChangeMessageFlagStateAsync", "TryMoveMessageAsync", "TryMoveFolderAsync", "TryMoveFolderWithNewNameAsync", "DeleteMessageAsync", "MarkFolderSyncEnabledAsync", "SendMessageAsync", "SaveDraftAsync", "DownloadMessageAsync", "DownloadAttachmentAsync", "CreateResponseMessageAsync", "TryUpdateMeetingResponseAsync", "TryForwardMeetingAsync", "TryProposeNewTimeForMeetingAsync", "add_MailboxChanged", "remove_MailboxChanged", "SmartSendMessageAsync", "TrySetAutoReplySettingsAsync", "TryGetAutoReplySettingsAsync"]

    /**
     * @type {EmailMailboxCapabilities} 
     */
    Capabilities {
        get => this.get_Capabilities()
    }

    /**
     * @type {EmailMailboxChangeTracker} 
     */
    ChangeTracker {
        get => this.get_ChangeTracker()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {Boolean} 
     */
    IsOwnedByCurrentApp {
        get => this.get_IsOwnedByCurrentApp()
    }

    /**
     * @type {Boolean} 
     */
    IsDataEncryptedUnderLock {
        get => this.get_IsDataEncryptedUnderLock()
    }

    /**
     * @type {HSTRING} 
     */
    MailAddress {
        get => this.get_MailAddress()
        set => this.put_MailAddress(value)
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    MailAddressAliases {
        get => this.get_MailAddressAliases()
    }

    /**
     * @type {Integer} 
     */
    OtherAppReadAccess {
        get => this.get_OtherAppReadAccess()
        set => this.put_OtherAppReadAccess(value)
    }

    /**
     * @type {Integer} 
     */
    OtherAppWriteAccess {
        get => this.get_OtherAppWriteAccess()
        set => this.put_OtherAppWriteAccess(value)
    }

    /**
     * @type {EmailMailboxPolicies} 
     */
    Policies {
        get => this.get_Policies()
    }

    /**
     * @type {HSTRING} 
     */
    SourceDisplayName {
        get => this.get_SourceDisplayName()
    }

    /**
     * @type {EmailMailboxSyncManager} 
     */
    SyncManager {
        get => this.get_SyncManager()
    }

    /**
     * @type {HSTRING} 
     */
    UserDataAccountId {
        get => this.get_UserDataAccountId()
    }

    /**
     * 
     * @returns {EmailMailboxCapabilities} 
     */
    get_Capabilities() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailMailboxCapabilities(value)
    }

    /**
     * 
     * @returns {EmailMailboxChangeTracker} 
     */
    get_ChangeTracker() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailMailboxChangeTracker(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOwnedByCurrentApp() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDataEncryptedUnderLock() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MailAddress() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_MailAddress(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_MailAddressAliases() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OtherAppReadAccess() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OtherAppReadAccess(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OtherAppWriteAccess() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OtherAppWriteAccess(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {EmailMailboxPolicies} 
     */
    get_Policies() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailMailboxPolicies(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourceDisplayName() {
        value := HSTRING()
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {EmailMailboxSyncManager} 
     */
    get_SyncManager() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailMailboxSyncManager(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserDataAccountId() {
        value := HSTRING()
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {EmailConversationReader} 
     */
    GetConversationReader() {
        result := ComCall(24, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailConversationReader(result_)
    }

    /**
     * 
     * @param {EmailQueryOptions} options 
     * @returns {EmailConversationReader} 
     */
    GetConversationReaderWithOptions(options) {
        result := ComCall(25, this, "ptr", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailConversationReader(result_)
    }

    /**
     * 
     * @returns {EmailMessageReader} 
     */
    GetMessageReader() {
        result := ComCall(26, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailMessageReader(result_)
    }

    /**
     * 
     * @param {EmailQueryOptions} options 
     * @returns {EmailMessageReader} 
     */
    GetMessageReaderWithOptions(options) {
        result := ComCall(27, this, "ptr", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailMessageReader(result_)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    DeleteAsync() {
        result := ComCall(28, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {HSTRING} id 
     * @returns {IAsyncOperation<EmailConversation>} 
     */
    GetConversationAsync(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(29, this, "ptr", id, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(EmailConversation, result_)
    }

    /**
     * 
     * @param {HSTRING} id 
     * @returns {IAsyncOperation<EmailFolder>} 
     */
    GetFolderAsync(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(30, this, "ptr", id, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(EmailFolder, result_)
    }

    /**
     * 
     * @param {HSTRING} id 
     * @returns {IAsyncOperation<EmailMessage>} 
     */
    GetMessageAsync(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(31, this, "ptr", id, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(EmailMessage, result_)
    }

    /**
     * 
     * @param {Integer} folderType 
     * @returns {IAsyncOperation<EmailFolder>} 
     */
    GetSpecialFolderAsync(folderType) {
        result := ComCall(32, this, "int", folderType, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(EmailFolder, result_)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    SaveAsync() {
        result := ComCall(33, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {HSTRING} messageId 
     * @returns {IAsyncAction} 
     */
    MarkMessageAsSeenAsync(messageId) {
        if(messageId is String) {
            pin := HSTRING.Create(messageId)
            messageId := pin.Value
        }
        messageId := messageId is Win32Handle ? NumGet(messageId, "ptr") : messageId

        result := ComCall(34, this, "ptr", messageId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {HSTRING} folderId 
     * @returns {IAsyncAction} 
     */
    MarkFolderAsSeenAsync(folderId) {
        if(folderId is String) {
            pin := HSTRING.Create(folderId)
            folderId := pin.Value
        }
        folderId := folderId is Win32Handle ? NumGet(folderId, "ptr") : folderId

        result := ComCall(35, this, "ptr", folderId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {HSTRING} messageId 
     * @param {Boolean} isRead 
     * @returns {IAsyncAction} 
     */
    MarkMessageReadAsync(messageId, isRead) {
        if(messageId is String) {
            pin := HSTRING.Create(messageId)
            messageId := pin.Value
        }
        messageId := messageId is Win32Handle ? NumGet(messageId, "ptr") : messageId

        result := ComCall(36, this, "ptr", messageId, "int", isRead, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {HSTRING} messageId 
     * @param {Integer} flagState 
     * @returns {IAsyncAction} 
     */
    ChangeMessageFlagStateAsync(messageId, flagState) {
        if(messageId is String) {
            pin := HSTRING.Create(messageId)
            messageId := pin.Value
        }
        messageId := messageId is Win32Handle ? NumGet(messageId, "ptr") : messageId

        result := ComCall(37, this, "ptr", messageId, "int", flagState, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {HSTRING} messageId 
     * @param {HSTRING} newParentFolderId 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryMoveMessageAsync(messageId, newParentFolderId) {
        if(messageId is String) {
            pin := HSTRING.Create(messageId)
            messageId := pin.Value
        }
        messageId := messageId is Win32Handle ? NumGet(messageId, "ptr") : messageId
        if(newParentFolderId is String) {
            pin := HSTRING.Create(newParentFolderId)
            newParentFolderId := pin.Value
        }
        newParentFolderId := newParentFolderId is Win32Handle ? NumGet(newParentFolderId, "ptr") : newParentFolderId

        result := ComCall(38, this, "ptr", messageId, "ptr", newParentFolderId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {HSTRING} folderId 
     * @param {HSTRING} newParentFolderId 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryMoveFolderAsync(folderId, newParentFolderId) {
        if(folderId is String) {
            pin := HSTRING.Create(folderId)
            folderId := pin.Value
        }
        folderId := folderId is Win32Handle ? NumGet(folderId, "ptr") : folderId
        if(newParentFolderId is String) {
            pin := HSTRING.Create(newParentFolderId)
            newParentFolderId := pin.Value
        }
        newParentFolderId := newParentFolderId is Win32Handle ? NumGet(newParentFolderId, "ptr") : newParentFolderId

        result := ComCall(39, this, "ptr", folderId, "ptr", newParentFolderId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {HSTRING} folderId 
     * @param {HSTRING} newParentFolderId 
     * @param {HSTRING} newFolderName 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryMoveFolderWithNewNameAsync(folderId, newParentFolderId, newFolderName) {
        if(folderId is String) {
            pin := HSTRING.Create(folderId)
            folderId := pin.Value
        }
        folderId := folderId is Win32Handle ? NumGet(folderId, "ptr") : folderId
        if(newParentFolderId is String) {
            pin := HSTRING.Create(newParentFolderId)
            newParentFolderId := pin.Value
        }
        newParentFolderId := newParentFolderId is Win32Handle ? NumGet(newParentFolderId, "ptr") : newParentFolderId
        if(newFolderName is String) {
            pin := HSTRING.Create(newFolderName)
            newFolderName := pin.Value
        }
        newFolderName := newFolderName is Win32Handle ? NumGet(newFolderName, "ptr") : newFolderName

        result := ComCall(40, this, "ptr", folderId, "ptr", newParentFolderId, "ptr", newFolderName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {HSTRING} messageId 
     * @returns {IAsyncAction} 
     */
    DeleteMessageAsync(messageId) {
        if(messageId is String) {
            pin := HSTRING.Create(messageId)
            messageId := pin.Value
        }
        messageId := messageId is Win32Handle ? NumGet(messageId, "ptr") : messageId

        result := ComCall(41, this, "ptr", messageId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {HSTRING} folderId 
     * @param {Boolean} isSyncEnabled 
     * @returns {IAsyncAction} 
     */
    MarkFolderSyncEnabledAsync(folderId, isSyncEnabled) {
        if(folderId is String) {
            pin := HSTRING.Create(folderId)
            folderId := pin.Value
        }
        folderId := folderId is Win32Handle ? NumGet(folderId, "ptr") : folderId

        result := ComCall(42, this, "ptr", folderId, "int", isSyncEnabled, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {EmailMessage} message 
     * @returns {IAsyncAction} 
     */
    SendMessageAsync(message) {
        result := ComCall(43, this, "ptr", message, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {EmailMessage} message 
     * @returns {IAsyncAction} 
     */
    SaveDraftAsync(message) {
        result := ComCall(44, this, "ptr", message, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {HSTRING} messageId 
     * @returns {IAsyncAction} 
     */
    DownloadMessageAsync(messageId) {
        if(messageId is String) {
            pin := HSTRING.Create(messageId)
            messageId := pin.Value
        }
        messageId := messageId is Win32Handle ? NumGet(messageId, "ptr") : messageId

        result := ComCall(45, this, "ptr", messageId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {HSTRING} attachmentId 
     * @returns {IAsyncAction} 
     */
    DownloadAttachmentAsync(attachmentId) {
        if(attachmentId is String) {
            pin := HSTRING.Create(attachmentId)
            attachmentId := pin.Value
        }
        attachmentId := attachmentId is Win32Handle ? NumGet(attachmentId, "ptr") : attachmentId

        result := ComCall(46, this, "ptr", attachmentId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {HSTRING} messageId 
     * @param {Integer} responseType 
     * @param {HSTRING} subject 
     * @param {Integer} responseHeaderType 
     * @param {HSTRING} responseHeader 
     * @returns {IAsyncOperation<EmailMessage>} 
     */
    CreateResponseMessageAsync(messageId, responseType, subject, responseHeaderType, responseHeader) {
        if(messageId is String) {
            pin := HSTRING.Create(messageId)
            messageId := pin.Value
        }
        messageId := messageId is Win32Handle ? NumGet(messageId, "ptr") : messageId
        if(subject is String) {
            pin := HSTRING.Create(subject)
            subject := pin.Value
        }
        subject := subject is Win32Handle ? NumGet(subject, "ptr") : subject
        if(responseHeader is String) {
            pin := HSTRING.Create(responseHeader)
            responseHeader := pin.Value
        }
        responseHeader := responseHeader is Win32Handle ? NumGet(responseHeader, "ptr") : responseHeader

        result := ComCall(47, this, "ptr", messageId, "int", responseType, "ptr", subject, "int", responseHeaderType, "ptr", responseHeader, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(EmailMessage, result_)
    }

    /**
     * 
     * @param {EmailMessage} meeting 
     * @param {Integer} response 
     * @param {HSTRING} subject 
     * @param {HSTRING} comment 
     * @param {Boolean} sendUpdate 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryUpdateMeetingResponseAsync(meeting, response, subject, comment, sendUpdate) {
        if(subject is String) {
            pin := HSTRING.Create(subject)
            subject := pin.Value
        }
        subject := subject is Win32Handle ? NumGet(subject, "ptr") : subject
        if(comment is String) {
            pin := HSTRING.Create(comment)
            comment := pin.Value
        }
        comment := comment is Win32Handle ? NumGet(comment, "ptr") : comment

        result := ComCall(48, this, "ptr", meeting, "int", response, "ptr", subject, "ptr", comment, "int", sendUpdate, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {EmailMessage} meeting 
     * @param {IIterable<EmailRecipient>} recipients 
     * @param {HSTRING} subject 
     * @param {Integer} forwardHeaderType 
     * @param {HSTRING} forwardHeader 
     * @param {HSTRING} comment 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryForwardMeetingAsync(meeting, recipients, subject, forwardHeaderType, forwardHeader, comment) {
        if(subject is String) {
            pin := HSTRING.Create(subject)
            subject := pin.Value
        }
        subject := subject is Win32Handle ? NumGet(subject, "ptr") : subject
        if(forwardHeader is String) {
            pin := HSTRING.Create(forwardHeader)
            forwardHeader := pin.Value
        }
        forwardHeader := forwardHeader is Win32Handle ? NumGet(forwardHeader, "ptr") : forwardHeader
        if(comment is String) {
            pin := HSTRING.Create(comment)
            comment := pin.Value
        }
        comment := comment is Win32Handle ? NumGet(comment, "ptr") : comment

        result := ComCall(49, this, "ptr", meeting, "ptr", recipients, "ptr", subject, "int", forwardHeaderType, "ptr", forwardHeader, "ptr", comment, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {EmailMessage} meeting 
     * @param {DateTime} newStartTime 
     * @param {TimeSpan} newDuration 
     * @param {HSTRING} subject 
     * @param {HSTRING} comment 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryProposeNewTimeForMeetingAsync(meeting, newStartTime, newDuration, subject, comment) {
        if(subject is String) {
            pin := HSTRING.Create(subject)
            subject := pin.Value
        }
        subject := subject is Win32Handle ? NumGet(subject, "ptr") : subject
        if(comment is String) {
            pin := HSTRING.Create(comment)
            comment := pin.Value
        }
        comment := comment is Win32Handle ? NumGet(comment, "ptr") : comment

        result := ComCall(50, this, "ptr", meeting, "ptr", newStartTime, "ptr", newDuration, "ptr", subject, "ptr", comment, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {TypedEventHandler<EmailMailbox, EmailMailboxChangedEventArgs>} pHandler 
     * @returns {EventRegistrationToken} 
     */
    add_MailboxChanged(pHandler) {
        pToken := EventRegistrationToken()
        result := ComCall(51, this, "ptr", pHandler, "ptr", pToken, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pToken
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MailboxChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(52, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {EmailMessage} message 
     * @param {Boolean} smartSend 
     * @returns {IAsyncAction} 
     */
    SmartSendMessageAsync(message, smartSend) {
        result := ComCall(53, this, "ptr", message, "int", smartSend, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {EmailMailboxAutoReplySettings} autoReplySettings 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TrySetAutoReplySettingsAsync(autoReplySettings) {
        result := ComCall(54, this, "ptr", autoReplySettings, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {Integer} requestedFormat 
     * @returns {IAsyncOperation<EmailMailboxAutoReplySettings>} 
     */
    TryGetAutoReplySettingsAsync(requestedFormat) {
        result := ComCall(55, this, "int", requestedFormat, "ptr*", &autoReplySettings := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(EmailMailboxAutoReplySettings, autoReplySettings)
    }
}
