#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMessage.ahk
#Include .\IMAPIFolder.ahk
#Include .\IMAPIContainer.ahk

/**
 * IMAPIFolderIMAPIContainer performs operations on the messages and subfolders in a folder. This article describes the related properties and members.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolderimapicontainer
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMAPIFolder extends IMAPIContainer{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMessage", "CopyMessages", "DeleteMessages", "CreateFolder", "CopyFolder", "DeleteFolder", "SetReadFlags", "GetMessageStatus", "SetMessageStatus", "SaveContentsSort", "EmptyFolder"]

    /**
     * IMAPIFolderCreateMessage creates a new message. This article describes its syntax, parameters, return value, and remarks.
     * @remarks
     * The **IMAPIFolder::CreateMessage** method creates a new message with generic or associated content and assigns an entry identifier. The entry identifier consists of a part that represents the message store provider and a part that represents the individual message.
     * @param {Pointer<Guid>} lpInterface > [in] A pointer to the interface identifier (IID) that represents the interface to be used to access the new message. Valid interface identifiers include IID_IUnknown, IID_IMAPIProp, IID_IMAPIContainer, and IID_IMAPIFolder. Passing NULL causes the message store provider to return the standard message interface, [IMessage : IMAPIProp](imessageimapiprop.md).
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls how the message is created. The following flags can be set:
     *     
     * ITEMPROC_FORCE
     *   
     * > Indicates to the personal folder store (PST) that the message is eligible for rules processing before the store notifies any listening client of the arrival of the new message. Rules processing only applies to new messages that are created on a server that is not a Microsoft Exchange Server, because Exchange Server processes rules for messages on the server. Therefore, the provider or client creating the message must pass this flag in combination with saving a message with [IMAPIPProp::SaveChanges](imapiprop-savechanges.md) using NON_EMS_XP_SAVE, which indicates that the server is not an Exchange Server. 
     *     
     * MAPI_ASSOCIATED 
     *   
     * > The message to be created should be included in the associated contents table instead of the standard contents table. Associated messages are hidden from user interaction.
     *     
     * MAPI_DEFERRED_ERRORS 
     *   
     * > **CreateMessage** is allowed to succeed even if the create operation has not fully completed. This implies that the new message might not be immediately available to the caller.
     * @returns {IMessage} > [out] A pointer to a pointer to the newly created message.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-createmessage
     */
    CreateMessage(lpInterface, ulFlags) {
        result := ComCall(19, this, "ptr", lpInterface, "uint", ulFlags, "ptr*", &lppMessage := 0, "HRESULT")
        return IMessage(lppMessage)
    }

    /**
     * IMAPIFolderCopyMessages copies or moves one or more messages. This article describes its syntax, parameters, return value, and remarks.
     * @remarks
     * The **IMAPIFolder::CopyMessages** method copies or moves messages to another folder. 
     *   
     * Messages that are opened with read/write permission can be moved or copied.
     * @param {Pointer<SBinaryArray>} lpMsgList > [in] A pointer to an array of [ENTRYLIST](entrylist.md) structures that identify the message or messages to copy or move.
     * @param {Pointer<Guid>} lpInterface > [in] A pointer to the interface identifier (IID) that represents the interface to be used to access the destination folder pointed to by the  _lpDestFolder_ parameter. Passing NULL results in the service provider returning the standard folder interface, [IMAPIFolder : IMAPIContainer](imapifolderimapicontainer.md). Clients must pass NULL. Other callers can set the  _lpInterface_ parameter to IID_IUnknown, IID_IMAPIProp, IID_IMAPIContainer, or IID_IMAPIFolder.
     * @param {Pointer<Void>} lpDestFolder > [in] A pointer to the open folder to receive the copied or moved messages.
     * @param {Pointer} ulUIParam > [in] A handle to the parent window of any dialog boxes or windows this method displays. The  _ulUIParam_ parameter is ignored unless the client sets the MESSAGE_DIALOG flag in the _ulFlags_ parameter and passes NULL in the _lpProgress_ parameter.
     * @param {IMAPIProgress} lpProgress > [in] A pointer to a progress object that displays a progress indicator. If NULL is passed in  _lpProgress_, the message store provider displays a progress indicator by using the MAPI progress object implementation. The  _lpProgress_ parameter is ignored unless the MESSAGE_DIALOG flag is set in  _ulFlags_.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls how the copy or move operation is accomplished. The following flags can be set:
     *     
     * MAPI_DECLINE_OK 
     *   
     * > Informs the message store provider to immediately return MAPI_E_DECLINE_COPY if it implements **IMAPIFolder::CopyMessages** by calling the support object's [IMAPISupport::DoCopyTo](imapisupport-docopyto.md) or [IMAPISupport::DoCopyProps](imapisupport-docopyprops.md) method. 
     *     
     * MESSAGE_DIALOG 
     *   
     * > Displays a progress indicator as the operation proceeds.
     *     
     * MESSAGE_MOVE 
     *   
     * > The message or messages are to be moved instead of copied. If MESSAGE_MOVE is not set, the messages are copied.
     * @returns {HRESULT} S_OK 
     *   
     * > The message or messages have been successfully copied or moved.
     *     
     * MAPI_E_DECLINE_COPY 
     *   
     * > The provider implements this method by calling a support object method, and the caller has passed the MAPI_DECLINE_OK flag.
     *     
     * MAPI_W_PARTIAL_COMPLETION 
     *   
     * > The call succeeded, but not all entries were successfully copied or moved. When this warning is returned, the call should be handled as successful. To test for this warning, use the **HR_FAILED** macro. For more information, see [Using Macros for Error Handling](using-macros-for-error-handling.md).
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-copymessages
     */
    CopyMessages(lpMsgList, lpInterface, lpDestFolder, ulUIParam, lpProgress, ulFlags) {
        lpDestFolderMarshal := lpDestFolder is VarRef ? "ptr" : "ptr"

        result := ComCall(20, this, "ptr", lpMsgList, "ptr", lpInterface, lpDestFolderMarshal, lpDestFolder, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * IMAPIFolderDeleteMessages deletes one or more messages. This article describes its syntax, parameters, return value, and remarks.
     * @remarks
     * The **IMAPIFolder::DeleteMessages** method deletes messages from a folder. Messages that do not exist, that have been moved elsewhere, that are open with read/write permission, or that are currently submitted cannot be deleted.
     * @param {Pointer<SBinaryArray>} lpMsgList > [in] A pointer to an [ENTRYLIST](entrylist.md) structure that contains the number of messages to delete and an array of [ENTRYID](entryid.md) structures that identify the messages.
     * @param {Pointer} ulUIParam > [in] A handle to the parent window of the progress indicator. The  _ulUIParam_ parameter is ignored unless the MESSAGE_DIALOG flag is set in the _ulFlags_ parameter.
     * @param {IMAPIProgress} lpProgress > [in] A pointer to a progress object that displays a progress indicator. If NULL is passed in  _lpProgress_, the message store provider displays a progress indicator by using the MAPI progress object implementation. The  _lpProgress_ parameter is ignored unless the MESSAGE_DIALOG flag is set in the _ulFlags_ parameter.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls how the messages are deleted. The following flags can be set:
     *     
     * DELETE_HARD_DELETE
     *   
     * > Permanently removes all messages, including soft-deleted ones.
     *     
     * MESSAGE_DIALOG 
     *   
     * > Displays a progress indicator as the operation proceeds.
     * @returns {HRESULT} S_OK 
     *   
     * > The specified message or messages were successfully deleted.
     *     
     * MAPI_W_PARTIAL_COMPLETION 
     *   
     * > The call succeeded, but not all of the messages were successfully deleted. When this warning is returned, the call should be handled as successful. To test for this warning, use the **HR_FAILED** macro. For more information, see [Using Macros for Error Handling](using-macros-for-error-handling.md).
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-deletemessages
     */
    DeleteMessages(lpMsgList, ulUIParam, lpProgress, ulFlags) {
        result := ComCall(21, this, "ptr", lpMsgList, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * IMAPIFolderCreateFolder creates a new subfolder. This article describes its syntax, parameters, return value, and remarks.
     * @remarks
     * The **IMAPIFolder::CreateFolder** method creates a subfolder in the current folder and assigns an entry identifier to the new folder.
     * @param {Integer} ulFolderType > [in] The type of folder to create. The following flags can be set:
     *     
     * FOLDER_GENERIC 
     *   
     * > A generic folder should be created.
     *     
     * FOLDER_SEARCH 
     *   
     * > A search-results folder should be created.
     * @param {Pointer<Integer>} lpszFolderName > [in] A pointer to a string that contains the name for the new folder. This name is the basis for the new folder's **PR_DISPLAY_NAME** ([PidTagDisplayName](pidtagdisplayname-canonical-property.md)) property.
     * @param {Pointer<Integer>} lpszFolderComment > [in] A pointer to a string that contains a comment associated with the new folder. This string becomes the value of the new folder's **PR_COMMENT** ([PidTagComment](pidtagcomment-canonical-property.md)) property. If NULL is passed, the folder has no initial comment.
     * @param {Pointer<Guid>} lpInterface > [in] A pointer to the interface identifier (IID) that represents the interface to be used to access the new folder. Passing NULL causes the message store provider to return the standard folder interface, [IMAPIFolder : IMAPIContainer](imapifolderimapicontainer.md). Clients must pass NULL. Other callers can set the  _lpInterface_ parameter to IID_IUnknown, IID_IMAPIProp, IID_IMAPIContainer, or IID_IMAPIFolder.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls how the folder is created. The following flags can be set:
     *     
     * MAPI_DEFERRED_ERRORS 
     *   
     * > Allows **CreateFolder** to return successfully, possibly before the new folder is fully available to the calling client. If the new folder is not available, making a subsequent call to it can cause an error. 
     *     
     * MAPI_UNICODE 
     *   
     * > The name of the folder is in Unicode format. If the MAPI_UNICODE flag is not set, the folder name is in ANSI format.
     *     
     * OPEN_IF_EXISTS 
     *   
     * > Allows the method to succeed even if the folder named in the _lpszFolderName_ parameter already exists by opening the existing folder that has that name. Note that message store providers that allow sibling folders to have the same name might not open an existing folder if more than one exists with the supplied name.
     * @returns {IMAPIFolder} > [out] A pointer to a pointer to the newly created folder.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-createfolder
     */
    CreateFolder(ulFolderType, lpszFolderName, lpszFolderComment, lpInterface, ulFlags) {
        lpszFolderNameMarshal := lpszFolderName is VarRef ? "char*" : "ptr"
        lpszFolderCommentMarshal := lpszFolderComment is VarRef ? "char*" : "ptr"

        result := ComCall(22, this, "uint", ulFolderType, lpszFolderNameMarshal, lpszFolderName, lpszFolderCommentMarshal, lpszFolderComment, "ptr", lpInterface, "uint", ulFlags, "ptr*", &lppFolder := 0, "HRESULT")
        return IMAPIFolder(lppFolder)
    }

    /**
     * IMAPIFolderCopyFolder copies or moves a subfolder. This article describes its parameters, return value, and remarks.
     * @remarks
     * The **IMAPIFolder::CopyFolder** method copies or moves a subfolder from one location to another. The subfolder being copied or moved is added to the destination folder as a subfolder.
     * @param {Integer} cbEntryID > [in] The byte count in the entry identifier pointed to by the  _lpEntryID_ parameter.
     * @param {Pointer} lpEntryID > [in] A pointer to the entry identifier of the subfolder to copy or move.
     * @param {Pointer<Guid>} lpInterface > [in] A pointer to the interface identifier (IID) that represents the interface to be used to access the folder that the  _lpDestFolder_ parameter points to. Passing NULL causes the service provider to return the standard folder interface, [IMAPIFolder : IMAPIContainer](imapifolderimapicontainer.md). Valid values for  _lpInterface_ include IID_IUnknown, IID_IMAPIProp, IID_IMAPIContainer, and IID_IMAPIFolder.
     * @param {Pointer<Void>} lpDestFolder > [in] A pointer to the open folder to receive the copied or moved subfolder.
     * @param {Pointer<Integer>} lpszNewFolderName > [in] A pointer to the name of the copied or moved folder in its new destination. If  _lpszNewFolderName_ is set to NULL, the name of the source subfolder is used for the name of the destination folder.
     * @param {Pointer} ulUIParam > [in] A handle to the parent window of the progress indicator. The  _ulUIParam_ parameter is ignored unless the FOLDER_DIALOG flag in the _ulFlags_ parameter is set.
     * @param {IMAPIProgress} lpProgress > [in] A pointer to a progress object that displays a progress indicator. If NULL is passed in  _lpProgress_, the message store provider displays a progress indicator by using the MAPI progress object implementation. The  _lpProgress_ parameter is ignored unless the FOLDER_DIALOG flag is set in  _ulFlags_.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls the copy or move operation. The following flags can be set:
     *     
     * COPY_SUBFOLDERS 
     *   
     * > All of the subfolders in the subfolder to be copied should also be copied. When COPY_SUBFOLDERS is not set for a copy operation, only the subfolder identified by  _lpEntryID_ is copied. With a move operation, the COPY_SUBFOLDERS behavior is the default regardless of whether the flag is set. 
     *     
     * FOLDER_DIALOG 
     *   
     * > Requests the display of a progress indicator.
     *     
     * FOLDER_MOVE 
     *   
     * > The subfolder is to be moved instead of copied. If FOLDER_MOVE is not set, the subfolder is copied.
     *     
     * MAPI_DECLINE_OK 
     *   
     * > Informs the message store provider that if it implements **CopyFolder** by calling its support object's [IMAPISupport::DoCopyTo](imapisupport-docopyto.md) or [IMAPISupport::DoCopyProps](imapisupport-docopyprops.md) method, **CopyFolder** should instead immediately return MAPI_E_DECLINE_COPY. 
     *     
     * MAPI_UNICODE 
     *   
     * > The name of the destination folder is in Unicode format. If the MAPI_UNICODE flag is not set, the folder name is in ANSI format.
     * @returns {HRESULT} S_OK 
     *   
     * > The specified folder has been successfully copied or moved.
     *     
     * MAPI_E_BAD_CHARWIDTH 
     *   
     * > Either the MAPI_UNICODE flag was set and the message store provider does not support Unicode, or MAPI_UNICODE was not set and the message store provider supports only Unicode.
     *     
     * MAPI_E_COLLISION 
     *   
     * > The name of the folder being moved or copied is the same as that of a subfolder in the destination folder. The message store provider requires unique folder names.
     *     
     * MAPI_E_DECLINE_COPY 
     *   
     * > The provider implements this method by calling a support object method, and the caller has passed the MAPI_DECLINE_OK flag.
     *     
     * MAPI_E_FOLDER_CYCLE 
     *   
     * > The source folder directly or indirectly contains the destination folder. Significant work may have been performed before this condition was discovered, so the source and destination folder may be partially modified. 
     *     
     * MAPI_W_PARTIAL_COMPLETION 
     *   
     * > The call succeeded, but not all entries were successfully copied. When this warning is returned, the call should be handled as successful. To test for this warning, use the **HR_FAILED** macro. For more information, see [Using Macros for Error Handling](using-macros-for-error-handling.md).
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-copyfolder
     */
    CopyFolder(cbEntryID, lpEntryID, lpInterface, lpDestFolder, lpszNewFolderName, ulUIParam, lpProgress, ulFlags) {
        lpDestFolderMarshal := lpDestFolder is VarRef ? "ptr" : "ptr"
        lpszNewFolderNameMarshal := lpszNewFolderName is VarRef ? "char*" : "ptr"

        result := ComCall(23, this, "uint", cbEntryID, "ptr", lpEntryID, "ptr", lpInterface, lpDestFolderMarshal, lpDestFolder, lpszNewFolderNameMarshal, lpszNewFolderName, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * IMAPIFolderDeleteFolder deletes a subfolder. This article describes its syntax, parameters, return value, and remarks.
     * @remarks
     * The **IMAPIFolder::DeleteFolder** method deletes a subfolder. By default, **DeleteFolder** operates only on empty folders, but you can use it successfully on non-empty folders by setting two flags: DEL_FOLDERS and DEL_MESSAGES. Only empty folders or folders that set both the DEL_FOLDERS and DEL_MESSAGES flags on the **DeleteFolder** call can be deleted. DEL_FOLDERS enables all of the folder's subfolders to be removed; DEL_MESSAGES enables all of the folder's messages to be removed. 
     *   
     * The MFCMAPI program allows to choose between folder soft-delete vs. folder hard-delete. Exchange Server 2019 does not implement folder soft-delete in private stores either, and treats deletion requests for folders within private stores (cf. the [[ropOpenFolder]](/openspecs/exchange_server_protocols/ms-oxcfold/9a9402e4-0694-4043-aee0-bcb9737cc8c0) request) as if DELETE_HARD_DELETE was set.
     * @param {Integer} cbEntryID > [in] The byte count in the entry identifier pointed to by the  _lpEntryID_ parameter.
     * @param {Pointer} lpEntryID > [in] A pointer to the entry identifier of the subfolder to delete.
     * @param {Pointer} ulUIParam > [in] A handle to the parent window of the progress indicator. The  _ulUIParam_ parameter is ignored unless the FOLDER_DIALOG flag is set in the _ulFlags_ parameter.
     * @param {IMAPIProgress} lpProgress > [in] A pointer to a progress object that displays a progress indicator. If NULL is passed in  _lpProgress_, the message store provider displays a progress indicator by using the MAPI progress object implementation. The  _lpProgress_ parameter is ignored unless the FOLDER_DIALOG flag is set in  _ulFlags_.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls the deletion of the subfolder. The following flags can be set:
     *     
     * DEL_FOLDERS 
     *   
     * > All subfolders of the subfolder pointed to by  _lpEntryID_ should be deleted. 
     *     
     * DEL_MESSAGES 
     *   
     * > All messages in the subfolder pointed to by  _lpEntryID_ should be deleted. 
     *     
     * DELETE_HARD_DELETE
     *   
     * > Permanently removes the folder.
     *     
     * FOLDER_DIALOG 
     *   
     * > A progress indicator should be displayed while the operation proceeds.
     * @returns {HRESULT} S_OK 
     *   
     * > The specified folder has been successfully deleted.
     *     
     * MAPI_E_HAS_FOLDERS 
     *   
     * > The subfolder being deleted contains subfolders, and the DEL_FOLDERS flag was not set. The subfolders were not deleted.
     *     
     * MAPI_E_HAS_MESSAGES 
     *   
     * > The subfolder being deleted contains messages, and the DEL_MESSAGES flag was not set. The subfolder was not deleted.
     *     
     * MAPI_W_PARTIAL_COMPLETION 
     *   
     * > The call succeeded, but not all of the entries were successfully deleted. When this warning is returned, the call should be handled as successful. To test for this warning, use the **HR_FAILED** macro. For more information, see [Using Macros for Error Handling](using-macros-for-error-handling.md).
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-deletefolder
     */
    DeleteFolder(cbEntryID, lpEntryID, ulUIParam, lpProgress, ulFlags) {
        result := ComCall(24, this, "uint", cbEntryID, "ptr", lpEntryID, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * IMAPIFolderSetReadFlags sets or clears the MSGFLAG_READ flag in the PR_MESSAGE_FLAGS property of one or more of the folder's messages.
     * @remarks
     * The **IMAPIFolder::SetReadFlags** method sets or clears the MSGFLAG_READ flag in the **PR_MESSAGE_FLAGS** property of one or more of the folder's messages. Setting the MSGFLAG_READ flag marks a message as read, which does not necessarily indicate that the intended recipient has actually read the message. 
     *   
     * **SetReadFlags** also manages the sending of read reports. 
     *   
     * The read flag cannot be changed for the following:
     *   
     * - Messages that do not exist.
     *     
     * - Messages that have been moved elsewhere.
     *     
     * - Messages that are open with read/write permission.
     *     
     * - Messages that are currently submitted.
     * @param {Pointer<SBinaryArray>} lpMsgList > [in] A pointer to an array of [ENTRYLIST](entrylist.md) structures that identify the message or messages that have read flags to set or clear. If  _lpMsgList_ is set to NULL, the read flags for all the folder's messages are set or cleared.
     * @param {Pointer} ulUIParam > [in] A handle to the parent window of the progress indicator. The  _ulUIParam_ parameter is ignored unless the MESSAGE_DIALOG flag is set in the _ulFlags_ parameter.
     * @param {IMAPIProgress} lpProgress > [in] A pointer to a progress object that displays a progress indicator. If NULL is passed in  _lpProgress_, the message store provider displays a progress indicator by using MAPI's implementation. The  _lpProgress_ parameter is ignored unless the MESSAGE_DIALOG flag is set in  _ulFlags_.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls the setting of a message's read flag and the processing of read reports. The following flags can be set:
     *     
     *   - CLEAR_READ_FLAG: The MSGFLAG_READ flag should be cleared in **PR_MESSAGE_FLAGS** and a read report should not be sent. 
     *         
     *   - CLEAR_NRN_PENDING: The MSGFLAG_NRN_PENDING flag should be cleared in **PR_MESSAGE_FLAGS** and an unread report should not be sent. 
     *         
     *   - CLEAR_RN_PENDING: The MSGFLAG_RN_PENDING flag should be cleared in **PR_MESSAGE_FLAGS** and a read report should not be sent. 
     *         
     *   - GENERATE_RECEIPT_ONLY: A read report should be sent if one is pending, but there should be no change in the state of the MSGFLAG_READ flag.
     *         
     *   - MAPI_DEFERRED_ERRORS: Allows **SetReadFlags** to return successfully, possibly before the operation has completed. 
     *         
     *   - MESSAGE_DIALOG: Displays a progress indicator while the operation proceeds.
     *     
     *   - SUPPRESS_RECEIPT: A pending read report should be canceled if a read report had been requested and this call changes the state of the message from unread to read. If this call does not change the state of the message, the message store provider can ignore this flag.
     * @returns {HRESULT} S_OK 
     *   
     * > The read flag for the specified message or messages was successfully set or cleared.
     *     
     * MAPI_E_NO_SUPPRESS 
     *   
     * > The message store provider does not support the suppression of read reports.
     *     
     * MAPI_E_INVALID_PARAMETER 
     *   
     * > One of the following incompatible combinations of flags is set in the _ulFlags_ parameter: 
     *     
     *    - SUPPRESS_RECEIPT | CLEAR_READ_FLAG 
     *     
     *    - SUPPRESS_RECEIPT | CLEAR_READ_FLAG | GENERATE_RECEIPT_ONLY
     *     
     *    - CLEAR_READ_FLAG | GENERATE_RECEIPT_ONLY
     *     
     * MAPI_W_PARTIAL_COMPLETION 
     *   
     * > The call succeeded, but not all of the messages were successfully processed. When this warning is returned, the call should be handled as successful. To test for this warning, use the **HR_FAILED** macro. For more information, see [Using Macros for Error Handling](using-macros-for-error-handling.md).
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-setreadflags
     */
    SetReadFlags(lpMsgList, ulUIParam, lpProgress, ulFlags) {
        result := ComCall(25, this, "ptr", lpMsgList, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * IMAPIFolderGetMessageStatus obtains the status associated with a message in a particular folder (for example, whether that message is marked for deletion).
     * @remarks
     * The **IMAPIFolder::GetMessageStatus** method returns the status of a message. Message status is stored in the message's **PR_MSG_STATUS** ([PidTagMessageStatus](pidtagmessagestatus-canonical-property.md)) property.
     * @param {Integer} cbEntryID > [in] The byte count in the entry identifier pointed to by the  _lpEntryID_ parameter.
     * @param {Pointer} lpEntryID > [in] A pointer to the entry identifier for the message whose status is obtained.
     * @param {Integer} ulFlags > [in] Reserved; must be zero.
     * @returns {Integer} > [out] A pointer to a pointer to a bitmask of flags that indicate the message's status. Bits 0 through 15 are reserved and must be zero; bits 16 through 31 are available for implementation-specific use. The following flags can be set:
     *     
     * MSGSTATUS_DELMARKED 
     *   
     * > The message has been marked for deletion.
     *     
     * MSGSTATUS_HIDDEN 
     *   
     * > The message is not to be displayed. 
     *     
     * MSGSTATUS_HIGHLIGHTED 
     *   
     * > The message is to be displayed highlighted.
     *     
     * MSGSTATUS_REMOTE_DELETE 
     *   
     * > The message has been marked for deletion at the remote message store without downloading to the local client.
     *     
     * MSGSTATUS_REMOTE_DOWNLOAD 
     *   
     * > The message has been marked for downloading from the remote message store to the local client.
     *     
     * MSGSTATUS_TAGGED 
     *   
     * > The message has been tagged for a client-defined purpose.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-getmessagestatus
     */
    GetMessageStatus(cbEntryID, lpEntryID, ulFlags) {
        result := ComCall(26, this, "uint", cbEntryID, "ptr", lpEntryID, "uint", ulFlags, "uint*", &lpulMessageStatus := 0, "HRESULT")
        return lpulMessageStatus
    }

    /**
     * 
     * @remarks
     * The **IMAPIFolder::SetMessageStatus** method sets the message status to the value that is stored in its **PR_MSG_STATUS** ([PidTagMessageStatus](pidtagmessagestatus-canonical-property.md)) property.
     * @param {Integer} cbEntryID > [in] The byte count in the entry identifier pointed to by the  _lpEntryID_ parameter.
     * @param {Pointer} lpEntryID > [in] A pointer to the entry identifier for the message whose status is set.
     * @param {Integer} ulNewStatus > [in] The new status to be assigned.
     * @param {Integer} ulNewStatusMask > [in] A bitmask of flags that is applied to the new status and indicates the flags to be set. The following flags can be set:
     *     
     * MSGSTATUS_DELMARKED 
     *   
     * > The message has been marked for deletion.
     *     
     * MSGSTATUS_HIDDEN 
     *   
     * > The message is not to be displayed.
     *     
     * MSGSTATUS_HIGHLIGHTED 
     *   
     * > The message is to be displayed highlighted.
     *     
     * MSGSTATUS_REMOTE_DELETE 
     *   
     * > The message has been marked for deletion at the remote message store without downloading to the local client.
     *     
     * MSGSTATUS_REMOTE_DOWNLOAD 
     *   
     * > The message has been marked for downloading from the remote message store to the local client.
     *     
     * MSGSTATUS_TAGGED 
     *   
     * > The message has been tagged for a client-defined purpose.
     * @returns {Integer} > [out] A pointer to the previous status of the message.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-setmessagestatus
     */
    SetMessageStatus(cbEntryID, lpEntryID, ulNewStatus, ulNewStatusMask) {
        result := ComCall(27, this, "uint", cbEntryID, "ptr", lpEntryID, "uint", ulNewStatus, "uint", ulNewStatusMask, "uint*", &lpulOldStatus := 0, "HRESULT")
        return lpulOldStatus
    }

    /**
     * 
     * @remarks
     * The **IMAPIFolder::SaveContentsSort** method establishes a default sort order for a folder's contents table. That is, when a client calls the folder's [IMAPIContainer::GetContentsTable](imapicontainer-getcontentstable.md) method after the code calls **SaveContentsSort**, the rows in the returned contents table will appear in the order established by **SaveContentsSort**.
     *   
     * Not all message store providers support **SaveContentsSort**; it is acceptable for message store providers to return MAPI_E_NO_SUPPORT from the **SaveContentsSort** method.
     * @param {Pointer<SSortOrderSet>} lpSortCriteria > [in] A pointer to an [SSortOrderSet](ssortorderset.md) structure that contains the default sort order.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls how the default sort order is set. The following flag can be set:
     *     
     * RECURSIVE_SORT 
     *   
     * > The default sort order set applies to the indicated folder and to all its subfolders.
     * @returns {HRESULT} S_OK 
     *   
     * > The sort order was successfully saved.
     *     
     * MAPI_E_NO_SUPPORT 
     *   
     * > The message store provider does not support saving a sort order for its folder contents tables.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-savecontentssort
     */
    SaveContentsSort(lpSortCriteria, ulFlags) {
        result := ComCall(28, this, "ptr", lpSortCriteria, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * IMAPIFolderEmptyFolder deletes all messages and subfolders from a folder without deleting the folder itself.
     * @remarks
     * The **IMAPIFolder::EmptyFolder** method deletes all of a folder's contents without deleting the folder itself. 
     *   
     * During an **EmptyFolder** call, submitted messages are not deleted. 
     *   
     * A folder's associated contents include messages that are used to describe views, rules, custom forms, and custom solution storage, and can also include form definitions.
     * @param {Pointer} ulUIParam > [in] A handle to the parent window of the progress indicator. The  _ulUIParam_ parameter is ignored unless the FOLDER_DIALOG flag is set in the _ulFlags_ parameter.
     * @param {IMAPIProgress} lpProgress > [in] A pointer to a progress object that displays a progress indicator. If NULL is passed in  _lpProgress_, the message store provider displays a progress indicator by using the MAPI progress object implementation. The  _lpProgress_ parameter is ignored unless the FOLDER_DIALOG flag is set in the _ulFlags_ parameter.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls how the folder is emptied. The following flags can be set:
     *     
     * DEL_ASSOCIATED 
     *   
     * > Deletes all subfolders, including subfolders that contain messages with associated content. The DEL_ASSOCIATED flag has meaning only for the top-level folder the call acts on.
     *     
     * DELETE_HARD_DELETE
     *   
     * > Permanently removes all messages, including soft-deleted ones.
     *     
     * FOLDER_DIALOG 
     *   
     * > Displays a progress indicator while the operation proceeds.
     * @returns {HRESULT} S_OK 
     *   
     * > The folder was successfully emptied.
     *     
     * MAPI_W_PARTIAL_COMPLETION 
     *   
     * > The call succeeded, but the folder was not completely emptied. When this warning is returned, the call should be handled as successful. To test for this warning, use the **HR_FAILED** macro. For more information, see [Using Macros for Error Handling](using-macros-for-error-handling.md).
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-emptyfolder
     */
    EmptyFolder(ulUIParam, lpProgress, ulFlags) {
        result := ComCall(29, this, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "HRESULT")
        return result
    }
}
