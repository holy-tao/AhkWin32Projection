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
     * Enables a snap-in to add an image to the toolbar.
     * @param {Integer} nImages An index of images that are available. A value that specifies the number of images in the bitmap being passed in hbmp.
     * @param {HBITMAP} hbmp A handle to the bitmap to be added to the toolbar.
     * 
     * <div class="alert"><b>Note</b>  The snap-in owns this resource and must free it. A memory leak will occur if the snap-in does not free hbmp.</div>
     * <div> </div>
     * @param {Integer} cxSize The height, in pixels, of the bitmap to be added. (In version 1.0, MMC only supported a cxSize of 16.)
     * @param {Integer} cySize The width, in pixels, of the bitmap to be added. (In version 1.0, MMC only supported a cySize of 16.)
     * @param {COLORREF} crMask The color used to generate a mask to overlay the images on the toolbar buttons.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-itoolbar-addbitmap
     */
    AddBitmap(nImages, hbmp, cxSize, cySize, crMask) {
        hbmp := hbmp is Win32Handle ? NumGet(hbmp, "ptr") : hbmp

        result := ComCall(3, this, "int", nImages, "ptr", hbmp, "int", cxSize, "int", cySize, "uint", crMask, "HRESULT")
        return result
    }

    /**
     * Enables a snap-in to add an array of buttons to the toolbar.
     * @param {Integer} nButtons The number of buttons in the array.
     * @param {Pointer<MMCBUTTON>} lpButtons A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmcbutton">MMCBUTTON</a> structure that contains information necessary for creating a button on the toolbar.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-itoolbar-addbuttons
     */
    AddButtons(nButtons, lpButtons) {
        result := ComCall(4, this, "int", nButtons, "ptr", lpButtons, "HRESULT")
        return result
    }

    /**
     * Enables a snap-in to add a single button to the toolbar.
     * @param {Integer} nIndex An internal index at which the button will be inserted. The button is always placed at the end of the toolbar; the internal index is required if the button is to be deleted (by means of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-itoolbar-deletebutton">IToolbar::DeleteButton</a>).
     * @param {Pointer<MMCBUTTON>} lpButton A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmcbutton">MMCBUTTON</a> structure that defines the button to be inserted.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-itoolbar-insertbutton
     */
    InsertButton(nIndex, lpButton) {
        result := ComCall(5, this, "int", nIndex, "ptr", lpButton, "HRESULT")
        return result
    }

    /**
     * Enables a snap-in to remove a specified toolbar button.
     * @param {Integer} nIndex An index of the button to be removed from the toolbar.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-itoolbar-deletebutton
     */
    DeleteButton(nIndex) {
        result := ComCall(6, this, "int", nIndex, "HRESULT")
        return result
    }

    /**
     * Enables a snap-in to obtain an attribute of a button.
     * @param {Integer} idCommand The command identifier of the toolbar button.
     * @param {Integer} nState A value that identifies the possible states of the button. Can be one of the following:
     * @returns {BOOL} A pointer to the state information that is returned.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-itoolbar-getbuttonstate
     */
    GetButtonState(idCommand, nState) {
        result := ComCall(7, this, "int", idCommand, "int", nState, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * Enables a snap-in to set an attribute of a button.
     * @param {Integer} idCommand A unique value that the snap-in has associated with a button using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-itoolbar-insertbutton">InsertButton</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-itoolbar-addbuttons">AddButtons</a> method using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmcbutton">MMCBUTTON</a> structure.
     * @param {Integer} nState A value that specifies the state to be set for the button. Can be any one of the following:
     * @param {BOOL} bState A value that specifies whether the state identified in nState is set to <b>TRUE</b> or <b>FALSE</b>. <b>TRUE</b> sets the button state to the state identified by nState and <b>FALSE</b> clears the state (if it is already set).
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-itoolbar-setbuttonstate
     */
    SetButtonState(idCommand, nState, bState) {
        result := ComCall(8, this, "int", idCommand, "int", nState, "int", bState, "HRESULT")
        return result
    }
}
