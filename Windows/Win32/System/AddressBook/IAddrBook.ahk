#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMAPIProp.ahk

/**
 * Do not use.
 * @see https://docs.microsoft.com/windows/win32/api//wabiab/nn-wabiab-iaddrbook
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IAddrBook extends IMAPIProp{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer<ENTRYID>} lpEntryID 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Integer} ulFlags 
     * @param {Pointer<UInt32>} lpulObjType 
     * @param {Pointer<IUnknown>} lppUnk 
     * @returns {HRESULT} 
     */
    OpenEntry(cbEntryID, lpEntryID, lpInterface, ulFlags, lpulObjType, lppUnk) {
        result := ComCall(14, this, "uint", cbEntryID, "ptr", lpEntryID, "ptr", lpInterface, "uint", ulFlags, "uint*", lpulObjType, "ptr", lppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbEntryID1 
     * @param {Pointer<ENTRYID>} lpEntryID1 
     * @param {Integer} cbEntryID2 
     * @param {Pointer<ENTRYID>} lpEntryID2 
     * @param {Integer} ulFlags 
     * @param {Pointer<UInt32>} lpulResult 
     * @returns {HRESULT} 
     */
    CompareEntryIDs(cbEntryID1, lpEntryID1, cbEntryID2, lpEntryID2, ulFlags, lpulResult) {
        result := ComCall(15, this, "uint", cbEntryID1, "ptr", lpEntryID1, "uint", cbEntryID2, "ptr", lpEntryID2, "uint", ulFlags, "uint*", lpulResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer<ENTRYID>} lpEntryID 
     * @param {Integer} ulEventMask 
     * @param {Pointer<IMAPIAdviseSink>} lpAdviseSink 
     * @param {Pointer<UInt32>} lpulConnection 
     * @returns {HRESULT} 
     */
    Advise(cbEntryID, lpEntryID, ulEventMask, lpAdviseSink, lpulConnection) {
        result := ComCall(16, this, "uint", cbEntryID, "ptr", lpEntryID, "uint", ulEventMask, "ptr", lpAdviseSink, "uint*", lpulConnection, "int")
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
        result := ComCall(17, this, "uint", ulConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SByte>} lpszName 
     * @param {Pointer<SByte>} lpszAdrType 
     * @param {Pointer<SByte>} lpszAddress 
     * @param {Integer} ulFlags 
     * @param {Pointer<UInt32>} lpcbEntryID 
     * @param {Pointer<ENTRYID>} lppEntryID 
     * @returns {HRESULT} 
     */
    CreateOneOff(lpszName, lpszAdrType, lpszAddress, ulFlags, lpcbEntryID, lppEntryID) {
        result := ComCall(18, this, "char*", lpszName, "char*", lpszAdrType, "char*", lpszAddress, "uint", ulFlags, "uint*", lpcbEntryID, "ptr", lppEntryID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulUIParam 
     * @param {Integer} ulFlags 
     * @param {Integer} cbEIDContainer 
     * @param {Pointer<ENTRYID>} lpEIDContainer 
     * @param {Integer} cbEIDNewEntryTpl 
     * @param {Pointer<ENTRYID>} lpEIDNewEntryTpl 
     * @param {Pointer<UInt32>} lpcbEIDNewEntry 
     * @param {Pointer<ENTRYID>} lppEIDNewEntry 
     * @returns {HRESULT} 
     */
    NewEntry(ulUIParam, ulFlags, cbEIDContainer, lpEIDContainer, cbEIDNewEntryTpl, lpEIDNewEntryTpl, lpcbEIDNewEntry, lppEIDNewEntry) {
        result := ComCall(19, this, "uint", ulUIParam, "uint", ulFlags, "uint", cbEIDContainer, "ptr", lpEIDContainer, "uint", cbEIDNewEntryTpl, "ptr", lpEIDNewEntryTpl, "uint*", lpcbEIDNewEntry, "ptr", lppEIDNewEntry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} ulUIParam 
     * @param {Integer} ulFlags 
     * @param {Pointer<SByte>} lpszNewEntryTitle 
     * @param {Pointer<ADRLIST>} lpAdrList 
     * @returns {HRESULT} 
     */
    ResolveName(ulUIParam, ulFlags, lpszNewEntryTitle, lpAdrList) {
        result := ComCall(20, this, "ptr", ulUIParam, "uint", ulFlags, "char*", lpszNewEntryTitle, "ptr", lpAdrList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} lpulUIParam 
     * @param {Pointer<ADRPARM>} lpAdrParms 
     * @param {Pointer<ADRLIST>} lppAdrList 
     * @returns {HRESULT} 
     */
    Address(lpulUIParam, lpAdrParms, lppAdrList) {
        result := ComCall(21, this, "uint*", lpulUIParam, "ptr", lpAdrParms, "ptr", lppAdrList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UIntPtr>} lpulUIParam 
     * @param {Pointer<LPFNDISMISS>} lpfnDismiss 
     * @param {Pointer<Void>} lpvDismissContext 
     * @param {Integer} cbEntryID 
     * @param {Pointer<ENTRYID>} lpEntryID 
     * @param {Pointer<LPFNBUTTON>} lpfButtonCallback 
     * @param {Pointer<Void>} lpvButtonContext 
     * @param {Pointer<SByte>} lpszButtonText 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    Details(lpulUIParam, lpfnDismiss, lpvDismissContext, cbEntryID, lpEntryID, lpfButtonCallback, lpvButtonContext, lpszButtonText, ulFlags) {
        result := ComCall(22, this, "ptr*", lpulUIParam, "ptr", lpfnDismiss, "ptr", lpvDismissContext, "uint", cbEntryID, "ptr", lpEntryID, "ptr", lpfButtonCallback, "ptr", lpvButtonContext, "char*", lpszButtonText, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulUIParam 
     * @param {Integer} ulFlags 
     * @param {Pointer<ADRENTRY>} lpRecip 
     * @returns {HRESULT} 
     */
    RecipOptions(ulUIParam, ulFlags, lpRecip) {
        result := ComCall(23, this, "uint", ulUIParam, "uint", ulFlags, "ptr", lpRecip, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SByte>} lpszAdrType 
     * @param {Integer} ulFlags 
     * @param {Pointer<UInt32>} lpcValues 
     * @param {Pointer<SPropValue>} lppOptions 
     * @returns {HRESULT} 
     */
    QueryDefaultRecipOpt(lpszAdrType, ulFlags, lpcValues, lppOptions) {
        result := ComCall(24, this, "char*", lpszAdrType, "uint", ulFlags, "uint*", lpcValues, "ptr", lppOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} lpcbEntryID 
     * @param {Pointer<ENTRYID>} lppEntryID 
     * @returns {HRESULT} 
     */
    GetPAB(lpcbEntryID, lppEntryID) {
        result := ComCall(25, this, "uint*", lpcbEntryID, "ptr", lppEntryID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer<ENTRYID>} lpEntryID 
     * @returns {HRESULT} 
     */
    SetPAB(cbEntryID, lpEntryID) {
        result := ComCall(26, this, "uint", cbEntryID, "ptr", lpEntryID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} lpcbEntryID 
     * @param {Pointer<ENTRYID>} lppEntryID 
     * @returns {HRESULT} 
     */
    GetDefaultDir(lpcbEntryID, lppEntryID) {
        result := ComCall(27, this, "uint*", lpcbEntryID, "ptr", lppEntryID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer<ENTRYID>} lpEntryID 
     * @returns {HRESULT} 
     */
    SetDefaultDir(cbEntryID, lpEntryID) {
        result := ComCall(28, this, "uint", cbEntryID, "ptr", lpEntryID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<SRowSet>} lppSearchPath 
     * @returns {HRESULT} 
     */
    GetSearchPath(ulFlags, lppSearchPath) {
        result := ComCall(29, this, "uint", ulFlags, "ptr", lppSearchPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<SRowSet>} lpSearchPath 
     * @returns {HRESULT} 
     */
    SetSearchPath(ulFlags, lpSearchPath) {
        result := ComCall(30, this, "uint", ulFlags, "ptr", lpSearchPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<SPropTagArray>} lpPropTagArray 
     * @param {Pointer<ADRLIST>} lpRecipList 
     * @returns {HRESULT} 
     */
    PrepareRecips(ulFlags, lpPropTagArray, lpRecipList) {
        result := ComCall(31, this, "uint", ulFlags, "ptr", lpPropTagArray, "ptr", lpRecipList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
