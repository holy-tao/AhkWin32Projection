#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDesktopWindowXamlSourceNative.ahk

/**
 * Provides a method that enables the WinRT XAML framework to process Windows messages for a **DesktopWindowXamlSource** object that hosts a WinRT XAML control.
 * @remarks
 * This interface is implemented by the [DesktopWindowXamlSource](/uwp/api/windows.ui.xaml.hosting.desktopwindowxamlsource) class. **DesktopWindowXamlSource** is a key component the [WinRT XAML hosting API](/windows/apps/desktop/modernize/using-the-xaml-hosting-api), which desktop apps can use to host WinRT XAML controls in any UI element that is associated with a window handle (this feature is also called *XAML Islands*).
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.desktopwindowxamlsource/nn-windows-ui-xaml-hosting-desktopwindowxamlsource-idesktopwindowxamlsourcenative2
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class IDesktopWindowXamlSourceNative2 extends IDesktopWindowXamlSourceNative{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDesktopWindowXamlSourceNative2
     * @type {Guid}
     */
    static IID => Guid("{e3dcd8c7-3057-4692-99c3-7b7720afda31}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PreTranslateMessage"]

    /**
     * Enables the WinRT XAML framework to process a Windows message for a **DesktopWindowXamlSource** object that hosts a WinRT XAML control.
     * @remarks
     * For a code example that demonstrates how to use this method, see [XamlBridge.cpp](https://github.com/microsoft/Xaml-Islands-Samples/blob/master/Samples/Win32/SampleCppApp/XamlBridge.cpp) in the SampleCppApp sample in the XAML Island samples repo.
     * @param {Pointer<MSG>} message Type: **const [MSG](/windows/win32/api/winuser/ns-winuser-msg)\***
     * 
     * The Windows message to process.
     * @param {Pointer<BOOL>} result Type: **BOOL\***
     * 
     * True if the message was processed; otherwise, false.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.desktopwindowxamlsource/nf-windows-ui-xaml-hosting-desktopwindowxamlsource-idesktopwindowxamlsourcenative2-pretranslatemessage
     */
    PreTranslateMessage(message, result) {
        resultMarshal := result is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", message, resultMarshal, result, "HRESULT")
        return result
    }
}
