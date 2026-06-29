#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IInspectable.ahk" { IInspectable }

/**
 * Enables access to PrintManager methods in a Windows Store app that manages multiple windows.
 * @see https://learn.microsoft.com/windows/win32/api/printmanagerinterop/nn-printmanagerinterop-iprintmanagerinterop
 * @namespace Windows.Win32.System.WinRT.Printing
 */
export default struct IPrintManagerInterop extends IInspectable {
    /**
     * The interface identifier for IPrintManagerInterop
     * @type {Guid}
     */
    static IID := Guid("{c5435a42-8d43-4e7b-a68a-ef311e392087}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintManagerInterop interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        GetForWindow              : IntPtr
        ShowPrintUIForWindowAsync : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintManagerInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the PrintManager instance for the specified window.
     * @remarks
     * You can use the <b>GetForWindow</b> method to get the <a href="https://docs.microsoft.com/uwp/api/Windows.Graphics.Printing.PrintManager">PrintManager</a> for the specified window. The <b>GetForWindow</b> method is equivalent to the <a href="https://docs.microsoft.com/uwp/api/windows.graphics.printing.printmanager.getforcurrentview">GetForCurrentView</a> method, except that you supply a reference to a window from a multi-window Windows Store app.
     * @param {HWND} appWindow The window to get the <a href="https://docs.microsoft.com/uwp/api/Windows.Graphics.Printing.PrintManager">PrintManager</a> instance for.
     * @param {Pointer<Guid>} riid The reference ID of the specified window.
     * @returns {Pointer<Void>} The <a href="https://docs.microsoft.com/uwp/api/Windows.Graphics.Printing.PrintManager">PrintManager</a> instance for the specified window.
     * @see https://learn.microsoft.com/windows/win32/api/printmanagerinterop/nf-printmanagerinterop-iprintmanagerinterop-getforwindow
     */
    GetForWindow(appWindow, riid) {
        result := ComCall(6, this, HWND, appWindow, Guid.Ptr, riid, "ptr*", &printManager := 0, "HRESULT")
        return printManager
    }

    /**
     * Displays the UI for printing content for the specified window.
     * @remarks
     * You can use the <b>ShowPrintUIForWindowAsync</b> method to show the print UI for the specified window. The <b>ShowPrintUIForWindowAsync</b> method is equivalent to the <a href="https://docs.microsoft.com/uwp/api/windows.graphics.printing.printmanager.showprintuiasync">ShowPrintUIAsync</a> method, except that you supply a reference to a window from a multi-window Windows Store app.
     * @param {HWND} appWindow The window to show the print UI  for.
     * @param {Pointer<Guid>} riid The reference ID of the specified window.
     * @returns {Pointer<Void>} The asynchronous operation that reports completion.
     * @see https://learn.microsoft.com/windows/win32/api/printmanagerinterop/nf-printmanagerinterop-iprintmanagerinterop-showprintuiforwindowasync
     */
    ShowPrintUIForWindowAsync(appWindow, riid) {
        result := ComCall(7, this, HWND, appWindow, Guid.Ptr, riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }

    Query(iid) {
        if (IPrintManagerInterop.IID.Equals(iid)) {
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
