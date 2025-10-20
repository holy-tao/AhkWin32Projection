#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMAPIProp.ahk

/**
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMsgStore extends IMAPIProp{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer} lpEntryID 
     * @param {Integer} ulEventMask 
     * @param {Pointer<IMAPIAdviseSink>} lpAdviseSink 
     * @param {Pointer<UInt32>} lpulConnection 
     * @returns {HRESULT} 
     */
    Advise(cbEntryID, lpEntryID, ulEventMask, lpAdviseSink, lpulConnection) {
        result := ComCall(14, this, "uint", cbEntryID, "ptr", lpEntryID, "uint", ulEventMask, "ptr", lpAdviseSink, "uint*", lpulConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulConnection 
     * @returns {HRESULT} 
     */
    Unadvise(ulConnection) {
        result := ComCall(15, this, "uint", ulConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbEntryID1 
     * @param {Pointer} lpEntryID1 
     * @param {Integer} cbEntryID2 
     * @param {Pointer} lpEntryID2 
     * @param {Integer} ulFlags 
     * @param {Pointer<UInt32>} lpulResult 
     * @returns {HRESULT} 
     */
    CompareEntryIDs(cbEntryID1, lpEntryID1, cbEntryID2, lpEntryID2, ulFlags, lpulResult) {
        result := ComCall(16, this, "uint", cbEntryID1, "ptr", lpEntryID1, "uint", cbEntryID2, "ptr", lpEntryID2, "uint", ulFlags, "uint*", lpulResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer} lpEntryID 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Integer} ulFlags 
     * @param {Pointer<UInt32>} lpulObjType 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    OpenEntry(cbEntryID, lpEntryID, lpInterface, ulFlags, lpulObjType, ppUnk) {
        result := ComCall(17, this, "uint", cbEntryID, "ptr", lpEntryID, "ptr", lpInterface, "uint", ulFlags, "uint*", lpulObjType, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SByte>} lpszMessageClass 
     * @param {Integer} ulFlags 
     * @param {Integer} cbEntryID 
     * @param {Pointer} lpEntryID 
     * @returns {HRESULT} 
     */
    SetReceiveFolder(lpszMessageClass, ulFlags, cbEntryID, lpEntryID) {
        result := ComCall(18, this, "char*", lpszMessageClass, "uint", ulFlags, "uint", cbEntryID, "ptr", lpEntryID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SByte>} lpszMessageClass 
     * @param {Integer} ulFlags 
     * @param {Pointer<UInt32>} lpcbEntryID 
     * @param {Pointer<ENTRYID>} lppEntryID 
     * @param {Pointer<SByte>} lppszExplicitClass 
     * @returns {HRESULT} 
     */
    GetReceiveFolder(lpszMessageClass, ulFlags, lpcbEntryID, lppEntryID, lppszExplicitClass) {
        result := ComCall(19, this, "char*", lpszMessageClass, "uint", ulFlags, "uint*", lpcbEntryID, "ptr", lppEntryID, "char*", lppszExplicitClass, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<IMAPITable>} lppTable 
     * @returns {HRESULT} 
     */
    GetReceiveFolderTable(ulFlags, lppTable) {
        result := ComCall(20, this, "uint", ulFlags, "ptr", lppTable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} lpulFlags 
     * @returns {HRESULT} 
     */
    StoreLogoff(lpulFlags) {
        result := ComCall(21, this, "uint*", lpulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer} lpEntryID 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    AbortSubmit(cbEntryID, lpEntryID, ulFlags) {
        result := ComCall(22, this, "uint", cbEntryID, "ptr", lpEntryID, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<IMAPITable>} lppTable 
     * @returns {HRESULT} 
     */
    GetOutgoingQueue(ulFlags, lppTable) {
        result := ComCall(23, this, "uint", ulFlags, "ptr", lppTable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMessage>} lpMessage 
     * @param {Integer} ulLockState 
     * @returns {HRESULT} 
     */
    SetLockState(lpMessage, ulLockState) {
        result := ComCall(24, this, "ptr", lpMessage, "uint", ulLockState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Integer} cbEntryID 
     * @param {Pointer} lpEntryID 
     * @returns {HRESULT} 
     */
    FinishedMsg(ulFlags, cbEntryID, lpEntryID) {
        result := ComCall(25, this, "uint", ulFlags, "uint", cbEntryID, "ptr", lpEntryID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<NOTIFICATION>} lpNotification 
     * @returns {HRESULT} 
     */
    NotifyNewMail(lpNotification) {
        result := ComCall(26, this, "ptr", lpNotification, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
