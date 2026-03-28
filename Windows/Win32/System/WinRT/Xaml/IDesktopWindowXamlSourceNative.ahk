#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Provides members you can use to attach a **DesktopWindowXamlSource** object that hosts a WinRT XAML control to a parent UI element in your desktop app.
 * @remarks
 * This interface is implemented by the [DesktopWindowXamlSource](/uwp/api/windows.ui.xaml.hosting.desktopwindowxamlsource) class. **DesktopWindowXamlSource** is a key component the [WinRT XAML hosting API](/windows/apps/desktop/modernize/using-the-xaml-hosting-api), which desktop apps can use to host WinRT XAML controls in any UI element that is associated with a window handle (this feature is also called *XAML Islands*).
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
     * Attaches the current **IDesktopWindowXamlSourceNative** instance to a parent UI element in your desktop app that is associated with a window handle.
     * @remarks
     * For a code example that demonstrates how to use this method, see [XamlBridge.cpp](https://github.com/microsoft/Xaml-Islands-Samples/blob/master/Samples/Win32/SampleCppApp/XamlBridge.cpp) in the SampleCppApp sample in the XAML Island samples repo.
     * 
     * > [!IMPORTANT]
     * > Make sure that your code calls the **AttachToWindow** method only once per [DesktopWindowXamlSource](/uwp/api/windows.ui.xaml.hosting.desktopwindowxamlsource) object. Calling this method more than once for a **DesktopWindowXamlSource** object could result in a memory leak.
     * @param {HWND} parentWnd Type: **HWND**
     * 
     * The window handle of the parent UI element in which you want to host a WinRT XAML control.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.desktopwindowxamlsource/nf-windows-ui-xaml-hosting-desktopwindowxamlsource-idesktopwindowxamlsourcenative-attachtowindow
     */
    AttachToWindow(parentWnd) {
        parentWnd := parentWnd is Win32Handle ? NumGet(parentWnd, "ptr") : parentWnd

        result := ComCall(3, this, "ptr", parentWnd, "HRESULT")
        return result
    }

    /**
     * Gets the window handle of the parent UI element that is associated with the current IDesktopWindowXamlSourceNative instance.
     * @returns {HWND} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.desktopwindowxamlsource/nf-windows-ui-xaml-hosting-desktopwindowxamlsource-idesktopwindowxamlsourcenative-get_windowhandle
     */
    get_WindowHandle() {
        _hWnd := HWND()
        result := ComCall(4, this, "ptr", _hWnd, "HRESULT")
        return _hWnd
    }
}
