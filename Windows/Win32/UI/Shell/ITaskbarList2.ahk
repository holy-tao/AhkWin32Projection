#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITaskbarList.ahk" { ITaskbarList }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Extends the ITaskbarList interface by exposing a method to mark a window as a full-screen display.
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-itaskbarlist">ITaskbarList</a> interface, from which it inherits.
 * 
 * The Shell also automatically attempts to detect full-screen applications, but it is not as reliable as using the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itaskbarlist2-markfullscreenwindow">ITaskbarList2::MarkFullscreenWindow</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-itaskbarlist2
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ITaskbarList2 extends ITaskbarList {
    /**
     * The interface identifier for ITaskbarList2
     * @type {Guid}
     */
    static IID := Guid("{602d4995-b13a-429b-a66e-1935e44f4317}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITaskbarList2 interfaces
    */
    struct Vtbl extends ITaskbarList.Vtbl {
        MarkFullscreenWindow : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITaskbarList2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Marks a window as full-screen.
     * @remarks
     * Setting the value of <i>fFullscreen</i> to <b>TRUE</b>, the Shell treats this window as a full-screen window, and the taskbar is moved to the bottom of the z-order when this window is active. Setting the value of <i>fFullscreen</i> to <b>FALSE</b> removes the full-screen marking, but <i>does not</i> cause the Shell to treat the window as though it were definitely not full-screen. With a <b>FALSE</b> <i>fFullscreen</i> value, the Shell depends on its automatic detection facility to specify how the window should be treated, possibly still flagging the window as full-screen.
     * 
     * 
     * 
     * **Since Windows 7,** call `SetProp(hwnd, L”NonRudeHWND”, reinterpret_cast<HANDLE>(TRUE))` before showing a window to indicate to the Shell that the window should not be treated as full-screen. This ensures the taskbar does not adjust itself to be below the window in z-order. This is similar to `ITaskbarList2::MarkFullscreenWindow(FALSE)` except the Shell will not fallback to its automatic detection facility and will not treat the window as full-screen.
     * @param {HWND} _hwnd Type: <b>HWND</b>
     * 
     * The handle of the window to be marked.
     * @param {BOOL} fFullscreen Type: <b>BOOL</b>
     * 
     * A Boolean value marking the desired full-screen status of the window.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist2-markfullscreenwindow
     */
    MarkFullscreenWindow(_hwnd, fFullscreen) {
        result := ComCall(8, this, HWND, _hwnd, BOOL, fFullscreen, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITaskbarList2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.MarkFullscreenWindow := CallbackCreate(GetMethod(implObj, "MarkFullscreenWindow"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.MarkFullscreenWindow)
    }
}
