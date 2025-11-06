#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IToolbar interface is used to create new toolbars, to add items to them, to extend the toolbars, and to display the resultant new toolbars. Each toolbar is created on its own band within the control bar.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-itoolbar
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IToolbar extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToolbar
     * @type {Guid}
     */
    static IID => Guid("{43136eb9-d36c-11cf-adbc-00aa00a80033}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddBitmap", "AddButtons", "InsertButton", "DeleteButton", "GetButtonState", "SetButtonState"]

    /**
     * 
     * @param {Integer} nImages 
     * @param {HBITMAP} hbmp 
     * @param {Integer} cxSize 
     * @param {Integer} cySize 
     * @param {COLORREF} crMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-itoolbar-addbitmap
     */
    AddBitmap(nImages, hbmp, cxSize, cySize, crMask) {
        hbmp := hbmp is Win32Handle ? NumGet(hbmp, "ptr") : hbmp

        result := ComCall(3, this, "int", nImages, "ptr", hbmp, "int", cxSize, "int", cySize, "uint", crMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nButtons 
     * @param {Pointer<MMCBUTTON>} lpButtons 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-itoolbar-addbuttons
     */
    AddButtons(nButtons, lpButtons) {
        result := ComCall(4, this, "int", nButtons, "ptr", lpButtons, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<MMCBUTTON>} lpButton 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-itoolbar-insertbutton
     */
    InsertButton(nIndex, lpButton) {
        result := ComCall(5, this, "int", nIndex, "ptr", lpButton, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-itoolbar-deletebutton
     */
    DeleteButton(nIndex) {
        result := ComCall(6, this, "int", nIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} idCommand 
     * @param {Integer} nState 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-itoolbar-getbuttonstate
     */
    GetButtonState(idCommand, nState) {
        result := ComCall(7, this, "int", idCommand, "int", nState, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * 
     * @param {Integer} idCommand 
     * @param {Integer} nState 
     * @param {BOOL} bState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-itoolbar-setbuttonstate
     */
    SetButtonState(idCommand, nState, bState) {
        result := ComCall(8, this, "int", idCommand, "int", nState, "int", bState, "HRESULT")
        return result
    }
}
