#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMAPITable.ahk
#Include .\IAttach.ahk
#Include .\IMAPIProp.ahk

/**
 * Manages messages, attachments, and recipients. Read-only properties are set by the provider when a client calls a message's IMAPIProp::SaveChanges method.
 * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/imessageimapiprop
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMessage extends IMAPIProp{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAttachmentTable", "OpenAttach", "CreateAttach", "DeleteAttach", "GetRecipientTable", "ModifyRecipients", "SubmitMessage", "SetReadFlag"]

    /**
     * 
     * @remarks
     * The **IMessage::GetAttachmentTable** method returns a pointer to the message's attachment table, which includes information about all of the attachments in the message. Clients can get access to an attachment only through the attachment table. By retrieving an attachment's number its **PR_ATTACH_NUM** ([PidTagAttachNumber](pidtagattachnumber-canonical-property.md)) property a client can use several of the **IMessage** methods to work with the attachment. 
     *   
     * There is one row for each attachment. For a complete list of the columns in an attachment table, see [Attachment Tables](attachment-tables.md).
     *   
     * An attachment usually does not appear in the attachment table until both the attachment and the message have been saved with a call to [IMAPIProp::SaveChanges](imapiprop-savechanges.md). Attachment tables are dynamic. If a client creates a new attachment, deletes an existing attachment, or changes one or more properties once the **SaveChanges** calls have been made on the attachment on the message, the attachment table will be updated to reflect the new information. 
     *   
     * Some attachment tables support a wide variety of restrictions; others do not. Support for restrictions depends on the message store provider's implementation. 
     *   
     * When initially opened, attachment tables are not necessarily sorted in any particular order. 
     *   
     * Setting the MAPI_UNICODE flag in the _ulFlags_ parameter affects the following calls to the attachment table: 
     *   
     * - [IMAPITable::QueryColumns](imapitable-querycolumns.md) to retrieve the column set. 
     *     
     * - [IMAPITable::QueryRows](imapitable-queryrows.md) to retrieve rows. 
     *     
     * - [IMAPITable::QuerySortOrder](imapitable-querysortorder.md) to retrieve the sort order. 
     *     
     * Setting the Unicode flag requests that the information for any string columns returned from these calls be in Unicode format. However, because not all message store providers support Unicode, setting this flag is only a request.
     * @param {Integer} ulFlags > [in] Bitmask of flags that relate to the creation of the table. The following flag can be set: 
     *     
     * MAPI_UNICODE 
     *   
     * > The string columns are in Unicode format. If the MAPI_UNICODE flag is not set, the string columns are in ANSI format.
     *     
     * MAPI_DEFERRED_ERRORS 
     *   
     * > Allows **GetAttachmentTable** to return successfully, possibly before the table is fully available to the calling client. If the table is not available, making a subsequent call to it can cause an error.
     * @returns {IMAPITable} > [out] Pointer to a pointer to the attachment table.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/imessage-getattachmenttable
     */
    GetAttachmentTable(ulFlags) {
        result := ComCall(14, this, "uint", ulFlags, "ptr*", &lppTable := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMAPITable(lppTable)
    }

    /**
     * Describes the syntax, parameters, return value, and remarks for IMessage OpenAttach, which opens an attachment.
     * @remarks
     * The **IMessage::OpenAttach** method opens a message's attachment.
     * @param {Integer} ulAttachmentNum > [in] Index number of the attachment to open, as stored in the attachment's **PR_ATTACH_NUM** ([PidTagAttachNumber](pidtagattachnumber-canonical-property.md)) property. This index number uniquely identifies the attachment in the message and is valid only in the context of the message.
     * @param {Pointer<Guid>} lpInterface > [in] Pointer to the interface identifier (IID) representing the interface to be used to access the attachment. Passing NULL results in the attachment's standard interface, or **IAttach**, being returned.
     * @param {Integer} ulFlags > [in] Bitmask of flags that controls how the attachment is opened. The following flags can be set:
     * 
     * MAPI_BEST_ACCESS
     *  
     * > Requests that the attachment be opened with the maximum network permissions allowed for the user and the maximum client application access. For example, if the client has read/write permission, the attachment should be opened with read/write permission; if the client has read-only access, the attachment should be opened with read-only access.
     * 
     * MAPI_DEFERRED_ERRORS
     *  
     * > Allows **OpenAttach** to return successfully, possibly before the attachment is fully available to the calling client. If the attachment is not available, making a subsequent call to it can cause an error.
     * 
     * MAPI_MODIFY
     *  
     * > Requests read/write permission. By default, attachments are opened with read-only access, and clients should not work on the assumption that read/write permission has been granted.
     * @returns {IAttach} > [out] Pointer to a pointer to the open attachment.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/imessage-openattach
     */
    OpenAttach(ulAttachmentNum, lpInterface, ulFlags) {
        result := ComCall(15, this, "uint", ulAttachmentNum, "ptr", lpInterface, "uint", ulFlags, "ptr*", &lppAttach := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAttach(lppAttach)
    }

    /**
     * 
     * @remarks
     * The **IMessage::CreateAttach** method creates a new attachment on a message. The new attachment and any properties that are set for it, are not available until a client has called both the attachment's [IMAPIProp::SaveChanges](imapiprop-savechanges.md) method and the message's **IMAPIProp::SaveChanges** method. 
     *   
     * The attachment number pointed to by  _lpulAttachmentNum_ is unique and valid only within the context of the message. That is, two attachments in two different messages can have the same number while two attachments in the same message cannot.
     * @param {Pointer<Guid>} lpInterface > [in] Pointer to the interface identifier (IID) representing the interface to be used to access the message. Passing NULL results in the message's standard interface, or **IMessage**, being returned.
     * @param {Integer} ulFlags > [in] Bitmask of flags that controls how the attachment is created. The following flag can be set:
     *     
     * MAPI_DEFERRED_ERRORS 
     *   
     * > Allows **CreateAttach** to return successfully, possibly before the attachment is fully accessible to the calling client. If the attachment is not accessible, making a subsequent call to it can result in an error.
     * @param {Pointer<Integer>} lpulAttachmentNum > [out] Pointer to an index number identifying the newly created attachment. This number is valid only when the message is open and is the basis for the attachment's **PR_ATTACH_NUM** ([PidTagAttachNumber](pidtagattachnumber-canonical-property.md)) property.
     * @param {Pointer<IAttach>} lppAttach > [out] Pointer to a pointer to the open attachment object.
     * @returns {HRESULT} S_OK 
     *   
     * > The attachment was successfully created.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/imessage-createattach
     */
    CreateAttach(lpInterface, ulFlags, lpulAttachmentNum, lppAttach) {
        lpulAttachmentNumMarshal := lpulAttachmentNum is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "ptr", lpInterface, "uint", ulFlags, lpulAttachmentNumMarshal, lpulAttachmentNum, "ptr*", lppAttach, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Describes the syntax, parameters, return value, and remarks for IMessageDeleteAttach, which deletes an attachment.
     * @remarks
     * The **IMessage::DeleteAttach** method deletes an attachment from within a message. 
     *   
     * A deleted attachment is not permanently deleted until the message's [IMAPIProp::SaveChanges](imapiprop-savechanges.md) method has been called.
     * @param {Integer} ulAttachmentNum > [in] Index number of the attachment to delete. This is the value for the attachment's **PR_ATTACH_NUM** ([PidTagAttachNumber](pidtagattachnumber-canonical-property.md)) property.
     * @param {Pointer} ulUIParam > [in] Handle to the parent window of any dialog boxes or windows this method displays. The  _ulUIParam_ parameter is ignored unless the ATTACH_DIALOG flag is set in the _ulFlags_ parameter.
     * @param {IMAPIProgress} lpProgress > [in] Pointer to a progress object that displays a progress indicator. If NULL is passed in  _lpProgress_, the message store provider displays a progress indicator using the MAPI progress object implementation. The  _lpProgress_ parameter is ignored unless the ATTACH_DIALOG flag is set in  _ulFlags_.
     * @param {Integer} ulFlags > [in] Bitmask of flags that controls the display of a user interface. The following flag can be set:
     *     
     * ATTACH_DIALOG 
     *   
     * > Requests the display of a progress indicator as the operation proceeds.
     * @returns {HRESULT} S_OK 
     *   
     * > The attachment was successfully deleted.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/imessage-deleteattach
     */
    DeleteAttach(ulAttachmentNum, ulUIParam, lpProgress, ulFlags) {
        result := ComCall(17, this, "uint", ulAttachmentNum, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @remarks
     * The **IMessage::GetRecipientTable** method returns a pointer to the message's recipient table, which includes information about all of the recipients for the message. There is one row for every recipient. 
     *   
     * Recipient tables have a different column set depending on whether the message has been submitted. For a complete list of the columns in a recipient table, see [Recipient Tables](recipient-tables.md).
     *   
     * Some recipient tables support a wide variety of restrictions; others do not. Support for restrictions depends on the message store provider's implementation. 
     *   
     * Setting the MAPI_UNICODE flag in the _ulFlags_ parameter affects the following calls to the recipient table: 
     *   
     * - [IMAPITable::QueryColumns](imapitable-querycolumns.md) to retrieve the column set. 
     *     
     * - [IMAPITable::QueryRows](imapitable-queryrows.md) to retrieve rows. 
     *     
     * - [IMAPITable::QuerySortOrder](imapitable-querysortorder.md) to retrieve the sort order. 
     *     
     * Setting the Unicode flag requests that the information for any string columns returned from these calls be in Unicode format. However, because not all message store providers support Unicode, setting this flag is only a request.
     * @param {Integer} ulFlags > [in] Bitmask of flags that controls the return of the table. The following flags can be set:
     *     
     * MAPI_DEFERRED_ERRORS 
     *   
     * > Allows **GetRecipientTable** to return successfully, possibly before the table is fully available to the calling client. If the table is not available, making a subsequent call to it can cause an error. 
     *     
     * MAPI_UNICODE 
     *   
     * > String columns should be in Unicode format. If the MAPI_UNICODE flag is not set, the string columns should be in ANSI format.
     * @returns {IMAPITable} > [out] Pointer to a pointer to the recipient table.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/imessage-getrecipienttable
     */
    GetRecipientTable(ulFlags) {
        result := ComCall(18, this, "uint", ulFlags, "ptr*", &lppTable := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMAPITable(lppTable)
    }

    /**
     * 
     * @remarks
     * The **IMessage::ModifyRecipients** method changes the message's recipient list. It is from this list, held in an [ADRLIST](adrlist.md) structure, that the recipient table is built. 
     *   
     * The **ADRLIST** structure contains one [ADRENTRY](adrentry.md) structure for each recipient and each **ADRENTRY** structure contains an array of property values describing the recipient properties. 
     *   
     * Recipients in the **ADRLIST** structure can be resolved or unresolved. The difference is in the number and type of properties that are included. An unresolved recipient contains only the **PR_DISPLAY_NAME** ([PidTagDisplayName](pidtagdisplayname-canonical-property.md)) and **PR_RECIPIENT_TYPE** ([PidTagRecipientType](pidtagrecipienttype-canonical-property.md)) properties while a resolved recipient contains those two properties plus **PR_ADDRTYPE** ([PidTagAddressType](pidtagaddresstype-canonical-property.md)) and **PR_ENTRYID** ([PidTagEntryId](pidtagentryid-canonical-property.md)). If **PR_EMAIL_ADDRESS** ([PidTagEmailAddress](pidtagemailaddress-canonical-property.md)) is available, it can be included also.
     *   
     * By the time a message is submitted, it must include only resolved recipients in its recipient list. Unresolved recipients cause nondelivery reports to be created and sent to the original sender of the message. For more information about the name resolution process from the client perspective, see [Resolving a Name](resolving-a-recipient-name.md). For more information from the perspective of the address book provider, see [Implementing Name Resolution](implementing-name-resolution.md).
     *   
     * In addition to resolved and unresolved recipients, a recipient can be NULL. The **cValues** member of the **ADRENTRY** structure for the recipient is set to zero and the **rgPropVals** member is set to NULL.
     * @param {Integer} ulFlags > [in] Bitmask of flags that controls the recipient changes. If zero is passed for the  _ulFlags_ parameter, **ModifyRecipients** replaces all existing recipients with the recipient list pointed to by the  _lpMods_ parameter. The following flags can be set for  _ulFlags_:
     *     
     * MODRECIP_ADD 
     *   
     * > The recipients pointed to by the  _lpMods_ parameter should be added to the recipient list. 
     *     
     * MODRECIP_MODIFY 
     *   
     * > The recipients pointed to by the  _lpMods_ parameter should replace existing recipients. All of the existing properties are replaced by those in the corresponding [ADRENTRY](adrentry.md) structure. 
     *     
     * MODRECIP_REMOVE 
     *   
     * > Existing recipients should be removed from the recipient list using as an index the **PR_ROWID** ([PidTagRowid](pidtagrowid-canonical-property.md)) property included in the property value array of each recipient entry in the _lpMods_ parameter.
     * @param {Pointer<ADRLIST>} lpMods > [in] Pointer to an [ADRLIST](adrlist.md) structure that contains a list of recipients to be added, deleted, or modified in the message.
     * @returns {HRESULT} S_OK 
     *   
     * > The recipient list was successfully modified.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/imessage-modifyrecipients
     */
    ModifyRecipients(ulFlags, lpMods) {
        result := ComCall(19, this, "uint", ulFlags, "ptr", lpMods, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * IMessageSubmitMessage saves all of the message's properties and marks the message as ready to be sent.
     * @remarks
     * The **IMessage::SubmitMessage** method marks a message as ready to be transmitted. MAPI passes messages to the underlying messaging system in the order in which they are marked for sending. Because of this functionality, a message might stay in a message store for some time before the underlying messaging system can take responsibility for it. The order of receipt at the destination is in the underlying messaging system's control and does not necessarily match the order in which messages were sent.
     * @param {Integer} ulFlags > [in] Bitmask of flags used to control how a message is submitted. The following flag can be set:
     *     
     * FORCE_SUBMIT 
     *   
     * > MAPI should submit the message immediately. This flag is not currently in use.
     * @returns {HRESULT} S_OK 
     *   
     * > The call succeeded and has returned the expected value or values.
     *     
     * MAPI_E_NO_RECIPIENTS 
     *   
     * > The message's recipient table is empty.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/imessage-submitmessage
     */
    SubmitMessage(ulFlags) {
        result := ComCall(20, this, "uint", ulFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * IMessageSetReadFlag sets or clears the MSGFLAG_READ flag in the PR_MESSAGE_FLAGS property of the message and manages the sending of read reports.
     * @remarks
     * The **IMessage::SetReadFlag** method sets or clears the message's MSGFLAG_READ flag in the **PR_MESSAGE_FLAGS** property and calls [IMAPIProp::SaveChanges](imapiprop-savechanges.md) to save the message. Setting the MSGFLAG_READ flag marks a message as having been read, which does not necessarily indicate that the intended recipient has actually read the message. 
     *   
     * **SetReadFlags** also manages the sending of read reports. A read report is sent only if the sender has requested one. 
     *   
     * The read flag cannot be altered for:
     *   
     * - Messages that do not exist.
     *     
     * - Messages that have been moved elsewhere.
     *     
     * - Messages that are open with read/write permission.
     *     
     * - Messages that are currently submitted.
     * @param {Integer} ulFlags > [in] Bitmask of flags that controls the setting of a message's read flag that is, the message's MSGFLAG_READ flag in its **PR_MESSAGE_FLAGS** property and the processing of read reports. The following flags can be set: 
     *     
     *   - CLEAR_READ_FLAG: The MSGFLAG_READ flag should be cleared in **PR_MESSAGE_FLAGS** and no read report should be sent. 
     *       
     *   - CLEAR_NRN_PENDING: The MSGFLAG_NRN_PENDING flag should be cleared in **PR_MESSAGE_FLAGS** and a non-read report should not be sent. 
     *       
     *   - CLEAR_RN_PENDING: The MSGFLAG_RN_PENDING flag should be cleared in **PR_MESSAGE_FLAGS** and no read report should be sent. 
     *       
     *   - GENERATE_RECEIPT_ONLY: A read report should be sent if one is pending, but there should be no change in the state of the MSGFLAG_READ flag.
     *       
     *   - MAPI_DEFERRED_ERRORS: Allows **SetReadFlag** to return successfully, possibly before the operation has completed. 
     *       
     *   - SUPPRESS_RECEIPT: A pending read report should be canceled if a read report had been requested and this call changes the state of the message from unread to read. If this call does not change the state of the message, the message store provider can ignore this flag.
     * @returns {HRESULT} S_OK 
     *   
     * > The message's read flag has been successfully set or cleared.
     *     
     * MAPI_E_NO_SUPPRESS 
     *   
     * > The message store provider does not support the suppression of read reports.
     *     
     * MAPI_E_INVALID_PARAMETER 
     *   
     * > One of the following combinations of flags is set in the _ulFlags_ parameter: 
     *     
     *    - SUPPRESS_RECEIPT | CLEAR_READ_FLAG 
     *     
     *    - SUPPRESS_RECEIPT | CLEAR_READ_FLAG | GENERATE_RECEIPT_ONLY
     *     
     *    - CLEAR_READ_FLAG | GENERATE_RECEIPT_ONLY
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/imessage-setreadflag
     */
    SetReadFlag(ulFlags) {
        result := ComCall(21, this, "uint", ulFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
