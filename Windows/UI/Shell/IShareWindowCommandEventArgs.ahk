#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\WindowId.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

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
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class IShareWindowCommandEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShareWindowCommandEventArgs
     * @type {Guid}
     */
    static IID => Guid("{4578dc09-a523-5756-a995-e4feb991fff0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WindowId", "get_Command", "put_Command"]

    /**
     * @type {WindowId} 
     */
    WindowId {
        get => this.get_WindowId()
    }

    /**
     * @type {Integer} 
     */
    Command {
        get => this.get_Command()
        set => this.put_Command(value)
    }

    /**
     * 
     * @returns {WindowId} 
     */
    get_WindowId() {
        value := WindowId()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Command() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Command(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
