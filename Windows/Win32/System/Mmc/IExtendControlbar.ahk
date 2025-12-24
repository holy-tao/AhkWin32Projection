#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IExtendControlbar interface enables an extension to add control bars to the console. This provides a way to improve the functionality and appearance of your snap-in by adding toolbars or other user interface enhancements.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iextendcontrolbar
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IExtendControlbar extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExtendControlbar
     * @type {Guid}
     */
    static IID => Guid("{49506520-6f40-11d0-a98b-00c04fd8d565}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetControlbar", "ControlbarNotify"]

    /**
     * The IExtendControlbar::SetControlbar method attaches or detaches a control bar.
     * @param {IControlbar} pControlbar A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icontrolbar">IControlbar</a> interface on the control bar object to be set. A non-<b>NULL</b> value attaches a control bar; a <b>NULL</b> value detaches a control bar.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iextendcontrolbar-setcontrolbar
     */
    SetControlbar(pControlbar) {
        result := ComCall(3, this, "ptr", pControlbar, "HRESULT")
        return result
    }

    /**
     * The IExtendControlbar::ControlbarNotify method specifies the notification sent to the snap-in from the console as a result of user action.
     * @param {Integer} event A value that specifies one of the following:
     * @param {LPARAM} arg Depends on the event parameter. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmc-notifications">MMC Notifications</a>.
     * @param {LPARAM} param2 
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iextendcontrolbar-controlbarnotify
     */
    ControlbarNotify(event, arg, param2) {
        result := ComCall(4, this, "int", event, "ptr", arg, "ptr", param2, "HRESULT")
        return result
    }
}
