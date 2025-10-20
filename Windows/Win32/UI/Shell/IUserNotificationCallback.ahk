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
     * 
     * @param {Pointer<POINT>} pt 
     * @returns {HRESULT} 
     */
    OnBalloonUserClick(pt) {
        result := ComCall(3, this, "ptr", pt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} pt 
     * @returns {HRESULT} 
     */
    OnLeftClick(pt) {
        result := ComCall(4, this, "ptr", pt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} pt 
     * @returns {HRESULT} 
     */
    OnContextMenu(pt) {
        result := ComCall(5, this, "ptr", pt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
