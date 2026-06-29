#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IControlbar.ahk" { IControlbar }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\MMC_NOTIFY_TYPE.ahk" { MMC_NOTIFY_TYPE }

/**
 * The IExtendControlbar interface enables an extension to add control bars to the console. This provides a way to improve the functionality and appearance of your snap-in by adding toolbars or other user interface enhancements.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-iextendcontrolbar
 * @namespace Windows.Win32.System.Mmc
 */
export default struct IExtendControlbar extends IUnknown {
    /**
     * The interface identifier for IExtendControlbar
     * @type {Guid}
     */
    static IID := Guid("{49506520-6f40-11d0-a98b-00c04fd8d565}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IExtendControlbar interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetControlbar    : IntPtr
        ControlbarNotify : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IExtendControlbar.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IExtendControlbar::SetControlbar method attaches or detaches a control bar.
     * @remarks
     * As items are selected and deselected, snap-ins are activated and deactivated. When a snap-in is activated, the console calls 
     * SetControlbar with a non-<b>NULL</b> pControlbar value. The snap-in should call AddRef on this IControlBar. The snap-in should also use this opportunity to attach controls. Similarly, when the snap-in is deactivated, the console calls 
     * SetControlbar with a <b>NULL</b> pControlbar. The snap-in should then detach its controls and call Release on the saved IControlBar.
     * @param {IControlbar} pControlbar A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icontrolbar">IControlbar</a> interface on the control bar object to be set. A non-<b>NULL</b> value attaches a control bar; a <b>NULL</b> value detaches a control bar.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendcontrolbar-setcontrolbar
     */
    SetControlbar(pControlbar) {
        result := ComCall(3, this, "ptr", pControlbar, "HRESULT")
        return result
    }

    /**
     * The IExtendControlbar::ControlbarNotify method specifies the notification sent to the snap-in from the console as a result of user action.
     * @remarks
     * For more information, see the individual notifications. The snap-in should return S_FALSE for any notification it does not handle.
     * @param {MMC_NOTIFY_TYPE} event A value that specifies one of the following:
     * @param {LPARAM} arg Depends on the event parameter. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmc-notifications">MMC Notifications</a>.
     * @param {LPARAM} param2 
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendcontrolbar-controlbarnotify
     */
    ControlbarNotify(event, arg, param2) {
        result := ComCall(4, this, MMC_NOTIFY_TYPE, event, LPARAM, arg, LPARAM, param2, "HRESULT")
        return result
    }

    Query(iid) {
        if (IExtendControlbar.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetControlbar := CallbackCreate(GetMethod(implObj, "SetControlbar"), flags, 2)
        this.vtbl.ControlbarNotify := CallbackCreate(GetMethod(implObj, "ControlbarNotify"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetControlbar)
        CallbackFree(this.vtbl.ControlbarNotify)
    }
}
