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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AdviseSink", "UnadviseSink", "RequestLock", "GetStatus", "QueryInsert", "GetSelection", "SetSelection", "GetText", "SetText", "GetFormattedText", "GetEmbedded", "QueryInsertEmbedded", "InsertEmbedded", "InsertTextAtSelection", "InsertEmbeddedAtSelection", "RequestSupportedAttrs", "RequestAttrsAtPosition", "RequestAttrsTransitioningAtPosition", "FindNextAttrTransition", "RetrieveRequestedAttrs", "GetEndACP", "GetActiveView", "GetACPFromPoint", "GetTextExt", "GetScreenExt"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {IUnknown} punk 
     * @param {Integer} dwMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacp2-advisesink
     */
    AdviseSink(riid, punk, dwMask) {
        result := ComCall(3, this, "ptr", riid, "ptr", punk, "uint", dwMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacp2-unadvisesink
     */
    UnadviseSink(punk) {
        result := ComCall(4, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwLockFlags 
     * @param {Pointer<HRESULT>} phrSession 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacp2-requestlock
     */
    RequestLock(dwLockFlags, phrSession) {
        result := ComCall(5, this, "uint", dwLockFlags, "ptr", phrSession, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TS_STATUS>} pdcs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacp2-getstatus
     */
    GetStatus(pdcs) {
        result := ComCall(6, this, "ptr", pdcs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} acpTestStart 
     * @param {Integer} acpTestEnd 
     * @param {Integer} cch 
     * @param {Pointer<Integer>} pacpResultStart 
     * @param {Pointer<Integer>} pacpResultEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacp2-queryinsert
     */
    QueryInsert(acpTestStart, acpTestEnd, cch, pacpResultStart, pacpResultEnd) {
        result := ComCall(7, this, "int", acpTestStart, "int", acpTestEnd, "uint", cch, "int*", pacpResultStart, "int*", pacpResultEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulIndex 
     * @param {Integer} ulCount 
     * @param {Pointer<TS_SELECTION_ACP>} pSelection 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacp2-getselection
     */
    GetSelection(ulIndex, ulCount, pSelection, pcFetched) {
        result := ComCall(8, this, "uint", ulIndex, "uint", ulCount, "ptr", pSelection, "uint*", pcFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<TS_SELECTION_ACP>} pSelection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacp2-setselection
     */
    SetSelection(ulCount, pSelection) {
        result := ComCall(9, this, "uint", ulCount, "ptr", pSelection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} acpStart 
     * @param {Integer} acpEnd 
     * @param {PWSTR} pchPlain 
     * @param {Integer} cchPlainReq 
     * @param {Pointer<Integer>} pcchPlainRet 
     * @param {Pointer<TS_RUNINFO>} prgRunInfo 
     * @param {Integer} cRunInfoReq 
     * @param {Pointer<Integer>} pcRunInfoRet 
     * @param {Pointer<Integer>} pacpNext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacp2-gettext
     */
    GetText(acpStart, acpEnd, pchPlain, cchPlainReq, pcchPlainRet, prgRunInfo, cRunInfoReq, pcRunInfoRet, pacpNext) {
        pchPlain := pchPlain is String ? StrPtr(pchPlain) : pchPlain

        result := ComCall(10, this, "int", acpStart, "int", acpEnd, "ptr", pchPlain, "uint", cchPlainReq, "uint*", pcchPlainRet, "ptr", prgRunInfo, "uint", cRunInfoReq, "uint*", pcRunInfoRet, "int*", pacpNext, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacp2-settext
     */
    SetText(dwFlags, acpStart, acpEnd, pchText, cch, pChange) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(11, this, "uint", dwFlags, "int", acpStart, "int", acpEnd, "ptr", pchText, "uint", cch, "ptr", pChange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} acpStart 
     * @param {Integer} acpEnd 
     * @param {Pointer<IDataObject>} ppDataObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacp2-getformattedtext
     */
    GetFormattedText(acpStart, acpEnd, ppDataObject) {
        result := ComCall(12, this, "int", acpStart, "int", acpEnd, "ptr*", ppDataObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} acpPos 
     * @param {Pointer<Guid>} rguidService 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacp2-getembedded
     */
    GetEmbedded(acpPos, rguidService, riid, ppunk) {
        result := ComCall(13, this, "int", acpPos, "ptr", rguidService, "ptr", riid, "ptr*", ppunk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidService 
     * @param {Pointer<FORMATETC>} pFormatEtc 
     * @param {Pointer<BOOL>} pfInsertable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacp2-queryinsertembedded
     */
    QueryInsertEmbedded(pguidService, pFormatEtc, pfInsertable) {
        result := ComCall(14, this, "ptr", pguidService, "ptr", pFormatEtc, "ptr", pfInsertable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} acpStart 
     * @param {Integer} acpEnd 
     * @param {IDataObject} pDataObject 
     * @param {Pointer<TS_TEXTCHANGE>} pChange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacp2-insertembedded
     */
    InsertEmbedded(dwFlags, acpStart, acpEnd, pDataObject, pChange) {
        result := ComCall(15, this, "uint", dwFlags, "int", acpStart, "int", acpEnd, "ptr", pDataObject, "ptr", pChange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pchText 
     * @param {Integer} cch 
     * @param {Pointer<Integer>} pacpStart 
     * @param {Pointer<Integer>} pacpEnd 
     * @param {Pointer<TS_TEXTCHANGE>} pChange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacp2-inserttextatselection
     */
    InsertTextAtSelection(dwFlags, pchText, cch, pacpStart, pacpEnd, pChange) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(16, this, "uint", dwFlags, "ptr", pchText, "uint", cch, "int*", pacpStart, "int*", pacpEnd, "ptr", pChange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IDataObject} pDataObject 
     * @param {Pointer<Integer>} pacpStart 
     * @param {Pointer<Integer>} pacpEnd 
     * @param {Pointer<TS_TEXTCHANGE>} pChange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacp2-insertembeddedatselection
     */
    InsertEmbeddedAtSelection(dwFlags, pDataObject, pacpStart, pacpEnd, pChange) {
        result := ComCall(17, this, "uint", dwFlags, "ptr", pDataObject, "int*", pacpStart, "int*", pacpEnd, "ptr", pChange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} cFilterAttrs 
     * @param {Pointer<Guid>} paFilterAttrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacp2-requestsupportedattrs
     */
    RequestSupportedAttrs(dwFlags, cFilterAttrs, paFilterAttrs) {
        result := ComCall(18, this, "uint", dwFlags, "uint", cFilterAttrs, "ptr", paFilterAttrs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} acpPos 
     * @param {Integer} cFilterAttrs 
     * @param {Pointer<Guid>} paFilterAttrs 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacp2-requestattrsatposition
     */
    RequestAttrsAtPosition(acpPos, cFilterAttrs, paFilterAttrs, dwFlags) {
        result := ComCall(19, this, "int", acpPos, "uint", cFilterAttrs, "ptr", paFilterAttrs, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} acpPos 
     * @param {Integer} cFilterAttrs 
     * @param {Pointer<Guid>} paFilterAttrs 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacp2-requestattrstransitioningatposition
     */
    RequestAttrsTransitioningAtPosition(acpPos, cFilterAttrs, paFilterAttrs, dwFlags) {
        result := ComCall(20, this, "int", acpPos, "uint", cFilterAttrs, "ptr", paFilterAttrs, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} acpStart 
     * @param {Integer} acpHalt 
     * @param {Integer} cFilterAttrs 
     * @param {Pointer<Guid>} paFilterAttrs 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} pacpNext 
     * @param {Pointer<BOOL>} pfFound 
     * @param {Pointer<Integer>} plFoundOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacp2-findnextattrtransition
     */
    FindNextAttrTransition(acpStart, acpHalt, cFilterAttrs, paFilterAttrs, dwFlags, pacpNext, pfFound, plFoundOffset) {
        result := ComCall(21, this, "int", acpStart, "int", acpHalt, "uint", cFilterAttrs, "ptr", paFilterAttrs, "uint", dwFlags, "int*", pacpNext, "ptr", pfFound, "int*", plFoundOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<TS_ATTRVAL>} paAttrVals 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacp2-retrieverequestedattrs
     */
    RetrieveRequestedAttrs(ulCount, paAttrVals, pcFetched) {
        result := ComCall(22, this, "uint", ulCount, "ptr", paAttrVals, "uint*", pcFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pacp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacp2-getendacp
     */
    GetEndACP(pacp) {
        result := ComCall(23, this, "int*", pacp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pvcView 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacp2-getactiveview
     */
    GetActiveView(pvcView) {
        result := ComCall(24, this, "uint*", pvcView, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} vcView 
     * @param {Pointer<POINT>} ptScreen 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} pacp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacp2-getacpfrompoint
     */
    GetACPFromPoint(vcView, ptScreen, dwFlags, pacp) {
        result := ComCall(25, this, "uint", vcView, "ptr", ptScreen, "uint", dwFlags, "int*", pacp, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacp2-gettextext
     */
    GetTextExt(vcView, acpStart, acpEnd, prc, pfClipped) {
        result := ComCall(26, this, "uint", vcView, "int", acpStart, "int", acpEnd, "ptr", prc, "ptr", pfClipped, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} vcView 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacp2-getscreenext
     */
    GetScreenExt(vcView, prc) {
        result := ComCall(27, this, "uint", vcView, "ptr", prc, "HRESULT")
        return result
    }
}
