#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IInspectable.ahk" { IInspectable }

/**
 * Enables interoperability with a WinRT [Print3DManager](/uwp/api/windows.graphics.printing3d.print3dmanager) object.
 * @see https://learn.microsoft.com/windows/win32/api/print3dmanagerinterop/nn-print3dmanagerinterop-iprinting3dmanagerinterop
 * @namespace Windows.Win32.System.WinRT.Printing
 */
export default struct IPrinting3DManagerInterop extends IInspectable {
    /**
     * The interface identifier for IPrinting3DManagerInterop
     * @type {Guid}
     */
    static IID := Guid("{9ca31010-1484-4587-b26b-dddf9f9caecd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrinting3DManagerInterop interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        GetForWindow              : IntPtr
        ShowPrintUIForWindowAsync : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrinting3DManagerInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets an [Print3DManager](/uwp/api/windows.graphics.printing3d.print3dmanager) object for the window of the active application.
     * @param {HWND} appWindow Handle to the window of the active application.
     * @param {Pointer<Guid>} riid The GUID for the resource interface.
     * 
     * The REFIID, or GUID, of the interface to the resource can be obtained by using the __uuidof() macro. For example: 
     * 
     * `__uuidof(Print3DManager)`
     * @returns {Pointer<Void>} Address of a pointer to a [Print3DManager](/uwp/api/windows.graphics.printing3d.print3dmanager) object.
     * @see https://learn.microsoft.com/windows/win32/api/print3dmanagerinterop/nf-print3dmanagerinterop-iprinting3dmanagerinterop-getforwindow
     */
    GetForWindow(appWindow, riid) {
        result := ComCall(6, this, HWND, appWindow, Guid.Ptr, riid, "ptr*", &printManager := 0, "HRESULT")
        return printManager
    }

    /**
     * Programmatically initiates the 3D printing user interface.
     * @param {HWND} appWindow Handle to the window of the active application.
     * @param {Pointer<Guid>} riid The GUID for the resource interface.
     * 
     * The REFIID, or GUID, of the interface to the resource can be obtained by using the __uuidof() macro. For example: 
     * 
     * `__uuidof(IAsyncAction)`
     * @returns {Pointer<Void>} Address of a pointer to a [IAsyncAction](/uwp/api/Windows.Foundation.IAsyncAction) object that returns void upon completion.
     * @see https://learn.microsoft.com/windows/win32/api/print3dmanagerinterop/nf-print3dmanagerinterop-iprinting3dmanagerinterop-showprintuiforwindowasync
     */
    ShowPrintUIForWindowAsync(appWindow, riid) {
        result := ComCall(7, this, HWND, appWindow, Guid.Ptr, riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }

    Query(iid) {
        if (IPrinting3DManagerInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetForWindow := CallbackCreate(GetMethod(implObj, "GetForWindow"), flags, 4)
        this.vtbl.ShowPrintUIForWindowAsync := CallbackCreate(GetMethod(implObj, "ShowPrintUIForWindowAsync"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetForWindow)
        CallbackFree(this.vtbl.ShowPrintUIForWindowAsync)
    }
}
