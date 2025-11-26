#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method for the handling of a mouse click or shortcut menu access in a notification balloon. Used with IUserNotification2::Show.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-iusernotificationcallback
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IUserNotificationCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserNotificationCallback
     * @type {Guid}
     */
    static IID => Guid("{19108294-0441-4aff-8013-fa0a730b0bea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnBalloonUserClick", "OnLeftClick", "OnContextMenu"]

    /**
     * Called when the user clicks the balloon. The application may respond with an action that is suitable for the balloon being clicked.
     * @param {Pointer<POINT>} pt Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a>*</b>
     * 
     * Takes a pointer to the <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure which, upon method return, points to the position of the mouse in screen space where the mouse click occurred.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iusernotificationcallback-onballoonuserclick
     */
    OnBalloonUserClick(pt) {
        result := ComCall(3, this, "ptr", pt, "HRESULT")
        return result
    }

    /**
     * Called when the user clicks the icon in the notification area. The applications may launch some customary UI in response.
     * @param {Pointer<POINT>} pt Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a>*</b>
     * 
     * Takes a pointer to the <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure which, when the method returns, points to the position of the mouse in the screen space where the mouse click occurred.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iusernotificationcallback-onleftclick
     */
    OnLeftClick(pt) {
        result := ComCall(4, this, "ptr", pt, "HRESULT")
        return result
    }

    /**
     * Called when the user right-clicks (or presses SHIFT+F10) the icon in the notification area. The application should show its context menu in response.
     * @param {Pointer<POINT>} pt Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a>*</b>
     * 
     * When returned by the method, takes a pointer to the <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure at the position of the mouse in the screen space where the click occurred.
     * 
     * In the case where user presses SHIFT+F10, the pointer points to the center of the icon in the screen space.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iusernotificationcallback-oncontextmenu
     */
    OnContextMenu(pt) {
        result := ComCall(5, this, "ptr", pt, "HRESULT")
        return result
    }
}
