#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class ITipAutoCompleteClient extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITipAutoCompleteClient
     * @type {Guid}
     */
    static IID => Guid("{5e078e03-8265-4bbe-9487-d242edbef910}")

    /**
     * The class identifier for TipAutoCompleteClient
     * @type {Guid}
     */
    static CLSID => Guid("{807c1e6c-1d00-453f-b920-b61bb7cdd997}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AdviseProvider", "UnadviseProvider", "UserSelection", "PreferredRects", "RequestShowUI"]

    /**
     * 
     * @param {HWND} hWndField 
     * @param {ITipAutoCompleteProvider} pIProvider 
     * @returns {HRESULT} 
     */
    AdviseProvider(hWndField, pIProvider) {
        hWndField := hWndField is Win32Handle ? NumGet(hWndField, "ptr") : hWndField

        result := ComCall(3, this, "ptr", hWndField, "ptr", pIProvider, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hWndField 
     * @param {ITipAutoCompleteProvider} pIProvider 
     * @returns {HRESULT} 
     */
    UnadviseProvider(hWndField, pIProvider) {
        hWndField := hWndField is Win32Handle ? NumGet(hWndField, "ptr") : hWndField

        result := ComCall(4, this, "ptr", hWndField, "ptr", pIProvider, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UserSelection() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcACList 
     * @param {Pointer<RECT>} prcField 
     * @param {Pointer<RECT>} prcModifiedACList 
     * @param {Pointer<BOOL>} pfShownAboveTip 
     * @returns {HRESULT} 
     */
    PreferredRects(prcACList, prcField, prcModifiedACList, pfShownAboveTip) {
        pfShownAboveTipMarshal := pfShownAboveTip is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", prcACList, "ptr", prcField, "ptr", prcModifiedACList, pfShownAboveTipMarshal, pfShownAboveTip, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hWndList 
     * @returns {BOOL} 
     */
    RequestShowUI(hWndList) {
        hWndList := hWndList is Win32Handle ? NumGet(hWndList, "ptr") : hWndList

        result := ComCall(7, this, "ptr", hWndList, "int*", &pfAllowShowing := 0, "HRESULT")
        return pfAllowShowing
    }
}
