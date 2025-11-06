#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\TS_STATUS.ahk
#Include ..\..\System\Com\IDataObject.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IAnchor.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * The ITextStoreAnchor interface is implemented by a Microsoft Active Accessibility client and is used by the TSF manager to manipulate text streams.
 * @see https://docs.microsoft.com/windows/win32/api//textstor/nn-textstor-itextstoreanchor
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITextStoreAnchor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextStoreAnchor
     * @type {Guid}
     */
    static IID => Guid("{9b2077b0-5f18-4dec-bee9-3cc722f5dfe0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AdviseSink", "UnadviseSink", "RequestLock", "GetStatus", "QueryInsert", "GetSelection", "SetSelection", "GetText", "SetText", "GetFormattedText", "GetEmbedded", "InsertEmbedded", "RequestSupportedAttrs", "RequestAttrsAtPosition", "RequestAttrsTransitioningAtPosition", "FindNextAttrTransition", "RetrieveRequestedAttrs", "GetStart", "GetEnd", "GetActiveView", "GetAnchorFromPoint", "GetTextExt", "GetScreenExt", "GetWnd", "QueryInsertEmbedded", "InsertTextAtSelection", "InsertEmbeddedAtSelection"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {IUnknown} punk 
     * @param {Integer} dwMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-advisesink
     */
    AdviseSink(riid, punk, dwMask) {
        result := ComCall(3, this, "ptr", riid, "ptr", punk, "uint", dwMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-unadvisesink
     */
    UnadviseSink(punk) {
        result := ComCall(4, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwLockFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-requestlock
     */
    RequestLock(dwLockFlags) {
        result := ComCall(5, this, "uint", dwLockFlags, "int*", &phrSession := 0, "HRESULT")
        return phrSession
    }

    /**
     * 
     * @returns {TS_STATUS} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-getstatus
     */
    GetStatus() {
        pdcs := TS_STATUS()
        result := ComCall(6, this, "ptr", pdcs, "HRESULT")
        return pdcs
    }

    /**
     * 
     * @param {IAnchor} paTestStart 
     * @param {IAnchor} paTestEnd 
     * @param {Integer} cch 
     * @param {Pointer<IAnchor>} ppaResultStart 
     * @param {Pointer<IAnchor>} ppaResultEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-queryinsert
     */
    QueryInsert(paTestStart, paTestEnd, cch, ppaResultStart, ppaResultEnd) {
        result := ComCall(7, this, "ptr", paTestStart, "ptr", paTestEnd, "uint", cch, "ptr*", ppaResultStart, "ptr*", ppaResultEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulIndex 
     * @param {Integer} ulCount 
     * @param {Pointer<TS_SELECTION_ANCHOR>} pSelection 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-getselection
     */
    GetSelection(ulIndex, ulCount, pSelection, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", ulIndex, "uint", ulCount, "ptr", pSelection, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<TS_SELECTION_ANCHOR>} pSelection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-setselection
     */
    SetSelection(ulCount, pSelection) {
        result := ComCall(9, this, "uint", ulCount, "ptr", pSelection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IAnchor} paStart 
     * @param {IAnchor} paEnd 
     * @param {PWSTR} pchText 
     * @param {Integer} cchReq 
     * @param {BOOL} fUpdateAnchor 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-gettext
     */
    GetText(dwFlags, paStart, paEnd, pchText, cchReq, fUpdateAnchor) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(10, this, "uint", dwFlags, "ptr", paStart, "ptr", paEnd, "ptr", pchText, "uint", cchReq, "uint*", &pcch := 0, "int", fUpdateAnchor, "HRESULT")
        return pcch
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IAnchor} paStart 
     * @param {IAnchor} paEnd 
     * @param {PWSTR} pchText 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-settext
     */
    SetText(dwFlags, paStart, paEnd, pchText, cch) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(11, this, "uint", dwFlags, "ptr", paStart, "ptr", paEnd, "ptr", pchText, "uint", cch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAnchor} paStart 
     * @param {IAnchor} paEnd 
     * @returns {IDataObject} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-getformattedtext
     */
    GetFormattedText(paStart, paEnd) {
        result := ComCall(12, this, "ptr", paStart, "ptr", paEnd, "ptr*", &ppDataObject := 0, "HRESULT")
        return IDataObject(ppDataObject)
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IAnchor} paPos 
     * @param {Pointer<Guid>} rguidService 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-getembedded
     */
    GetEmbedded(dwFlags, paPos, rguidService, riid) {
        result := ComCall(13, this, "uint", dwFlags, "ptr", paPos, "ptr", rguidService, "ptr", riid, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IAnchor} paStart 
     * @param {IAnchor} paEnd 
     * @param {IDataObject} pDataObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-insertembedded
     */
    InsertEmbedded(dwFlags, paStart, paEnd, pDataObject) {
        result := ComCall(14, this, "uint", dwFlags, "ptr", paStart, "ptr", paEnd, "ptr", pDataObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} cFilterAttrs 
     * @param {Pointer<Guid>} paFilterAttrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-requestsupportedattrs
     */
    RequestSupportedAttrs(dwFlags, cFilterAttrs, paFilterAttrs) {
        result := ComCall(15, this, "uint", dwFlags, "uint", cFilterAttrs, "ptr", paFilterAttrs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAnchor} paPos 
     * @param {Integer} cFilterAttrs 
     * @param {Pointer<Guid>} paFilterAttrs 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-requestattrsatposition
     */
    RequestAttrsAtPosition(paPos, cFilterAttrs, paFilterAttrs, dwFlags) {
        result := ComCall(16, this, "ptr", paPos, "uint", cFilterAttrs, "ptr", paFilterAttrs, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAnchor} paPos 
     * @param {Integer} cFilterAttrs 
     * @param {Pointer<Guid>} paFilterAttrs 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-requestattrstransitioningatposition
     */
    RequestAttrsTransitioningAtPosition(paPos, cFilterAttrs, paFilterAttrs, dwFlags) {
        result := ComCall(17, this, "ptr", paPos, "uint", cFilterAttrs, "ptr", paFilterAttrs, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAnchor} paStart 
     * @param {IAnchor} paHalt 
     * @param {Integer} cFilterAttrs 
     * @param {Pointer<Guid>} paFilterAttrs 
     * @param {Integer} dwFlags 
     * @param {Pointer<BOOL>} pfFound 
     * @param {Pointer<Integer>} plFoundOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-findnextattrtransition
     */
    FindNextAttrTransition(paStart, paHalt, cFilterAttrs, paFilterAttrs, dwFlags, pfFound, plFoundOffset) {
        pfFoundMarshal := pfFound is VarRef ? "int*" : "ptr"
        plFoundOffsetMarshal := plFoundOffset is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, "ptr", paStart, "ptr", paHalt, "uint", cFilterAttrs, "ptr", paFilterAttrs, "uint", dwFlags, pfFoundMarshal, pfFound, plFoundOffsetMarshal, plFoundOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<TS_ATTRVAL>} paAttrVals 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-retrieverequestedattrs
     */
    RetrieveRequestedAttrs(ulCount, paAttrVals, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, "uint", ulCount, "ptr", paAttrVals, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IAnchor} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-getstart
     */
    GetStart() {
        result := ComCall(20, this, "ptr*", &ppaStart := 0, "HRESULT")
        return IAnchor(ppaStart)
    }

    /**
     * 
     * @returns {IAnchor} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-getend
     */
    GetEnd() {
        result := ComCall(21, this, "ptr*", &ppaEnd := 0, "HRESULT")
        return IAnchor(ppaEnd)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-getactiveview
     */
    GetActiveView() {
        result := ComCall(22, this, "uint*", &pvcView := 0, "HRESULT")
        return pvcView
    }

    /**
     * 
     * @param {Integer} vcView 
     * @param {Pointer<POINT>} ptScreen 
     * @param {Integer} dwFlags 
     * @returns {IAnchor} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-getanchorfrompoint
     */
    GetAnchorFromPoint(vcView, ptScreen, dwFlags) {
        result := ComCall(23, this, "uint", vcView, "ptr", ptScreen, "uint", dwFlags, "ptr*", &ppaSite := 0, "HRESULT")
        return IAnchor(ppaSite)
    }

    /**
     * 
     * @param {Integer} vcView 
     * @param {IAnchor} paStart 
     * @param {IAnchor} paEnd 
     * @param {Pointer<RECT>} prc 
     * @param {Pointer<BOOL>} pfClipped 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-gettextext
     */
    GetTextExt(vcView, paStart, paEnd, prc, pfClipped) {
        pfClippedMarshal := pfClipped is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, "uint", vcView, "ptr", paStart, "ptr", paEnd, "ptr", prc, pfClippedMarshal, pfClipped, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} vcView 
     * @returns {RECT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-getscreenext
     */
    GetScreenExt(vcView) {
        prc := RECT()
        result := ComCall(25, this, "uint", vcView, "ptr", prc, "HRESULT")
        return prc
    }

    /**
     * 
     * @param {Integer} vcView 
     * @returns {HWND} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-getwnd
     */
    GetWnd(vcView) {
        phwnd := HWND()
        result := ComCall(26, this, "uint", vcView, "ptr", phwnd, "HRESULT")
        return phwnd
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidService 
     * @param {Pointer<FORMATETC>} pFormatEtc 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-queryinsertembedded
     */
    QueryInsertEmbedded(pguidService, pFormatEtc) {
        result := ComCall(27, this, "ptr", pguidService, "ptr", pFormatEtc, "int*", &pfInsertable := 0, "HRESULT")
        return pfInsertable
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pchText 
     * @param {Integer} cch 
     * @param {Pointer<IAnchor>} ppaStart 
     * @param {Pointer<IAnchor>} ppaEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-inserttextatselection
     */
    InsertTextAtSelection(dwFlags, pchText, cch, ppaStart, ppaEnd) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(28, this, "uint", dwFlags, "ptr", pchText, "uint", cch, "ptr*", ppaStart, "ptr*", ppaEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IDataObject} pDataObject 
     * @param {Pointer<IAnchor>} ppaStart 
     * @param {Pointer<IAnchor>} ppaEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchor-insertembeddedatselection
     */
    InsertEmbeddedAtSelection(dwFlags, pDataObject, ppaStart, ppaEnd) {
        result := ComCall(29, this, "uint", dwFlags, "ptr", pDataObject, "ptr*", ppaStart, "ptr*", ppaEnd, "HRESULT")
        return result
    }
}
