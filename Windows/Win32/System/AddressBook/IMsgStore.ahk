#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMAPITable.ahk
#Include .\IMAPIProp.ahk

/**
 * Describes the properties and vtable order of members for IMsgStore IMAPIProp, which provides access to message store information and to messages and folders.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstoreimapiprop
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMsgStore extends IMAPIProp{

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
    static VTableNames => ["Advise", "Unadvise", "CompareEntryIDs", "OpenEntry", "SetReceiveFolder", "GetReceiveFolder", "GetReceiveFolderTable", "StoreLogoff", "AbortSubmit", "GetOutgoingQueue", "SetLockState", "FinishedMsg", "NotifyNewMail"]

    /**
     * IMsgStore Advise registers to receive notification of specified events that affect the message store.
     * @remarks
     * The **IMsgStore::Advise** method establishes a connection between the caller's advise sink object and either the message store or an object in the message store. This connection is used to send notifications to the advise sink when one or more events, as specified in the _ulEventMask_ parameter, occur to the advise source object. When the  _lpEntryID_ parameter points to a valid entry identifier, the advise source is the object identified by this entry identifier. When  _lpEntryID_ is NULL, the advise source is the message store. 
     *   
     * To send a notification, either the message store provider or MAPI calls the registered advise sink's [IMAPIAdviseSink::OnNotify](imapiadvisesink-onnotify.md) method. One of the parameters to **OnNotify**, a notification structure, contains information that describes the specific event.
     * @param {Integer} cbEntryID > [in] The byte count in the entry identifier pointed to by the  _lpEntryID_ parameter.
     * @param {Pointer} lpEntryID > [in] A pointer to the entry identifier of the folder or message about which notifications should be generated, or **null**. If  _lpEntryID_ is set to NULL, **Advise** registers for notifications on the entire message store.
     * @param {Integer} ulEventMask > [in] A mask of values that indicate the types of notification events that the caller is interested in and should be included in the registration. There is a corresponding [NOTIFICATION](notification.md) structure associated with each type of event that holds information about the event. The following are valid values for the  _ulEventMask_ parameter:
     * @param {IMAPIAdviseSink} lpAdviseSink > [in] A pointer to an advise sink object to receive the subsequent notifications. This advise sink object must have already been allocated.
     * @returns {Integer} > [out] A pointer to a nonzero number that represents the connection between the caller's advise sink object and the session.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-advise
     */
    Advise(cbEntryID, lpEntryID, ulEventMask, lpAdviseSink) {
        result := ComCall(14, this, "uint", cbEntryID, "ptr", lpEntryID, "uint", ulEventMask, "ptr", lpAdviseSink, "uint*", &lpulConnection := 0, "HRESULT")
        return lpulConnection
    }

    /**
     * 
     * @remarks
     * The **IMsgStore::Unadvise** method cancels a registration for notification. **Unadvise** releases its pointer to the caller's advise sink, which it received in the **Advise** call used for registration. 
     *   
     * Generally, **Unadvise** calls the advise sink's [IUnknown::Release](https://msdn.microsoft.com/library/ms682317%28v=VS.85%29.aspx) method during the **Unadvise** call. However, if another thread is in the process of calling the advise sink's [IMAPIAdviseSink::OnNotify](imapiadvisesink-onnotify.md) method, the **Release** call is delayed until the **OnNotify** method returns.
     * @param {Integer} ulConnection > [in] The connection number associated with an active notification registration. The value of  _ulConnection_ must have been returned by a previous call to the **IMsgStore::Advise** method.
     * @returns {HRESULT} S_OK 
     *   
     * > The registration was successfully canceled.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-unadvise
     */
    Unadvise(ulConnection) {
        result := ComCall(15, this, "uint", ulConnection, "HRESULT")
        return result
    }

    /**
     * IMsgStore CompareEntryIDs compares two entry identifiers to determine whether they refer to the same entry in a message store.
     * @remarks
     * The **IMsgStore::CompareEntryIDs** method compares two entry identifiers that belong to the message store to determine whether they refer to the same object.
     * @param {Integer} cbEntryID1 > [in] The byte count in the entry identifier pointed to by the  _lpEntryID1_ parameter  _._
     * @param {Pointer} lpEntryID1 > [in] A pointer to the first entry identifier to be compared.
     * @param {Integer} cbEntryID2 > [in] The byte count in the entry identifier pointed to by the  _lpEntryID2_ parameter  _._
     * @param {Pointer} lpEntryID2 > [in] A pointer to the second entry identifier to be compared.
     * @param {Integer} ulFlags > [in] Reserved; must be zero.
     * @returns {Integer} > [out] A pointer to the result of the comparison. TRUE if the two entry identifiers refer to the same object; otherwise, FALSE.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-compareentryids
     */
    CompareEntryIDs(cbEntryID1, lpEntryID1, cbEntryID2, lpEntryID2, ulFlags) {
        result := ComCall(16, this, "uint", cbEntryID1, "ptr", lpEntryID1, "uint", cbEntryID2, "ptr", lpEntryID2, "uint", ulFlags, "uint*", &lpulResult := 0, "HRESULT")
        return lpulResult
    }

    /**
     * IMsgStoreOpenEntry opens a folder or message and returns an interface pointer for further access.
     * @remarks
     * The **IMsgStore::OpenEntry** method opens a folder or message and returns a pointer to an interface that can be used for further access. 
     *   
     * > [!IMPORTANT]
     * > When opening folder entries on a public store, such as folders and messages, use **IMsgStore::OpenEntry** instead of [IMAPISession::OpenEntry](imapisession-openentry.md). This ensures that public folders function correctly when multiple Exchange accounts are defined in a profile.
     * @param {Integer} cbEntryID > [in] The byte count in the entry identifier pointed to by the  _lpEntryID_ parameter  _._
     * @param {Pointer} lpEntryID > [in] A pointer to the entry identifier of the object to open, or NULL. If  _lpEntryID_ is set to NULL, **OpenEntry** opens the root folder for the message store.
     * @param {Pointer<Guid>} lpInterface > [in] A pointer to the interface identifier (IID) that represents the interface to be used to access the opened object. Passing NULL results in the object's standard interface ([IMAPIFolder](imapifolderimapicontainer.md) for folders and [IMessage](imessageimapiprop.md) for messages) being returned.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls how the object is opened. The following flags can be used:
     *     
     * MAPI_BEST_ACCESS 
     *   
     * > Requests that the object be opened by using the maximum network permissions allowed for the user and the maximum client application access. For example, if the client has read/write permission, the object should be opened by using read/write permission; if the client has read-only permission, the object should be opened by using read-only permission. 
     *     
     * MAPI_DEFERRED_ERRORS 
     *   
     * > Allows **OpenEntry** to return successfully, possibly before the object is fully available to the calling client. If the object is not available, making a subsequent object call can raise an error. 
     *     
     * MAPI_MODIFY 
     *   
     * > Requests read/write permission. By default, objects are opened with read-only permission, and clients should not work on the assumption that read/write permission is granted.
     * @param {Pointer<Integer>} lpulObjType > [out] A pointer to the type of the opened object.
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} S_OK 
     *   
     * > The call succeeded and has returned the expected value or values.
     *     
     * MAPI_E_NO_ACCESS 
     *   
     * > An attempt was made to modify a read-only object or to access an object for which the user has insufficient permissions.
     *     
     * MAPI_NO_CACHE
     *   
     * > When a store is opened in cached mode, a client or service provider can call **IMsgStore::OpenEntry**, setting the MAPI_NO_CACHE flag to open an item or a folder on the remote store. If you open the message store with the MDB_ONLINE flag on the remote server, you do not have to use the MAPI_NO_CACHE flag.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-openentry
     */
    OpenEntry(cbEntryID, lpEntryID, lpInterface, ulFlags, lpulObjType, ppUnk) {
        lpulObjTypeMarshal := lpulObjType is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, "uint", cbEntryID, "ptr", lpEntryID, "ptr", lpInterface, "uint", ulFlags, lpulObjTypeMarshal, lpulObjType, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * IMsgStore SetReceiveFolder establishes a folder as the destination for incoming messages of a particular message class.
     * @remarks
     * The **IMsgStore::SetReceiveFolder** method sets or changes the receive folder for a particular message class. With **SetReceiveFolder**, a client can, by using successive calls, specify a different receive folder for each defined message class or specify that incoming messages for multiple message classes all go to the same folder. For example, a client can have its own class of messages arrive in its own folder. A fax application can designate one folder in which the store provider puts incoming faxes and another folder in which the provider puts outgoing faxes.
     *   
     * If an error occurs during the call to **SetReceiveFolder**, the receive folder setting remains unchanged. 
     *   
     * If **SetReceiveFolder** changes the receive folder setting with  _lpEntryID_ set to NULL, indicating that the default receive folder should be set, **SetReceiveFolder** returns S_OK even if there was no existing setting for the indicated message class.
     * @param {Pointer<Integer>} lpszMessageClass > [in] A pointer to the message class that is to be associated with the new receive folder. If the  _lpszMessageClass_ parameter is set to NULL or an empty string, **SetReceiveFolder** sets the default receive folder for the message store.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls the type of the text in the passed-in strings. The following flag can be set:
     *     
     * MAPI_UNICODE 
     *   
     * > The message class string is in Unicode format. If the MAPI_UNICODE flag is not set, the message class string is in ANSI format.
     * @param {Integer} cbEntryID > [in] The byte count in the entry identifier pointed to by the  _lpEntryID_ parameter.
     * @param {Pointer} lpEntryID > [in] A pointer to the entry identifier of the folder to establish as the receive folder. If the  _lpEntryID_ parameter is set to NULL, **SetReceiveFolder** replaces the current receive folder with the message store's default.
     * @returns {HRESULT} S_OK 
     *   
     * > A receive folder was successfully established.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-setreceivefolder
     */
    SetReceiveFolder(lpszMessageClass, ulFlags, cbEntryID, lpEntryID) {
        lpszMessageClassMarshal := lpszMessageClass is VarRef ? "char*" : "ptr"

        result := ComCall(18, this, lpszMessageClassMarshal, lpszMessageClass, "uint", ulFlags, "uint", cbEntryID, "ptr", lpEntryID, "HRESULT")
        return result
    }

    /**
     * IMsgStore GetReceiveFolder obtains the folder that was established as the destination for incoming messages of a specified message class.
     * @remarks
     * The **IMsgStore::GetReceiveFolder** method obtains the entry identifier of a receive folder, a folder designated to receive incoming messages of a particular message class. Callers can specify a message class or NULL in the _lpszMessageClass_ parameter. If _lpszMessageClass_ is NULL, **GetReceiveFolder** returns the following values:
     *   
     * - In _lppszExplicitClass_, the name of the first base class of the message class pointed to by _lpszMessageClass_ that does explicitly set a receive folder.
     * 
     * - In _lppEntryID_, the entry identifier of the receive folder for the base class pointed to by the _lppszExplicitClass_ parameter.
     * 
     * For example, suppose the receive folder of the message class **IPM.Note** has been set to the entry identifier of the Inbox and **GetReceiveFolder** is called with the contents of _lpszMessageClass_ set to **IPM.Note.Phone**. If **IPM.Note.Phone** does not have an explicit receive folder set, **GetReceiveFolder** returns the entry identifier of the Inbox in _lppEntryID_ and **IPM.Note** in _lppszExplicitClass_.
     *   
     * If the client calls **GetReceiveFolder** for a message class and has not set a receive folder for that message class, _lppszExplicitClass_ is either a zero-length string, a string in Unicode format, or a string in ANSI format depending on whether the client set the MAPI_UNICODE flag in the _ulFlags_ parameter.
     *   
     * A default receive folder, obtained by passing NULL in the _lpszMessageClass_ parameter, always exists for every message store.
     *   
     * A client should call the [MAPIFreeBuffer](mapifreebuffer.md) function when it is done with the entry identifier returned in _lppEntryID_ to free the memory that holds that entry identifier. It should also call **MAPIFreeBuffer** when it is done with the message class string returned in _lppszExplicitClass_ to free the memory that holds that string.
     * @param {Pointer<Integer>} lpszMessageClass > [in] A pointer to a message class that is associated with a receive folder. If the _lpszMessageClass_ parameter is set to NULL or an empty string, **GetReceiveFolder** returns the default receive folder for the message store.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls the type of the passed-in and returned strings. The following flag can be set:
     * 
     * MAPI_UNICODE
     *   
     * > The message class string is in Unicode format. If the MAPI_UNICODE flag is not set, the message class string is in ANSI format.
     * @param {Pointer<Integer>} lpcbEntryID > [out] A pointer to the byte count in the entry identifier pointed to by the _lppEntryID_ parameter.
     * @param {Pointer<Pointer<ENTRYID>>} lppEntryID > [out] A pointer to a pointer to the entry identifier for the requested receive folder.
     * @param {Pointer<Pointer<Integer>>} lppszExplicitClass > [out] A pointer to a pointer to the message class that explicitly sets as its receive folder the folder pointed to by _lppEntryID_. This message class should either be the same as the class in the _lpszMessageClass_ parameter, or a base class of that class. Passing NULL indicates that the folder pointed to by _lppEntryID_ is the default receive folder for the message store.
     * @returns {HRESULT} S_OK
     *   
     * > The receive folder was successfully returned.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-getreceivefolder
     */
    GetReceiveFolder(lpszMessageClass, ulFlags, lpcbEntryID, lppEntryID, lppszExplicitClass) {
        lpszMessageClassMarshal := lpszMessageClass is VarRef ? "char*" : "ptr"
        lpcbEntryIDMarshal := lpcbEntryID is VarRef ? "uint*" : "ptr"
        lppEntryIDMarshal := lppEntryID is VarRef ? "ptr*" : "ptr"
        lppszExplicitClassMarshal := lppszExplicitClass is VarRef ? "ptr*" : "ptr"

        result := ComCall(19, this, lpszMessageClassMarshal, lpszMessageClass, "uint", ulFlags, lpcbEntryIDMarshal, lpcbEntryID, lppEntryIDMarshal, lppEntryID, lppszExplicitClassMarshal, lppszExplicitClass, "HRESULT")
        return result
    }

    /**
     * IMsgStore GetReceiveFolderTable provides access to the receive folder table, which includes information about all of the receive folders for the message store.
     * @remarks
     * The **IMsgStore::GetReceiveFolderTable** method provides access to a table that shows the property settings for all of the message store's receive folders.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls table access. The following flags can be set:
     *     
     * MAPI_DEFERRED_ERRORS 
     *   
     * > Allows **GetReceiveFolderTable** to return successfully, possibly before the table is fully available to the caller. If the table is not fully available, making a subsequent table call can raise an error. 
     *     
     * MAPI_UNICODE 
     *   
     * > The returned strings are in Unicode format. If the MAPI_UNICODE flag is not set, the strings are in ANSI format.
     * @returns {IMAPITable} > [out] A pointer to a pointer to the receive folder table.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-getreceivefoldertable
     */
    GetReceiveFolderTable(ulFlags) {
        result := ComCall(20, this, "uint", ulFlags, "ptr*", &lppTable := 0, "HRESULT")
        return IMAPITable(lppTable)
    }

    /**
     * 
     * @remarks
     * The **IMsgStore::StoreLogoff** method exerts control over the interaction of the message store and transport providers during the logoff process. Calling **StoreLogoff** is valid only for message stores that are being used only by the caller. For example, when two clients are using the same message store and one of them calls **StoreLogoff**, the message store is immediately released and control is returned to the calling client.
     * @param {Pointer<Integer>} lpulFlags > [in, out] A bitmask of flags that controls logoff from the message store. On input, all flags set for this parameter are mutually exclusive; a caller must specify only one flag per call. The following flags are valid on input:
     *     
     * LOGOFF_ABORT 
     *   
     * > Any transport provider activity for this message store should be stopped before logoff. Control is returned to the caller after activity is stopped. If any transport provider activity is taking place, the logoff does not occur and no change in the behavior of the MAPI spooler or transport providers occurs. If transport provider activity is idle, the MAPI spooler releases the store. 
     *     
     * LOGOFF_NO_WAIT 
     *   
     * > The message store should not wait for messages from transport providers before closing. Outbound messages that are ready to be sent are sent. If this store contains the default Inbox, any in-process messages are received, and then further reception is disabled. When all activity is complete, the MAPI spooler releases the store, and control is immediately returned to the caller. 
     *     
     * LOGOFF_ORDERLY 
     *   
     * > The message store should not wait for information from transport providers before closing. Messages that are currently being processed are completed, but no new messages are processed. When all activity is complete, the MAPI spooler releases the store, and control is immediately returned to the store provider. 
     *     
     * LOGOFF_PURGE 
     *   
     * > The logoff should work the same as if the LOGOFF_NO_WAIT flag is set, but either the [IXPLogon::FlushQueues](ixplogon-flushqueues.md) or [IMAPIStatus::FlushQueues](imapistatus-flushqueues.md) method for the appropriate transport providers should be called. The LOGOFF_PURGE flag returns control to the caller after completion. 
     *     
     * LOGOFF_QUIET 
     *   
     * > If any transport provider activity is taking place, the logoff should not occur.
     *     
     * The following flags are valid on output
     *     
     * LOGOFF_INBOUND 
     *   
     * > Inbound messages are currently arriving.
     *     
     * LOGOFF_OUTBOUND 
     *   
     * > Outbound messages are in the process of being sent.
     *     
     * LOGOFF_OUTBOUND_QUEUE 
     *   
     * > Outbound messages are pending (that is, they are in the Outbox).
     * @returns {HRESULT} S_OK 
     *   
     * > The logoff completed successfully.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-storelogoff
     */
    StoreLogoff(lpulFlags) {
        lpulFlagsMarshal := lpulFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, lpulFlagsMarshal, lpulFlags, "HRESULT")
        return result
    }

    /**
     * Describes the syntax, parameters, and return value of IMsgStore AbortSubmit, which attempts to remove a message from the outgoing queue.
     * @remarks
     * The **IMsgStore::AbortSubmit** method attempts to remove a submitted message from the message store's outgoing queue.
     * @param {Integer} cbEntryID > [in] The byte count in the entry identifier pointed to by the  _lpEntryID_ parameter.
     * @param {Pointer} lpEntryID > [in] A pointer to the entry identifier of the message to remove from the outgoing queue.
     * @param {Integer} ulFlags > [in] Reserved; must be zero.
     * @returns {HRESULT} S_OK 
     *   
     * > The message was successfully removed from the outgoing queue.
     *     
     * MAPI_E_NOT_IN_QUEUE 
     *   
     * > The message identified by  _lpEntryID_ is no longer in the message store's outgoing queue, typically because it has already been sent. 
     *     
     * MAPI_E_UNABLE_TO_ABORT 
     *   
     * > The message identified by  _lpEntryID_ is locked by the MAPI spooler, and the operation cannot be aborted.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-abortsubmit
     */
    AbortSubmit(cbEntryID, lpEntryID, ulFlags) {
        result := ComCall(22, this, "uint", cbEntryID, "ptr", lpEntryID, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @remarks
     * The **IMsgStore::GetOutgoingQueue** method provides the MAPI spooler with access to the table that shows the message store's queue of outgoing messages. Typically, messages are placed in the outgoing queue table after their [IMessage::SubmitMessage](imessage-submitmessage.md) method is called. However, because the order of submission affects the order of preprocessing and submission to the transport provider, some messages that have been marked for sending might not appear in the outgoing queue table immediately.
     * @param {Integer} ulFlags > [in] Reserved; must be zero.
     * @returns {IMAPITable} > [out] A pointer to a pointer to the outgoing queue table.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-getoutgoingqueue
     */
    GetOutgoingQueue(ulFlags) {
        result := ComCall(23, this, "uint", ulFlags, "ptr*", &lppTable := 0, "HRESULT")
        return IMAPITable(lppTable)
    }

    /**
     * 
     * @remarks
     * The **IMsgStore::SetLockState** method locks or unlocks a message. **SetLockState** can be called only by the MAPI spooler while it is sending the message. 
     *   
     * Usually, when the MAPI spooler calls **SetLockState** to lock a message, it locks only the oldest message (that is, the next message queued for the MAPI spooler to send). If the oldest message in the queue is waiting for a temporarily unavailable transport provider, and the next message in the queue uses a different transport provider, the MAPI spooler can begin processing the later message. It begins processing by locking that message by using **SetLockState**.
     * @param {IMessage} lpMessage > [in] A pointer to the message to lock or unlock.
     * @param {Integer} ulLockState > [in] A value that indicates whether the message should be locked or unlocked. One of the following values is valid:
     *     
     * MSG_LOCKED 
     *   
     * > The message should be locked. 
     *     
     * MSG_UNLOCKED 
     *   
     * > The message should be unlocked.
     * @returns {HRESULT} S_OK 
     *   
     * > The lock state of the message was successfully set.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-setlockstate
     */
    SetLockState(lpMessage, ulLockState) {
        result := ComCall(24, this, "ptr", lpMessage, "uint", ulLockState, "HRESULT")
        return result
    }

    /**
     * IMsgStore FinishedMsg enables the message store provider to perform processing on a sent message. It is called only by the MAPI spooler.
     * @remarks
     * The **IMsgStore::FinishedMsg** method performs processing on a sent message. This processing can involve deleting the message, moving it to a different folder, or both actions. The type of processing depends on whether the **PR_DELETE_AFTER_SUBMIT** ([PidTagDeleteAfterSubmit](pidtagdeleteaftersubmit-canonical-property.md)) and **PR_SENTMAIL_ENTRYID** ([PidTagSentMailEntryId](pidtagsentmailentryid-canonical-property.md)) properties are set.
     * @param {Integer} ulFlags > [in] Reserved; must be zero.
     * @param {Integer} cbEntryID > [in] The byte count in the entry identifier pointed to by the  _lpEntryID_ parameter.
     * @param {Pointer} lpEntryID > [in] A pointer to the entry identifier of the message to be processed.
     * @returns {HRESULT} S_OK 
     *   
     * > Processing on the sent message was successful.
     *     
     * MAPI_E_NO_SUPPORT 
     *   
     * > The message store provider does not support sent message processing. This error value is returned if the caller is not the MAPI spooler.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-finishedmsg
     */
    FinishedMsg(ulFlags, cbEntryID, lpEntryID) {
        result := ComCall(25, this, "uint", ulFlags, "uint", cbEntryID, "ptr", lpEntryID, "HRESULT")
        return result
    }

    /**
     * 
     * @remarks
     * The **IMsgStore::NotifyNewMail** method is called by the MAPI spooler to inform the message store that a message is ready for delivery.
     * @param {Pointer<NOTIFICATION>} lpNotification > [in] A pointer to a [NOTIFICATION](notification.md) structure that describes the new message notification.
     * @returns {HRESULT} S_OK 
     *   
     * > The message store was successfully notified.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-notifynewmail
     */
    NotifyNewMail(lpNotification) {
        result := ComCall(26, this, "ptr", lpNotification, "HRESULT")
        return result
    }
}
