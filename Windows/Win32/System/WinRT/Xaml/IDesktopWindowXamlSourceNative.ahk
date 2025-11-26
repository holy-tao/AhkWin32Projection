#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.desktopwindowxamlsource/nn-windows-ui-xaml-hosting-desktopwindowxamlsource-idesktopwindowxamlsourcenative
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class IDesktopWindowXamlSourceNative extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDesktopWindowXamlSourceNative
     * @type {Guid}
     */
    static IID => Guid("{3cbcf1bf-2f76-4e9c-96ab-e84b37972554}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AttachToWindow", "get_WindowHandle"]

    /**
     * @type {HWND} 
     */
    WindowHandle {
        get => this.get_WindowHandle()
    }

    /**
     * 
     * @param {HWND} parentWnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.desktopwindowxamlsource/nf-windows-ui-xaml-hosting-desktopwindowxamlsource-idesktopwindowxamlsourcenative-attachtowindow
     */
    AttachToWindow(parentWnd) {
        parentWnd := parentWnd is Win32Handle ? NumGet(parentWnd, "ptr") : parentWnd

        result := ComCall(3, this, "ptr", parentWnd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HWND} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.desktopwindowxamlsource/nf-windows-ui-xaml-hosting-desktopwindowxamlsource-idesktopwindowxamlsourcenative-get_windowhandle
     */
    get_WindowHandle() {
        hWnd := HWND()
        result := ComCall(4, this, "ptr", hWnd, "HRESULT")
        return hWnd
    }
}
