#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method for the handling of a mouse click or shortcut menu access in a notification balloon. Used with IUserNotification2::Show.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iusernotificationcallback
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IUserNotificationCallback extends IUnknown {
    /**
     * The interface identifier for IUserNotificationCallback
     * @type {Guid}
     */
    static IID := Guid("{19108294-0441-4aff-8013-fa0a730b0bea}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUserNotificationCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnBalloonUserClick : IntPtr
        OnLeftClick        : IntPtr
        OnContextMenu      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUserNotificationCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when the user clicks the balloon. The application may respond with an action that is suitable for the balloon being clicked.
     * @param {Pointer<POINT>} pt Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a>*</b>
     * 
     * Takes a pointer to the <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure which, upon method return, points to the position of the mouse in screen space where the mouse click occurred.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iusernotificationcallback-onballoonuserclick
     */
    OnBalloonUserClick(pt) {
        result := ComCall(3, this, POINT.Ptr, pt, "HRESULT")
        return result
    }

    /**
     * Called when the user clicks the icon in the notification area. The applications may launch some customary UI in response.
     * @param {Pointer<POINT>} pt Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a>*</b>
     * 
     * Takes a pointer to the <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure which, when the method returns, points to the position of the mouse in the screen space where the mouse click occurred.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iusernotificationcallback-onleftclick
     */
    OnLeftClick(pt) {
        result := ComCall(4, this, POINT.Ptr, pt, "HRESULT")
        return result
    }

    /**
     * Called when the user right-clicks (or presses SHIFT+F10) the icon in the notification area. The application should show its context menu in response.
     * @param {Pointer<POINT>} pt Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a>*</b>
     * 
     * When returned by the method, takes a pointer to the <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure at the position of the mouse in the screen space where the click occurred.
     * 
     * In the case where user presses SHIFT+F10, the pointer points to the center of the icon in the screen space.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iusernotificationcallback-oncontextmenu
     */
    OnContextMenu(pt) {
        result := ComCall(5, this, POINT.Ptr, pt, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUserNotificationCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnBalloonUserClick := CallbackCreate(GetMethod(implObj, "OnBalloonUserClick"), flags, 2)
        this.vtbl.OnLeftClick := CallbackCreate(GetMethod(implObj, "OnLeftClick"), flags, 2)
        this.vtbl.OnContextMenu := CallbackCreate(GetMethod(implObj, "OnContextMenu"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnBalloonUserClick)
        CallbackFree(this.vtbl.OnLeftClick)
        CallbackFree(this.vtbl.OnContextMenu)
    }
}
