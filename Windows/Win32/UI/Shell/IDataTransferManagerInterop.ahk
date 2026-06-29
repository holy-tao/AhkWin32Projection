#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables access to DataTransferManager methods in a Windows Store app that manages multiple windows.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-idatatransfermanagerinterop
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IDataTransferManagerInterop extends IUnknown {
    /**
     * The interface identifier for IDataTransferManagerInterop
     * @type {Guid}
     */
    static IID := Guid("{3a3dcd6c-3eab-43dc-bcde-45671ce800c8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataTransferManagerInterop interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetForWindow         : IntPtr
        ShowShareUIForWindow : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataTransferManagerInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the DataTransferManager instance for the specified window.
     * @remarks
     * This method is equivalent to the <a href="https://docs.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datatransfermanager.getforcurrentview">DataTransferManager.GetForCurrentView</a> method, except that you specify a window from a multi-window Windows Store app.
     * @param {HWND} appWindow The window whose <a href="https://docs.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datatransfermanager">DataTransferManager</a> instance is to be retrieved.
     * @param {Pointer<Guid>} riid The requested interface ID of the <a href="https://docs.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datatransfermanager">DataTransferManager</a> instance.
     * @returns {Pointer<Void>} Receives the <a href="https://docs.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datatransfermanager">DataTransferManager</a> instance.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idatatransfermanagerinterop-getforwindow
     */
    GetForWindow(appWindow, riid) {
        result := ComCall(3, this, HWND, appWindow, Guid.Ptr, riid, "ptr*", &dataTransferManager := 0, "HRESULT")
        return dataTransferManager
    }

    /**
     * Displays the UI for sharing content for the specified window.
     * @remarks
     * This method is equivalent to the <a href="https://docs.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datatransfermanager.showshareui">DataTransferManager.ShowShareUI</a> method, except that you specify a window from a multi-window Windows Store app.
     * @param {HWND} appWindow The window to show the share UI for.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idatatransfermanagerinterop-showshareuiforwindow
     */
    ShowShareUIForWindow(appWindow) {
        result := ComCall(4, this, HWND, appWindow, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDataTransferManagerInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetForWindow := CallbackCreate(GetMethod(implObj, "GetForWindow"), flags, 4)
        this.vtbl.ShowShareUIForWindow := CallbackCreate(GetMethod(implObj, "ShowShareUIForWindow"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetForWindow)
        CallbackFree(this.vtbl.ShowShareUIForWindow)
    }
}
