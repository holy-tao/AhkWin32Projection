#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPNodeWindowlessHost extends IUnknown {
    /**
     * The interface identifier for IWMPNodeWindowlessHost
     * @type {Guid}
     */
    static IID := Guid("{be7017c6-ce34-4901-8106-770381aa6e3e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPNodeWindowlessHost interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InvalidateRect : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPNodeWindowlessHost.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The InvalidateRect function adds a rectangle to the specified window's update region. The update region represents the portion of the window's client area that must be redrawn.
     * @remarks
     * The invalidated areas accumulate in the update region until the region is processed when the next <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-paint">WM_PAINT</a> message occurs or until the region is validated by using the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-validaterect">ValidateRect</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-validatergn">ValidateRgn</a> function.
     * 
     * The system sends a <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-paint">WM_PAINT</a> message to a window whenever its update region is not empty and there are no other messages in the application queue for that window.
     * 
     * If the <i>bErase</i> parameter is <b>TRUE</b> for any part of the update region, the background is erased in the entire region, not just in the specified part.
     * @param {Pointer<RECT>} prc 
     * @param {BOOL} fErase 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-invalidaterect
     */
    InvalidateRect(prc, fErase) {
        result := ComCall(3, this, RECT.Ptr, prc, BOOL, fErase, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPNodeWindowlessHost.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InvalidateRect := CallbackCreate(GetMethod(implObj, "InvalidateRect"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InvalidateRect)
    }
}
