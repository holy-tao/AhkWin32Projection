#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITravelEntry.ahk
#Include .\ITravelLog.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Deprecated. Exposes methods that maintain and manipulate a record of travel in the browser.
 * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nn-shdeprecated-itravellog
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ITravelLog extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddEntry", "UpdateEntry", "UpdateExternal", "Travel", "GetTravelEntry", "FindTravelEntry", "GetToolTipText", "InsertMenuEntries", "Clone", "CountEntries", "Revert"]

    /**
     * 
     * @param {IUnknown} punk 
     * @param {BOOL} fIsLocalAnchor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravellog-addentry
     */
    AddEntry(punk, fIsLocalAnchor) {
        result := ComCall(3, this, "ptr", punk, "int", fIsLocalAnchor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punk 
     * @param {BOOL} fIsLocalAnchor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravellog-updateentry
     */
    UpdateEntry(punk, fIsLocalAnchor) {
        result := ComCall(4, this, "ptr", punk, "int", fIsLocalAnchor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punk 
     * @param {IUnknown} punkHLBrowseContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravellog-updateexternal
     */
    UpdateExternal(punk, punkHLBrowseContext) {
        result := ComCall(5, this, "ptr", punk, "ptr", punkHLBrowseContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punk 
     * @param {Integer} iOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravellog-travel
     */
    Travel(punk, iOffset) {
        result := ComCall(6, this, "ptr", punk, "int", iOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punk 
     * @param {Integer} iOffset 
     * @returns {ITravelEntry} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravellog-gettravelentry
     */
    GetTravelEntry(punk, iOffset) {
        result := ComCall(7, this, "ptr", punk, "int", iOffset, "ptr*", &ppte := 0, "HRESULT")
        return ITravelEntry(ppte)
    }

    /**
     * 
     * @param {IUnknown} punk 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @returns {ITravelEntry} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravellog-findtravelentry
     */
    FindTravelEntry(punk, pidl) {
        result := ComCall(8, this, "ptr", punk, "ptr", pidl, "ptr*", &ppte := 0, "HRESULT")
        return ITravelEntry(ppte)
    }

    /**
     * 
     * @param {IUnknown} punk 
     * @param {Integer} iOffset 
     * @param {Integer} idsTemplate 
     * @param {PWSTR} pwzText 
     * @param {Integer} cchText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravellog-gettooltiptext
     */
    GetToolTipText(punk, iOffset, idsTemplate, pwzText, cchText) {
        pwzText := pwzText is String ? StrPtr(pwzText) : pwzText

        result := ComCall(9, this, "ptr", punk, "int", iOffset, "int", idsTemplate, "ptr", pwzText, "uint", cchText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punk 
     * @param {HMENU} hmenu 
     * @param {Integer} nPos 
     * @param {Integer} idFirst 
     * @param {Integer} idLast 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravellog-insertmenuentries
     */
    InsertMenuEntries(punk, hmenu, nPos, idFirst, idLast, dwFlags) {
        hmenu := hmenu is Win32Handle ? NumGet(hmenu, "ptr") : hmenu

        result := ComCall(10, this, "ptr", punk, "ptr", hmenu, "int", nPos, "int", idFirst, "int", idLast, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ITravelLog} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravellog-clone
     */
    Clone() {
        result := ComCall(11, this, "ptr*", &pptl := 0, "HRESULT")
        return ITravelLog(pptl)
    }

    /**
     * 
     * @param {IUnknown} punk 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravellog-countentries
     */
    CountEntries(punk) {
        result := ComCall(12, this, "ptr", punk, "uint")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravellog-revert
     */
    Revert() {
        result := ComCall(13, this, "HRESULT")
        return result
    }
}
