#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\Com\IUnknown.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/sharewindowcommandsourceinterop/nn-sharewindowcommandsourceinterop-isharewindowcommandeventargsinterop
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IShareWindowCommandEventArgsInterop extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShareWindowCommandEventArgsInterop
     * @type {Guid}
     */
    static IID => Guid("{6571a721-643d-43d4-aca4-6b6f5f30f1ad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetWindow"]

    /**
     * Gets the window identifier (a window handle).
     * @remarks
     * For a code example, see [IShareWindowCommandEventArgsInterop](nn-sharewindowcommandsourceinterop-isharewindowcommandeventargsinterop.md).
     * @returns {HWND} Type: **[HWND](/windows/win32/winprog/windows-data-types)\***
     * 
     * The address of a **HWND** in which to receive the window identifier (a window handle).
     * @see https://learn.microsoft.com/windows/win32/api//content/sharewindowcommandsourceinterop/nf-sharewindowcommandsourceinterop-isharewindowcommandeventargsinterop-getwindow
     */
    GetWindow() {
        value := HWND()
        result := ComCall(3, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
