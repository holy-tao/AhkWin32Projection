#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The IDropSourceNotify interface is implemented on an IDropSource object to receive notifications from OLE when a user drags the mouse into or out of a potential drop target window.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/nn-oleidl-idropsourcenotify
 * @namespace Windows.Win32.System.Ole
 */
export default struct IDropSourceNotify extends IUnknown {
    /**
     * The interface identifier for IDropSourceNotify
     * @type {Guid}
     */
    static IID := Guid("{0000012b-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDropSourceNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DragEnterTarget : IntPtr
        DragLeaveTarget : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDropSourceNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * OLE calls this method when the user drags the mouse cursor into a potential drop target window.
     * @param {HWND} hwndTarget The window handle of the potential drop target window.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-idropsourcenotify-dragentertarget
     */
    DragEnterTarget(hwndTarget) {
        result := ComCall(3, this, HWND, hwndTarget, "HRESULT")
        return result
    }

    /**
     * OLE calls this method when the user drags the mouse cursor out of a potential drop target window.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-idropsourcenotify-dragleavetarget
     */
    DragLeaveTarget() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDropSourceNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DragEnterTarget := CallbackCreate(GetMethod(implObj, "DragEnterTarget"), flags, 2)
        this.vtbl.DragLeaveTarget := CallbackCreate(GetMethod(implObj, "DragLeaveTarget"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DragEnterTarget)
        CallbackFree(this.vtbl.DragLeaveTarget)
    }
}
