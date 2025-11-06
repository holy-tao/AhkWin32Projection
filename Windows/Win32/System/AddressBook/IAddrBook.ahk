#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk
#Include .\IMAPIProp.ahk

/**
 * Do not use.
 * @see https://docs.microsoft.com/windows/win32/api//wabiab/nn-wabiab-iaddrbook
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IAddrBook extends IMAPIProp{

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
    static VTableNames => ["OpenEntry", "CompareEntryIDs", "Advise", "Unadvise", "CreateOneOff", "NewEntry", "ResolveName", "Address", "Details", "RecipOptions", "QueryDefaultRecipOpt", "GetPAB", "SetPAB", "GetDefaultDir", "SetDefaultDir", "GetSearchPath", "SetSearchPath", "PrepareRecips"]

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer<ENTRYID>} lpEntryID 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Integer} ulFlags 
     * @param {Pointer<Integer>} lpulObjType 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-openentry
     */
    OpenEntry(cbEntryID, lpEntryID, lpInterface, ulFlags, lpulObjType) {
        lpulObjTypeMarshal := lpulObjType is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "uint", cbEntryID, "ptr", lpEntryID, "ptr", lpInterface, "uint", ulFlags, lpulObjTypeMarshal, lpulObjType, "ptr*", &lppUnk := 0, "HRESULT")
        return IUnknown(lppUnk)
    }

    /**
     * 
     * @param {Integer} cbEntryID1 
     * @param {Pointer<ENTRYID>} lpEntryID1 
     * @param {Integer} cbEntryID2 
     * @param {Pointer<ENTRYID>} lpEntryID2 
     * @param {Integer} ulFlags 
     * @param {Pointer<Integer>} lpulResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-compareentryids
     */
    CompareEntryIDs(cbEntryID1, lpEntryID1, cbEntryID2, lpEntryID2, ulFlags, lpulResult) {
        lpulResultMarshal := lpulResult is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "uint", cbEntryID1, "ptr", lpEntryID1, "uint", cbEntryID2, "ptr", lpEntryID2, "uint", ulFlags, lpulResultMarshal, lpulResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer<ENTRYID>} lpEntryID 
     * @param {Integer} ulEventMask 
     * @param {IMAPIAdviseSink} lpAdviseSink 
     * @param {Pointer<Integer>} lpulConnection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-advise
     */
    Advise(cbEntryID, lpEntryID, ulEventMask, lpAdviseSink, lpulConnection) {
        lpulConnectionMarshal := lpulConnection is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "uint", cbEntryID, "ptr", lpEntryID, "uint", ulEventMask, "ptr", lpAdviseSink, lpulConnectionMarshal, lpulConnection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulConnection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-unadvise
     */
    Unadvise(ulConnection) {
        result := ComCall(17, this, "uint", ulConnection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpszName 
     * @param {Pointer<Integer>} lpszAdrType 
     * @param {Pointer<Integer>} lpszAddress 
     * @param {Integer} ulFlags 
     * @param {Pointer<Integer>} lpcbEntryID 
     * @param {Pointer<Pointer<ENTRYID>>} lppEntryID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-createoneoff
     */
    CreateOneOff(lpszName, lpszAdrType, lpszAddress, ulFlags, lpcbEntryID, lppEntryID) {
        lpszNameMarshal := lpszName is VarRef ? "char*" : "ptr"
        lpszAdrTypeMarshal := lpszAdrType is VarRef ? "char*" : "ptr"
        lpszAddressMarshal := lpszAddress is VarRef ? "char*" : "ptr"
        lpcbEntryIDMarshal := lpcbEntryID is VarRef ? "uint*" : "ptr"
        lppEntryIDMarshal := lppEntryID is VarRef ? "ptr*" : "ptr"

        result := ComCall(18, this, lpszNameMarshal, lpszName, lpszAdrTypeMarshal, lpszAdrType, lpszAddressMarshal, lpszAddress, "uint", ulFlags, lpcbEntryIDMarshal, lpcbEntryID, lppEntryIDMarshal, lppEntryID, "HRESULT")
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
     * @param {Pointer<Integer>} lpcbEIDNewEntry 
     * @param {Pointer<Pointer<ENTRYID>>} lppEIDNewEntry 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-newentry
     */
    NewEntry(ulUIParam, ulFlags, cbEIDContainer, lpEIDContainer, cbEIDNewEntryTpl, lpEIDNewEntryTpl, lpcbEIDNewEntry, lppEIDNewEntry) {
        lpcbEIDNewEntryMarshal := lpcbEIDNewEntry is VarRef ? "uint*" : "ptr"
        lppEIDNewEntryMarshal := lppEIDNewEntry is VarRef ? "ptr*" : "ptr"

        result := ComCall(19, this, "uint", ulUIParam, "uint", ulFlags, "uint", cbEIDContainer, "ptr", lpEIDContainer, "uint", cbEIDNewEntryTpl, "ptr", lpEIDNewEntryTpl, lpcbEIDNewEntryMarshal, lpcbEIDNewEntry, lppEIDNewEntryMarshal, lppEIDNewEntry, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} ulUIParam 
     * @param {Integer} ulFlags 
     * @param {Pointer<Integer>} lpszNewEntryTitle 
     * @param {Pointer<ADRLIST>} lpAdrList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-resolvename
     */
    ResolveName(ulUIParam, ulFlags, lpszNewEntryTitle, lpAdrList) {
        lpszNewEntryTitleMarshal := lpszNewEntryTitle is VarRef ? "char*" : "ptr"

        result := ComCall(20, this, "ptr", ulUIParam, "uint", ulFlags, lpszNewEntryTitleMarshal, lpszNewEntryTitle, "ptr", lpAdrList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpulUIParam 
     * @param {Pointer<ADRPARM>} lpAdrParms 
     * @param {Pointer<Pointer<ADRLIST>>} lppAdrList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-address
     */
    Address(lpulUIParam, lpAdrParms, lppAdrList) {
        lpulUIParamMarshal := lpulUIParam is VarRef ? "uint*" : "ptr"
        lppAdrListMarshal := lppAdrList is VarRef ? "ptr*" : "ptr"

        result := ComCall(21, this, lpulUIParamMarshal, lpulUIParam, "ptr", lpAdrParms, lppAdrListMarshal, lppAdrList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} lpulUIParam 
     * @param {Pointer<LPFNDISMISS>} lpfnDismiss 
     * @param {Pointer<Void>} lpvDismissContext 
     * @param {Integer} cbEntryID 
     * @param {Pointer<ENTRYID>} lpEntryID 
     * @param {Pointer<LPFNBUTTON>} lpfButtonCallback 
     * @param {Pointer<Void>} lpvButtonContext 
     * @param {Pointer<Integer>} lpszButtonText 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-details
     */
    Details(lpulUIParam, lpfnDismiss, lpvDismissContext, cbEntryID, lpEntryID, lpfButtonCallback, lpvButtonContext, lpszButtonText, ulFlags) {
        lpulUIParamMarshal := lpulUIParam is VarRef ? "ptr*" : "ptr"
        lpvDismissContextMarshal := lpvDismissContext is VarRef ? "ptr" : "ptr"
        lpvButtonContextMarshal := lpvButtonContext is VarRef ? "ptr" : "ptr"
        lpszButtonTextMarshal := lpszButtonText is VarRef ? "char*" : "ptr"

        result := ComCall(22, this, lpulUIParamMarshal, lpulUIParam, "ptr", lpfnDismiss, lpvDismissContextMarshal, lpvDismissContext, "uint", cbEntryID, "ptr", lpEntryID, "ptr", lpfButtonCallback, lpvButtonContextMarshal, lpvButtonContext, lpszButtonTextMarshal, lpszButtonText, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulUIParam 
     * @param {Integer} ulFlags 
     * @param {Pointer<ADRENTRY>} lpRecip 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wabiab/nf-wabiab-iaddrbook-recipoptions
     */
    RecipOptions(ulUIParam, ulFlags, lpRecip) {
        result := ComCall(23, this, "uint", ulUIParam, "uint", ulFlags, "ptr", lpRecip, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpszAdrType 
     * @param {Integer} ulFlags 
     * @param {Pointer<Integer>} lpcValues 
     * @param {Pointer<Pointer<SPropValue>>} lppOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wabiab/nf-wabiab-iaddrbook-querydefaultrecipopt
     */
    QueryDefaultRecipOpt(lpszAdrType, ulFlags, lpcValues, lppOptions) {
        lpszAdrTypeMarshal := lpszAdrType is VarRef ? "char*" : "ptr"
        lpcValuesMarshal := lpcValues is VarRef ? "uint*" : "ptr"
        lppOptionsMarshal := lppOptions is VarRef ? "ptr*" : "ptr"

        result := ComCall(24, this, lpszAdrTypeMarshal, lpszAdrType, "uint", ulFlags, lpcValuesMarshal, lpcValues, lppOptionsMarshal, lppOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpcbEntryID 
     * @param {Pointer<Pointer<ENTRYID>>} lppEntryID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-getpab
     */
    GetPAB(lpcbEntryID, lppEntryID) {
        lpcbEntryIDMarshal := lpcbEntryID is VarRef ? "uint*" : "ptr"
        lppEntryIDMarshal := lppEntryID is VarRef ? "ptr*" : "ptr"

        result := ComCall(25, this, lpcbEntryIDMarshal, lpcbEntryID, lppEntryIDMarshal, lppEntryID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer<ENTRYID>} lpEntryID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-setpab
     */
    SetPAB(cbEntryID, lpEntryID) {
        result := ComCall(26, this, "uint", cbEntryID, "ptr", lpEntryID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpcbEntryID 
     * @param {Pointer<Pointer<ENTRYID>>} lppEntryID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-getdefaultdir
     */
    GetDefaultDir(lpcbEntryID, lppEntryID) {
        lpcbEntryIDMarshal := lpcbEntryID is VarRef ? "uint*" : "ptr"
        lppEntryIDMarshal := lppEntryID is VarRef ? "ptr*" : "ptr"

        result := ComCall(27, this, lpcbEntryIDMarshal, lpcbEntryID, lppEntryIDMarshal, lppEntryID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer<ENTRYID>} lpEntryID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-setdefaultdir
     */
    SetDefaultDir(cbEntryID, lpEntryID) {
        result := ComCall(28, this, "uint", cbEntryID, "ptr", lpEntryID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<Pointer<SRowSet>>} lppSearchPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-getsearchpath
     */
    GetSearchPath(ulFlags, lppSearchPath) {
        lppSearchPathMarshal := lppSearchPath is VarRef ? "ptr*" : "ptr"

        result := ComCall(29, this, "uint", ulFlags, lppSearchPathMarshal, lppSearchPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<SRowSet>} lpSearchPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-setsearchpath
     */
    SetSearchPath(ulFlags, lpSearchPath) {
        result := ComCall(30, this, "uint", ulFlags, "ptr", lpSearchPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<SPropTagArray>} lpPropTagArray 
     * @param {Pointer<ADRLIST>} lpRecipList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-preparerecips
     */
    PrepareRecips(ulFlags, lpPropTagArray, lpRecipList) {
        result := ComCall(31, this, "uint", ulFlags, "ptr", lpPropTagArray, "ptr", lpRecipList, "HRESULT")
        return result
    }
}
