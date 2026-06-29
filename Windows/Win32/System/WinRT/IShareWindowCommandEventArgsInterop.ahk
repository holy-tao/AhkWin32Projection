#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Gets the [ShareWindowCommandSource](/uwp/api/windows.ui.shell.sharewindowcommandsource) object corresponding to a window identifier (a window handle). (IShareWindowCommandEventArgsInterop)
 * @remarks
 * You can query interface a [ShareWindowCommandEventArgs](/uwp/api/windows.ui.shell.sharewindowcommandeventargs) object for **IShareWindowCommandEventArgsInterop**.
 * 
 * ```cpp
 * void MyAppShareController::OnCommandInvoked(
 *     winrt::Windows::UI::Shell::ShareWindowCommandSource const& //sender,
 *     winrt::Windows::UI::Shell::ShareWindowCommandEventArgs const& args)
 * {
 *     auto eventArgsInterop = eventArgs.as<IShareWindowCommandEventArgsInterop>();
 *     HWND windowId = 0;
 *     winrt::check_hresult(eventArgsInterop->get_WindowId(&windowId));
 * 
 *     ...
 * }
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/sharewindowcommandsourceinterop/nn-sharewindowcommandsourceinterop-isharewindowcommandeventargsinterop
 * @namespace Windows.Win32.System.WinRT
 */
export default struct IShareWindowCommandEventArgsInterop extends IUnknown {
    /**
     * The interface identifier for IShareWindowCommandEventArgsInterop
     * @type {Guid}
     */
    static IID := Guid("{6571a721-643d-43d4-aca4-6b6f5f30f1ad}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShareWindowCommandEventArgsInterop interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetWindow : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShareWindowCommandEventArgsInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the window identifier (a window handle).
     * @remarks
     * For a code example, see [IShareWindowCommandEventArgsInterop](nn-sharewindowcommandsourceinterop-isharewindowcommandeventargsinterop.md).
     * @returns {HWND} Type: **[HWND](/windows/win32/winprog/windows-data-types)\***
     * 
     * The address of a **HWND** in which to receive the window identifier (a window handle).
     * @see https://learn.microsoft.com/windows/win32/api/sharewindowcommandsourceinterop/nf-sharewindowcommandsourceinterop-isharewindowcommandeventargsinterop-getwindow
     */
    GetWindow() {
        value := HWND()
        result := ComCall(3, this, HWND.Ptr, value, "HRESULT")
        return value
    }

    Query(iid) {
        if (IShareWindowCommandEventArgsInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetWindow := CallbackCreate(GetMethod(implObj, "GetWindow"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetWindow)
    }
}
