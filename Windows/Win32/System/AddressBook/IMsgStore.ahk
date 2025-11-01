#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMAPIProp.ahk

/**
 * 
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
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer} lpEntryID 
     * @param {Integer} ulEventMask 
     * @param {IMAPIAdviseSink} lpAdviseSink 
     * @param {Pointer<Integer>} lpulConnection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-advise
     */
    Advise(cbEntryID, lpEntryID, ulEventMask, lpAdviseSink, lpulConnection) {
        result := ComCall(14, this, "uint", cbEntryID, "ptr", lpEntryID, "uint", ulEventMask, "ptr", lpAdviseSink, "uint*", lpulConnection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulConnection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-unadvise
     */
    Unadvise(ulConnection) {
        result := ComCall(15, this, "uint", ulConnection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbEntryID1 
     * @param {Pointer} lpEntryID1 
     * @param {Integer} cbEntryID2 
     * @param {Pointer} lpEntryID2 
     * @param {Integer} ulFlags 
     * @param {Pointer<Integer>} lpulResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-compareentryids
     */
    CompareEntryIDs(cbEntryID1, lpEntryID1, cbEntryID2, lpEntryID2, ulFlags, lpulResult) {
        result := ComCall(16, this, "uint", cbEntryID1, "ptr", lpEntryID1, "uint", cbEntryID2, "ptr", lpEntryID2, "uint", ulFlags, "uint*", lpulResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer} lpEntryID 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Integer} ulFlags 
     * @param {Pointer<Integer>} lpulObjType 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-openentry
     */
    OpenEntry(cbEntryID, lpEntryID, lpInterface, ulFlags, lpulObjType, ppUnk) {
        result := ComCall(17, this, "uint", cbEntryID, "ptr", lpEntryID, "ptr", lpInterface, "uint", ulFlags, "uint*", lpulObjType, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpszMessageClass 
     * @param {Integer} ulFlags 
     * @param {Integer} cbEntryID 
     * @param {Pointer} lpEntryID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-setreceivefolder
     */
    SetReceiveFolder(lpszMessageClass, ulFlags, cbEntryID, lpEntryID) {
        result := ComCall(18, this, "char*", lpszMessageClass, "uint", ulFlags, "uint", cbEntryID, "ptr", lpEntryID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpszMessageClass 
     * @param {Integer} ulFlags 
     * @param {Pointer<Integer>} lpcbEntryID 
     * @param {Pointer<Pointer<ENTRYID>>} lppEntryID 
     * @param {Pointer<Pointer<Integer>>} lppszExplicitClass 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-getreceivefolder
     */
    GetReceiveFolder(lpszMessageClass, ulFlags, lpcbEntryID, lppEntryID, lppszExplicitClass) {
        result := ComCall(19, this, "char*", lpszMessageClass, "uint", ulFlags, "uint*", lpcbEntryID, "ptr*", lppEntryID, "ptr*", lppszExplicitClass, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<IMAPITable>} lppTable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-getreceivefoldertable
     */
    GetReceiveFolderTable(ulFlags, lppTable) {
        result := ComCall(20, this, "uint", ulFlags, "ptr*", lppTable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-storelogoff
     */
    StoreLogoff(lpulFlags) {
        result := ComCall(21, this, "uint*", lpulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer} lpEntryID 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-abortsubmit
     */
    AbortSubmit(cbEntryID, lpEntryID, ulFlags) {
        result := ComCall(22, this, "uint", cbEntryID, "ptr", lpEntryID, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<IMAPITable>} lppTable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-getoutgoingqueue
     */
    GetOutgoingQueue(ulFlags, lppTable) {
        result := ComCall(23, this, "uint", ulFlags, "ptr*", lppTable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMessage} lpMessage 
     * @param {Integer} ulLockState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-setlockstate
     */
    SetLockState(lpMessage, ulLockState) {
        result := ComCall(24, this, "ptr", lpMessage, "uint", ulLockState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Integer} cbEntryID 
     * @param {Pointer} lpEntryID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-finishedmsg
     */
    FinishedMsg(ulFlags, cbEntryID, lpEntryID) {
        result := ComCall(25, this, "uint", ulFlags, "uint", cbEntryID, "ptr", lpEntryID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<NOTIFICATION>} lpNotification 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imsgstore-notifynewmail
     */
    NotifyNewMail(lpNotification) {
        result := ComCall(26, this, "ptr", lpNotification, "HRESULT")
        return result
    }
}
