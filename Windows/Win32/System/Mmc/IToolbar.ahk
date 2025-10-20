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
     * 
     * @param {Integer} nImages 
     * @param {HBITMAP} hbmp 
     * @param {Integer} cxSize 
     * @param {Integer} cySize 
     * @param {COLORREF} crMask 
     * @returns {HRESULT} 
     */
    AddBitmap(nImages, hbmp, cxSize, cySize, crMask) {
        hbmp := hbmp is Win32Handle ? NumGet(hbmp, "ptr") : hbmp

        result := ComCall(3, this, "int", nImages, "ptr", hbmp, "int", cxSize, "int", cySize, "uint", crMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nButtons 
     * @param {Pointer<MMCBUTTON>} lpButtons 
     * @returns {HRESULT} 
     */
    AddButtons(nButtons, lpButtons) {
        result := ComCall(4, this, "int", nButtons, "ptr", lpButtons, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<MMCBUTTON>} lpButton 
     * @returns {HRESULT} 
     */
    InsertButton(nIndex, lpButton) {
        result := ComCall(5, this, "int", nIndex, "ptr", lpButton, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {HRESULT} 
     */
    DeleteButton(nIndex) {
        result := ComCall(6, this, "int", nIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} idCommand 
     * @param {Integer} nState 
     * @param {Pointer<BOOL>} pState 
     * @returns {HRESULT} 
     */
    GetButtonState(idCommand, nState, pState) {
        result := ComCall(7, this, "int", idCommand, "int", nState, "ptr", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} idCommand 
     * @param {Integer} nState 
     * @param {BOOL} bState 
     * @returns {HRESULT} 
     */
    SetButtonState(idCommand, nState, bState) {
        result := ComCall(8, this, "int", idCommand, "int", nState, "int", bState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
