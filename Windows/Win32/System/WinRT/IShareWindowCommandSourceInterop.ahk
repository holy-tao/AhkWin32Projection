#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

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
 * @version v4.0.30319
 */
class IShareWindowCommandSourceInterop extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShareWindowCommandSourceInterop
     * @type {Guid}
     */
    static IID => Guid("{461a191f-8424-43a6-a0fa-3451a22f56ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForWindow"]

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
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(3, this, "ptr", appWindow, "ptr", riid, "ptr*", &shareWindowCommandSource := 0, "HRESULT")
        return shareWindowCommandSource
    }
}
