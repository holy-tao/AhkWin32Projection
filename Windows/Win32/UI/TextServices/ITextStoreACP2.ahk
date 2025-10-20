#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITextStoreACP2 interface is implemented by the application and is used by the TSF manager to manipulate text streams or text stores in TSF.
 * @see https://docs.microsoft.com/windows/win32/api//textstor/nn-textstor-itextstoreacp2
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITextStoreACP2 extends IUnknown{
    /**
     * The interface identifier for ITextStoreACP2
     * @type {Guid}
     */
    static IID => Guid("{f86ad89f-5fe4-4b8d-bb9f-ef3797a84f1f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} punk 
     * @param {Integer} dwMask 
     * @returns {HRESULT} 
     */
    AdviseSink(riid, punk, dwMask) {
        result := ComCall(3, this, "ptr", riid, "ptr", punk, "uint", dwMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} punk 
     * @returns {HRESULT} 
     */
    UnadviseSink(punk) {
        result := ComCall(4, this, "ptr", punk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwLockFlags 
     * @param {Pointer<HRESULT>} phrSession 
     * @returns {HRESULT} 
     */
    RequestLock(dwLockFlags, phrSession) {
        result := ComCall(5, this, "uint", dwLockFlags, "ptr", phrSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TS_STATUS>} pdcs 
     * @returns {HRESULT} 
     */
    GetStatus(pdcs) {
        result := ComCall(6, this, "ptr", pdcs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} acpTestStart 
     * @param {Integer} acpTestEnd 
     * @param {Integer} cch 
     * @param {Pointer<Int32>} pacpResultStart 
     * @param {Pointer<Int32>} pacpResultEnd 
     * @returns {HRESULT} 
     */
    QueryInsert(acpTestStart, acpTestEnd, cch, pacpResultStart, pacpResultEnd) {
        result := ComCall(7, this, "int", acpTestStart, "int", acpTestEnd, "uint", cch, "int*", pacpResultStart, "int*", pacpResultEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulIndex 
     * @param {Integer} ulCount 
     * @param {Pointer<TS_SELECTION_ACP>} pSelection 
     * @param {Pointer<UInt32>} pcFetched 
     * @returns {HRESULT} 
     */
    GetSelection(ulIndex, ulCount, pSelection, pcFetched) {
        result := ComCall(8, this, "uint", ulIndex, "uint", ulCount, "ptr", pSelection, "uint*", pcFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<TS_SELECTION_ACP>} pSelection 
     * @returns {HRESULT} 
     */
    SetSelection(ulCount, pSelection) {
        result := ComCall(9, this, "uint", ulCount, "ptr", pSelection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} acpStart 
     * @param {Integer} acpEnd 
     * @param {PWSTR} pchPlain 
     * @param {Integer} cchPlainReq 
     * @param {Pointer<UInt32>} pcchPlainRet 
     * @param {Pointer<TS_RUNINFO>} prgRunInfo 
     * @param {Integer} cRunInfoReq 
     * @param {Pointer<UInt32>} pcRunInfoRet 
     * @param {Pointer<Int32>} pacpNext 
     * @returns {HRESULT} 
     */
    GetText(acpStart, acpEnd, pchPlain, cchPlainReq, pcchPlainRet, prgRunInfo, cRunInfoReq, pcRunInfoRet, pacpNext) {
        pchPlain := pchPlain is String ? StrPtr(pchPlain) : pchPlain

        result := ComCall(10, this, "int", acpStart, "int", acpEnd, "ptr", pchPlain, "uint", cchPlainReq, "uint*", pcchPlainRet, "ptr", prgRunInfo, "uint", cRunInfoReq, "uint*", pcRunInfoRet, "int*", pacpNext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} acpStart 
     * @param {Integer} acpEnd 
     * @param {PWSTR} pchText 
     * @param {Integer} cch 
     * @param {Pointer<TS_TEXTCHANGE>} pChange 
     * @returns {HRESULT} 
     */
    SetText(dwFlags, acpStart, acpEnd, pchText, cch, pChange) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(11, this, "uint", dwFlags, "int", acpStart, "int", acpEnd, "ptr", pchText, "uint", cch, "ptr", pChange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} acpStart 
     * @param {Integer} acpEnd 
     * @param {Pointer<IDataObject>} ppDataObject 
     * @returns {HRESULT} 
     */
    GetFormattedText(acpStart, acpEnd, ppDataObject) {
        result := ComCall(12, this, "int", acpStart, "int", acpEnd, "ptr", ppDataObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} acpPos 
     * @param {Pointer<Guid>} rguidService 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     */
    GetEmbedded(acpPos, rguidService, riid, ppunk) {
        result := ComCall(13, this, "int", acpPos, "ptr", rguidService, "ptr", riid, "ptr", ppunk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidService 
     * @param {Pointer<FORMATETC>} pFormatEtc 
     * @param {Pointer<BOOL>} pfInsertable 
     * @returns {HRESULT} 
     */
    QueryInsertEmbedded(pguidService, pFormatEtc, pfInsertable) {
        result := ComCall(14, this, "ptr", pguidService, "ptr", pFormatEtc, "ptr", pfInsertable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} acpStart 
     * @param {Integer} acpEnd 
     * @param {Pointer<IDataObject>} pDataObject 
     * @param {Pointer<TS_TEXTCHANGE>} pChange 
     * @returns {HRESULT} 
     */
    InsertEmbedded(dwFlags, acpStart, acpEnd, pDataObject, pChange) {
        result := ComCall(15, this, "uint", dwFlags, "int", acpStart, "int", acpEnd, "ptr", pDataObject, "ptr", pChange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pchText 
     * @param {Integer} cch 
     * @param {Pointer<Int32>} pacpStart 
     * @param {Pointer<Int32>} pacpEnd 
     * @param {Pointer<TS_TEXTCHANGE>} pChange 
     * @returns {HRESULT} 
     */
    InsertTextAtSelection(dwFlags, pchText, cch, pacpStart, pacpEnd, pChange) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(16, this, "uint", dwFlags, "ptr", pchText, "uint", cch, "int*", pacpStart, "int*", pacpEnd, "ptr", pChange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDataObject>} pDataObject 
     * @param {Pointer<Int32>} pacpStart 
     * @param {Pointer<Int32>} pacpEnd 
     * @param {Pointer<TS_TEXTCHANGE>} pChange 
     * @returns {HRESULT} 
     */
    InsertEmbeddedAtSelection(dwFlags, pDataObject, pacpStart, pacpEnd, pChange) {
        result := ComCall(17, this, "uint", dwFlags, "ptr", pDataObject, "int*", pacpStart, "int*", pacpEnd, "ptr", pChange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} cFilterAttrs 
     * @param {Pointer<Guid>} paFilterAttrs 
     * @returns {HRESULT} 
     */
    RequestSupportedAttrs(dwFlags, cFilterAttrs, paFilterAttrs) {
        result := ComCall(18, this, "uint", dwFlags, "uint", cFilterAttrs, "ptr", paFilterAttrs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} acpPos 
     * @param {Integer} cFilterAttrs 
     * @param {Pointer<Guid>} paFilterAttrs 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    RequestAttrsAtPosition(acpPos, cFilterAttrs, paFilterAttrs, dwFlags) {
        result := ComCall(19, this, "int", acpPos, "uint", cFilterAttrs, "ptr", paFilterAttrs, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} acpPos 
     * @param {Integer} cFilterAttrs 
     * @param {Pointer<Guid>} paFilterAttrs 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    RequestAttrsTransitioningAtPosition(acpPos, cFilterAttrs, paFilterAttrs, dwFlags) {
        result := ComCall(20, this, "int", acpPos, "uint", cFilterAttrs, "ptr", paFilterAttrs, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} acpStart 
     * @param {Integer} acpHalt 
     * @param {Integer} cFilterAttrs 
     * @param {Pointer<Guid>} paFilterAttrs 
     * @param {Integer} dwFlags 
     * @param {Pointer<Int32>} pacpNext 
     * @param {Pointer<BOOL>} pfFound 
     * @param {Pointer<Int32>} plFoundOffset 
     * @returns {HRESULT} 
     */
    FindNextAttrTransition(acpStart, acpHalt, cFilterAttrs, paFilterAttrs, dwFlags, pacpNext, pfFound, plFoundOffset) {
        result := ComCall(21, this, "int", acpStart, "int", acpHalt, "uint", cFilterAttrs, "ptr", paFilterAttrs, "uint", dwFlags, "int*", pacpNext, "ptr", pfFound, "int*", plFoundOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<TS_ATTRVAL>} paAttrVals 
     * @param {Pointer<UInt32>} pcFetched 
     * @returns {HRESULT} 
     */
    RetrieveRequestedAttrs(ulCount, paAttrVals, pcFetched) {
        result := ComCall(22, this, "uint", ulCount, "ptr", paAttrVals, "uint*", pcFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pacp 
     * @returns {HRESULT} 
     */
    GetEndACP(pacp) {
        result := ComCall(23, this, "int*", pacp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pvcView 
     * @returns {HRESULT} 
     */
    GetActiveView(pvcView) {
        result := ComCall(24, this, "uint*", pvcView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} vcView 
     * @param {Pointer<POINT>} ptScreen 
     * @param {Integer} dwFlags 
     * @param {Pointer<Int32>} pacp 
     * @returns {HRESULT} 
     */
    GetACPFromPoint(vcView, ptScreen, dwFlags, pacp) {
        result := ComCall(25, this, "uint", vcView, "ptr", ptScreen, "uint", dwFlags, "int*", pacp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} vcView 
     * @param {Integer} acpStart 
     * @param {Integer} acpEnd 
     * @param {Pointer<RECT>} prc 
     * @param {Pointer<BOOL>} pfClipped 
     * @returns {HRESULT} 
     */
    GetTextExt(vcView, acpStart, acpEnd, prc, pfClipped) {
        result := ComCall(26, this, "uint", vcView, "int", acpStart, "int", acpEnd, "ptr", prc, "ptr", pfClipped, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} vcView 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     */
    GetScreenExt(vcView, prc) {
        result := ComCall(27, this, "uint", vcView, "ptr", prc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
