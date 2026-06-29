#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that represents a modal window.
 * @remarks
 * <b>IModalWindow</b>'s IID is IID_IModalWindow.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-imodalwindow
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IModalWindow extends IUnknown {
    /**
     * The interface identifier for IModalWindow
     * @type {Guid}
     */
    static IID := Guid("{b4db1657-70d7-485e-8e3e-6fcb5a5c1802}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IModalWindow interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Show : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IModalWindow.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Launches the modal window.
     * @param {HWND} hwndOwner Type: <b>HWND</b>
     * 
     * The handle of the owner window. This value can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code, including the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a>(ERROR_CANCELLED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user closed the window by cancelling the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-imodalwindow-show
     */
    Show(hwndOwner) {
        result := ComCall(3, this, HWND, hwndOwner, "HRESULT")
        return result
    }

    Query(iid) {
        if (IModalWindow.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Show := CallbackCreate(GetMethod(implObj, "Show"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Show)
    }
}
