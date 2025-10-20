#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITextStoreAnchor interface is implemented by a Microsoft Active Accessibility client and is used by the TSF manager to manipulate text streams.
 * @see https://docs.microsoft.com/windows/win32/api//textstor/nn-textstor-itextstoreanchor
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITextStoreAnchor extends IUnknown{
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
     * @param {Pointer<IAnchor>} paTestStart 
     * @param {Pointer<IAnchor>} paTestEnd 
     * @param {Integer} cch 
     * @param {Pointer<IAnchor>} ppaResultStart 
     * @param {Pointer<IAnchor>} ppaResultEnd 
     * @returns {HRESULT} 
     */
    QueryInsert(paTestStart, paTestEnd, cch, ppaResultStart, ppaResultEnd) {
        result := ComCall(7, this, "ptr", paTestStart, "ptr", paTestEnd, "uint", cch, "ptr", ppaResultStart, "ptr", ppaResultEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulIndex 
     * @param {Integer} ulCount 
     * @param {Pointer<TS_SELECTION_ANCHOR>} pSelection 
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
     * @param {Pointer<TS_SELECTION_ANCHOR>} pSelection 
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
     * @param {Integer} dwFlags 
     * @param {Pointer<IAnchor>} paStart 
     * @param {Pointer<IAnchor>} paEnd 
     * @param {PWSTR} pchText 
     * @param {Integer} cchReq 
     * @param {Pointer<UInt32>} pcch 
     * @param {BOOL} fUpdateAnchor 
     * @returns {HRESULT} 
     */
    GetText(dwFlags, paStart, paEnd, pchText, cchReq, pcch, fUpdateAnchor) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(10, this, "uint", dwFlags, "ptr", paStart, "ptr", paEnd, "ptr", pchText, "uint", cchReq, "uint*", pcch, "int", fUpdateAnchor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IAnchor>} paStart 
     * @param {Pointer<IAnchor>} paEnd 
     * @param {PWSTR} pchText 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     */
    SetText(dwFlags, paStart, paEnd, pchText, cch) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(11, this, "uint", dwFlags, "ptr", paStart, "ptr", paEnd, "ptr", pchText, "uint", cch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAnchor>} paStart 
     * @param {Pointer<IAnchor>} paEnd 
     * @param {Pointer<IDataObject>} ppDataObject 
     * @returns {HRESULT} 
     */
    GetFormattedText(paStart, paEnd, ppDataObject) {
        result := ComCall(12, this, "ptr", paStart, "ptr", paEnd, "ptr", ppDataObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IAnchor>} paPos 
     * @param {Pointer<Guid>} rguidService 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     */
    GetEmbedded(dwFlags, paPos, rguidService, riid, ppunk) {
        result := ComCall(13, this, "uint", dwFlags, "ptr", paPos, "ptr", rguidService, "ptr", riid, "ptr", ppunk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IAnchor>} paStart 
     * @param {Pointer<IAnchor>} paEnd 
     * @param {Pointer<IDataObject>} pDataObject 
     * @returns {HRESULT} 
     */
    InsertEmbedded(dwFlags, paStart, paEnd, pDataObject) {
        result := ComCall(14, this, "uint", dwFlags, "ptr", paStart, "ptr", paEnd, "ptr", pDataObject, "int")
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
        result := ComCall(15, this, "uint", dwFlags, "uint", cFilterAttrs, "ptr", paFilterAttrs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAnchor>} paPos 
     * @param {Integer} cFilterAttrs 
     * @param {Pointer<Guid>} paFilterAttrs 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    RequestAttrsAtPosition(paPos, cFilterAttrs, paFilterAttrs, dwFlags) {
        result := ComCall(16, this, "ptr", paPos, "uint", cFilterAttrs, "ptr", paFilterAttrs, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAnchor>} paPos 
     * @param {Integer} cFilterAttrs 
     * @param {Pointer<Guid>} paFilterAttrs 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    RequestAttrsTransitioningAtPosition(paPos, cFilterAttrs, paFilterAttrs, dwFlags) {
        result := ComCall(17, this, "ptr", paPos, "uint", cFilterAttrs, "ptr", paFilterAttrs, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAnchor>} paStart 
     * @param {Pointer<IAnchor>} paHalt 
     * @param {Integer} cFilterAttrs 
     * @param {Pointer<Guid>} paFilterAttrs 
     * @param {Integer} dwFlags 
     * @param {Pointer<BOOL>} pfFound 
     * @param {Pointer<Int32>} plFoundOffset 
     * @returns {HRESULT} 
     */
    FindNextAttrTransition(paStart, paHalt, cFilterAttrs, paFilterAttrs, dwFlags, pfFound, plFoundOffset) {
        result := ComCall(18, this, "ptr", paStart, "ptr", paHalt, "uint", cFilterAttrs, "ptr", paFilterAttrs, "uint", dwFlags, "ptr", pfFound, "int*", plFoundOffset, "int")
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
        result := ComCall(19, this, "uint", ulCount, "ptr", paAttrVals, "uint*", pcFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAnchor>} ppaStart 
     * @returns {HRESULT} 
     */
    GetStart(ppaStart) {
        result := ComCall(20, this, "ptr", ppaStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAnchor>} ppaEnd 
     * @returns {HRESULT} 
     */
    GetEnd(ppaEnd) {
        result := ComCall(21, this, "ptr", ppaEnd, "int")
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
        result := ComCall(22, this, "uint*", pvcView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} vcView 
     * @param {Pointer<POINT>} ptScreen 
     * @param {Integer} dwFlags 
     * @param {Pointer<IAnchor>} ppaSite 
     * @returns {HRESULT} 
     */
    GetAnchorFromPoint(vcView, ptScreen, dwFlags, ppaSite) {
        result := ComCall(23, this, "uint", vcView, "ptr", ptScreen, "uint", dwFlags, "ptr", ppaSite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} vcView 
     * @param {Pointer<IAnchor>} paStart 
     * @param {Pointer<IAnchor>} paEnd 
     * @param {Pointer<RECT>} prc 
     * @param {Pointer<BOOL>} pfClipped 
     * @returns {HRESULT} 
     */
    GetTextExt(vcView, paStart, paEnd, prc, pfClipped) {
        result := ComCall(24, this, "uint", vcView, "ptr", paStart, "ptr", paEnd, "ptr", prc, "ptr", pfClipped, "int")
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
        result := ComCall(25, this, "uint", vcView, "ptr", prc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} vcView 
     * @param {Pointer<HWND>} phwnd 
     * @returns {HRESULT} 
     */
    GetWnd(vcView, phwnd) {
        result := ComCall(26, this, "uint", vcView, "ptr", phwnd, "int")
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
        result := ComCall(27, this, "ptr", pguidService, "ptr", pFormatEtc, "ptr", pfInsertable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pchText 
     * @param {Integer} cch 
     * @param {Pointer<IAnchor>} ppaStart 
     * @param {Pointer<IAnchor>} ppaEnd 
     * @returns {HRESULT} 
     */
    InsertTextAtSelection(dwFlags, pchText, cch, ppaStart, ppaEnd) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(28, this, "uint", dwFlags, "ptr", pchText, "uint", cch, "ptr", ppaStart, "ptr", ppaEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDataObject>} pDataObject 
     * @param {Pointer<IAnchor>} ppaStart 
     * @param {Pointer<IAnchor>} ppaEnd 
     * @returns {HRESULT} 
     */
    InsertEmbeddedAtSelection(dwFlags, pDataObject, ppaStart, ppaEnd) {
        result := ComCall(29, this, "uint", dwFlags, "ptr", pDataObject, "ptr", ppaStart, "ptr", ppaEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
