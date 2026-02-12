#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides a control that hosts HTML content in an app. This interface requires [IWebViewControl](iwebviewcontrol.md).
 * @remarks
 * The `WebViewControl` class allows Win32 apps to display web content using the same underlying infrastructure as the [UWP WebView](../windows.ui.xaml.controls/webview.md).
 * @see https://learn.microsoft.com/uwp/api/windows.web.ui.iwebviewcontrol2
 * @namespace Windows.Web.UI
 * @version WindowsRuntime 1.4
 */
class IWebViewControl2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebViewControl2
     * @type {Guid}
     */
    static IID => Guid("{4d3c06f9-c8df-41cc-8bd5-2a947b204503}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddInitializeScript"]

    /**
     * Injects a script into the [IWebViewControl](/uwp/api/windows.web.ui.iwebviewcontrol) just after [ContentLoading](/uwp/api/windows.ui.xaml.controls.webview.contentloading) but before any other script is run on the page.
     * @param {HSTRING} script 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.iwebviewcontrol2.addinitializescript
     */
    AddInitializeScript(script) {
        if(script is String) {
            pin := HSTRING.Create(script)
            script := pin.Value
        }
        script := script is Win32Handle ? NumGet(script, "ptr") : script

        result := ComCall(6, this, "ptr", script, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
