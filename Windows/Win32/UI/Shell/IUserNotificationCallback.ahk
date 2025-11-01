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
     * 
     * @param {Pointer<POINT>} pt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iusernotificationcallback-onballoonuserclick
     */
    OnBalloonUserClick(pt) {
        result := ComCall(3, this, "ptr", pt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} pt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iusernotificationcallback-onleftclick
     */
    OnLeftClick(pt) {
        result := ComCall(4, this, "ptr", pt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} pt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iusernotificationcallback-oncontextmenu
     */
    OnContextMenu(pt) {
        result := ComCall(5, this, "ptr", pt, "HRESULT")
        return result
    }
}
