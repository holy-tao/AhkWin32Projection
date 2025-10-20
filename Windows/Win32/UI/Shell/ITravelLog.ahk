#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Deprecated. Exposes methods that maintain and manipulate a record of travel in the browser.
 * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nn-shdeprecated-itravellog
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ITravelLog extends IUnknown{
    /**
     * The interface identifier for ITravelLog
     * @type {Guid}
     */
    static IID => Guid("{66a9cb08-4802-11d2-a561-00a0c92dbfe8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} punk 
     * @param {BOOL} fIsLocalAnchor 
     * @returns {HRESULT} 
     */
    AddEntry(punk, fIsLocalAnchor) {
        result := ComCall(3, this, "ptr", punk, "int", fIsLocalAnchor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} punk 
     * @param {BOOL} fIsLocalAnchor 
     * @returns {HRESULT} 
     */
    UpdateEntry(punk, fIsLocalAnchor) {
        result := ComCall(4, this, "ptr", punk, "int", fIsLocalAnchor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} punk 
     * @param {Pointer<IUnknown>} punkHLBrowseContext 
     * @returns {HRESULT} 
     */
    UpdateExternal(punk, punkHLBrowseContext) {
        result := ComCall(5, this, "ptr", punk, "ptr", punkHLBrowseContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} punk 
     * @param {Integer} iOffset 
     * @returns {HRESULT} 
     */
    Travel(punk, iOffset) {
        result := ComCall(6, this, "ptr", punk, "int", iOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} punk 
     * @param {Integer} iOffset 
     * @param {Pointer<ITravelEntry>} ppte 
     * @returns {HRESULT} 
     */
    GetTravelEntry(punk, iOffset, ppte) {
        result := ComCall(7, this, "ptr", punk, "int", iOffset, "ptr", ppte, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} punk 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Pointer<ITravelEntry>} ppte 
     * @returns {HRESULT} 
     */
    FindTravelEntry(punk, pidl, ppte) {
        result := ComCall(8, this, "ptr", punk, "ptr", pidl, "ptr", ppte, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} punk 
     * @param {Integer} iOffset 
     * @param {Integer} idsTemplate 
     * @param {PWSTR} pwzText 
     * @param {Integer} cchText 
     * @returns {HRESULT} 
     */
    GetToolTipText(punk, iOffset, idsTemplate, pwzText, cchText) {
        pwzText := pwzText is String ? StrPtr(pwzText) : pwzText

        result := ComCall(9, this, "ptr", punk, "int", iOffset, "int", idsTemplate, "ptr", pwzText, "uint", cchText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} punk 
     * @param {HMENU} hmenu 
     * @param {Integer} nPos 
     * @param {Integer} idFirst 
     * @param {Integer} idLast 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    InsertMenuEntries(punk, hmenu, nPos, idFirst, idLast, dwFlags) {
        hmenu := hmenu is Win32Handle ? NumGet(hmenu, "ptr") : hmenu

        result := ComCall(10, this, "ptr", punk, "ptr", hmenu, "int", nPos, "int", idFirst, "int", idLast, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITravelLog>} pptl 
     * @returns {HRESULT} 
     */
    Clone(pptl) {
        result := ComCall(11, this, "ptr", pptl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} punk 
     * @returns {Integer} 
     */
    CountEntries(punk) {
        result := ComCall(12, this, "ptr", punk, "uint")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Revert() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
