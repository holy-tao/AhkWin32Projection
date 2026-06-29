#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * A native interoperation interface that allows getting a [ShareWindowCommandSource](/uwp/api/windows.ui.shell.sharewindowcommandsource) object.
 * @remarks
 * Here's a code example.
 * 
 * ```cppwinrt
 * auto interop_factory = winrt::get_activation_factory
 *     <winrt::Windows::UI::Shell::ShareWindowCommandSource,
 *     IShareWindowCommandSourceInterop>();
 *         
 * winrt::check_hresult(interop_factory->GetForWindow(
 *     m_hwndOfMyAppCallWindow,
 *     winrt::guid_of<winrt::Windows::UI::Shell::IShareWindowCommandSource>(), 
 *     winrt::put_abi(m_shareWindowCommandSource)));
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/sharewindowcommandsourceinterop/nn-sharewindowcommandsourceinterop-isharewindowcommandsourceinterop
 * @namespace Windows.Win32.System.WinRT
 */
export default struct IShareWindowCommandSourceInterop extends IUnknown {
    /**
     * The interface identifier for IShareWindowCommandSourceInterop
     * @type {Guid}
     */
    static IID := Guid("{461a191f-8424-43a6-a0fa-3451a22f56ab}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShareWindowCommandSourceInterop interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetForWindow : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShareWindowCommandSourceInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the [ShareWindowCommandSource](/uwp/api/windows.ui.shell.sharewindowcommandsource) object corresponding to a window identifier (a window handle). (IShareWindowCommandSourceInterop::GetForWindow)
     * @remarks
     * For a code example, see [IShareWindowCommandSourceInterop](nn-sharewindowcommandsourceinterop-isharewindowcommandsourceinterop.md).
     * @param {HWND} appWindow Type: **[HWND](/windows/win32/winprog/windows-data-types)\***
     * 
     * The window identifier (a window handle) of the window where the call or meeting is established.
     * 
     * The window identified by the HWND passed in *appWindow* must be such that it is capable of providing the brand icon, and the friendly name, of the client application.
     * @param {Pointer<Guid>} riid Type: **[REFIID](/openspecs/windows_protocols/ms-oaut/bbde795f-5398-42d8-9f59-3613da03c318)**
     * 
     * A reference to the interface identifier of the **Windows::UI::Shell::IShareWindowCommandSource** interface.
     * @returns {Pointer<Void>} Type: **[void](/windows/win32/winprog/windows-data-types)\*\***
     * 
     * The address of a **Windows::UI::Shell::IShareWindowCommandSource** pointer in which to receive the [ShareWindowCommandSource](/uwp/api/windows.ui.shell.sharewindowcommandsource) object.
     * @see https://learn.microsoft.com/windows/win32/api/sharewindowcommandsourceinterop/nf-sharewindowcommandsourceinterop-isharewindowcommandsourceinterop-getforwindow
     */
    GetForWindow(appWindow, riid) {
        result := ComCall(3, this, HWND, appWindow, Guid.Ptr, riid, "ptr*", &shareWindowCommandSource := 0, "HRESULT")
        return shareWindowCommandSource
    }

    Query(iid) {
        if (IShareWindowCommandSourceInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetForWindow := CallbackCreate(GetMethod(implObj, "GetForWindow"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetForWindow)
    }
}
