#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides members you can use to attach a **DesktopWindowXamlSource** object that hosts a WinRT XAML control to a parent UI element in your desktop app.
 * @remarks
 * This interface is implemented by the [DesktopWindowXamlSource](/uwp/api/windows.ui.xaml.hosting.desktopwindowxamlsource) class. **DesktopWindowXamlSource** is a key component the [WinRT XAML hosting API](/windows/apps/desktop/modernize/using-the-xaml-hosting-api), which desktop apps can use to host WinRT XAML controls in any UI element that is associated with a window handle (this feature is also called *XAML Islands*).
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.desktopwindowxamlsource/nn-windows-ui-xaml-hosting-desktopwindowxamlsource-idesktopwindowxamlsourcenative
 * @namespace Windows.Win32.System.WinRT.Xaml
 */
export default struct IDesktopWindowXamlSourceNative extends IUnknown {
    /**
     * The interface identifier for IDesktopWindowXamlSourceNative
     * @type {Guid}
     */
    static IID := Guid("{3cbcf1bf-2f76-4e9c-96ab-e84b37972554}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDesktopWindowXamlSourceNative interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AttachToWindow   : IntPtr
        get_WindowHandle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDesktopWindowXamlSourceNative.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(3, this, HWND, parentWnd, "HRESULT")
        return result
    }

    /**
     * Gets the window handle of the parent UI element that is associated with the current IDesktopWindowXamlSourceNative instance.
     * @returns {HWND} On output, this parameter contains the window handle of the parent UI element that is associated with the current [IDesktopWindowXamlSourceNative](nn-windows-ui-xaml-hosting-desktopwindowxamlsource-idesktopwindowxamlsourcenative.md) instance.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.desktopwindowxamlsource/nf-windows-ui-xaml-hosting-desktopwindowxamlsource-idesktopwindowxamlsourcenative-get_windowhandle
     */
    get_WindowHandle() {
        _hWnd := HWND()
        result := ComCall(4, this, HWND.Ptr, _hWnd, "HRESULT")
        return _hWnd
    }

    Query(iid) {
        if (IDesktopWindowXamlSourceNative.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AttachToWindow := CallbackCreate(GetMethod(implObj, "AttachToWindow"), flags, 2)
        this.vtbl.get_WindowHandle := CallbackCreate(GetMethod(implObj, "get_WindowHandle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AttachToWindow)
        CallbackFree(this.vtbl.get_WindowHandle)
    }
}
