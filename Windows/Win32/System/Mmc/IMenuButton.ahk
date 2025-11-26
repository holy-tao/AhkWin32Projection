#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IMenuButton interface enables the user to add and manage menu buttons for a snap-in.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-imenubutton
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IMenuButton extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMenuButton
     * @type {Guid}
     */
    static IID => Guid("{951ed750-d080-11d0-b197-000000000000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddButton", "SetButton", "SetButtonState"]

    /**
     * The IMenuButton::AddButton method enables a user to add a button to the MMC menu bar for a particular view.
     * @param {Integer} idCommand A value that specifies a user-supplied value that uniquely identifies the button to be added to the menu bar.
     * @param {PWSTR} lpButtonText A pointer to the text value (a null-terminated string) to be displayed on the button.
     * @param {PWSTR} lpTooltipText A pointer to the text value (a null-terminated string) to be displayed when the user places the mouse pointer on the button.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-imenubutton-addbutton
     */
    AddButton(idCommand, lpButtonText, lpTooltipText) {
        lpButtonText := lpButtonText is String ? StrPtr(lpButtonText) : lpButtonText
        lpTooltipText := lpTooltipText is String ? StrPtr(lpTooltipText) : lpTooltipText

        result := ComCall(3, this, "int", idCommand, "ptr", lpButtonText, "ptr", lpTooltipText, "HRESULT")
        return result
    }

    /**
     * The IMenuButton::SetButton method enables a user to set the text attributes of a button in the menu bar that is changed.
     * @param {Integer} idCommand A value that specifies a user-supplied value that uniquely identifies the button to be added to the menu bar.
     * @param {PWSTR} lpButtonText A pointer to the text value (a null-terminated string) to be displayed on the button.
     * @param {PWSTR} lpTooltipText A pointer to the text value (a null-terminated string) to be displayed when the user places the mouse pointer on the button.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-imenubutton-setbutton
     */
    SetButton(idCommand, lpButtonText, lpTooltipText) {
        lpButtonText := lpButtonText is String ? StrPtr(lpButtonText) : lpButtonText
        lpTooltipText := lpTooltipText is String ? StrPtr(lpTooltipText) : lpTooltipText

        result := ComCall(4, this, "int", idCommand, "ptr", lpButtonText, "ptr", lpTooltipText, "HRESULT")
        return result
    }

    /**
     * The IMenuButton::SetButtonState method enables a user to change the state of a menu button.
     * @param {Integer} idCommand A value that specifies a user-supplied value that uniquely identifies the menu button in which the state is being changed.
     * @param {Integer} nState 
     * @param {BOOL} bState A value that specifies whether the state is to be turned on or off. <b>TRUE</b> indicates that the  button state is on; otherwise, set to <b>FALSE</b>.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-imenubutton-setbuttonstate
     */
    SetButtonState(idCommand, nState, bState) {
        result := ComCall(5, this, "int", idCommand, "int", nState, "int", bState, "HRESULT")
        return result
    }
}
