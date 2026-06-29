#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\MMC_BUTTON_STATE.ahk" { MMC_BUTTON_STATE }

/**
 * The IMenuButton interface enables the user to add and manage menu buttons for a snap-in.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-imenubutton
 * @namespace Windows.Win32.System.Mmc
 */
export default struct IMenuButton extends IUnknown {
    /**
     * The interface identifier for IMenuButton
     * @type {Guid}
     */
    static IID := Guid("{951ed750-d080-11d0-b197-000000000000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMenuButton interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddButton      : IntPtr
        SetButton      : IntPtr
        SetButtonState : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMenuButton.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IMenuButton::AddButton method enables a user to add a button to the MMC menu bar for a particular view.
     * @remarks
     * Buttons added to the MMC menu bar for a particular view are always appended to the buttons already present. The initial state of any menu button is hidden and disabled.
     * 
     * When the snap-in loses the focus, these buttons are automatically removed from the menu bar. As a result, they must be added each time the snap-in gets the focus.
     * 
     * This method can be called by primary or extension snap-ins.
     * @param {Integer} idCommand A value that specifies a user-supplied value that uniquely identifies the button to be added to the menu bar.
     * @param {PWSTR} lpButtonText A pointer to the text value (a null-terminated string) to be displayed on the button.
     * @param {PWSTR} lpTooltipText A pointer to the text value (a null-terminated string) to be displayed when the user places the mouse pointer on the button.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-imenubutton-addbutton
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
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-imenubutton-setbutton
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
     * @param {MMC_BUTTON_STATE} nState 
     * @param {BOOL} bState A value that specifies whether the state is to be turned on or off. <b>TRUE</b> indicates that the  button state is on; otherwise, set to <b>FALSE</b>.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-imenubutton-setbuttonstate
     */
    SetButtonState(idCommand, nState, bState) {
        result := ComCall(5, this, "int", idCommand, MMC_BUTTON_STATE, nState, BOOL, bState, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMenuButton.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddButton := CallbackCreate(GetMethod(implObj, "AddButton"), flags, 4)
        this.vtbl.SetButton := CallbackCreate(GetMethod(implObj, "SetButton"), flags, 4)
        this.vtbl.SetButtonState := CallbackCreate(GetMethod(implObj, "SetButtonState"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddButton)
        CallbackFree(this.vtbl.SetButton)
        CallbackFree(this.vtbl.SetButtonState)
    }
}
