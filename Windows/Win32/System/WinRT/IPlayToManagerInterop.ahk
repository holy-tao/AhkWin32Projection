#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInspectable.ahk" { IInspectable }

/**
 * Enables access to PlayToManager methods in a Windows Store app that manages multiple windows.
 * @see https://learn.microsoft.com/windows/win32/api/playtomanagerinterop/nn-playtomanagerinterop-iplaytomanagerinterop
 * @namespace Windows.Win32.System.WinRT
 */
export default struct IPlayToManagerInterop extends IInspectable {
    /**
     * The interface identifier for IPlayToManagerInterop
     * @type {Guid}
     */
    static IID := Guid("{24394699-1f2c-4eb3-8cd7-0ec1da42a540}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPlayToManagerInterop interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        GetForWindow          : IntPtr
        ShowPlayToUIForWindow : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPlayToManagerInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the PlayToManager instance for the specified window.
     * @remarks
     * You can use the <b>GetForWindow</b> method to get the <a href="https://docs.microsoft.com/uwp/api/windows.media.playto.playtomanager">PlayToManager</a> for the specified window. The <b>GetForWindow</b> method is equivalent to the <a href="https://docs.microsoft.com/uwp/api/windows.graphics.printing.printmanager.getforcurrentview">GetForCurrentView</a> method, except that you supply a reference to a window from a multi-window Windows Store app.
     * @param {HWND} appWindow The window to get the <a href="https://docs.microsoft.com/uwp/api/windows.media.playto.playtomanager">PlayToManager</a> instance for.
     * @param {Pointer<Guid>} riid The reference ID of the specified window.
     * @returns {Pointer<Void>} The <a href="https://docs.microsoft.com/uwp/api/windows.media.playto.playtomanager">PlayToManager</a> instance for the specified window.
     * @see https://learn.microsoft.com/windows/win32/api/playtomanagerinterop/nf-playtomanagerinterop-iplaytomanagerinterop-getforwindow
     */
    GetForWindow(appWindow, riid) {
        result := ComCall(6, this, HWND, appWindow, Guid.Ptr, riid, "ptr*", &playToManager := 0, "HRESULT")
        return playToManager
    }

    /**
     * Displays the Play To UI for the specified window.
     * @remarks
     * You can use the <b>ShowPlayToUIForWindow</b> method to show the Play To UI for the specified window. The <b>ShowPlayToUIForWindow</b> method is equivalent to the <a href="https://docs.microsoft.com/uwp/api/windows.media.playto.playtomanager.showplaytoui">ShowPlayToUI</a> method, except that you supply a reference to a window from a multi-window Windows Store app.
     * @param {HWND} appWindow The window to show the Play To UI  for.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/playtomanagerinterop/nf-playtomanagerinterop-iplaytomanagerinterop-showplaytouiforwindow
     */
    ShowPlayToUIForWindow(appWindow) {
        result := ComCall(7, this, HWND, appWindow, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPlayToManagerInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetForWindow := CallbackCreate(GetMethod(implObj, "GetForWindow"), flags, 4)
        this.vtbl.ShowPlayToUIForWindow := CallbackCreate(GetMethod(implObj, "ShowPlayToUIForWindow"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetForWindow)
        CallbackFree(this.vtbl.ShowPlayToUIForWindow)
    }
}
