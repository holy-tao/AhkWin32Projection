#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\UIElement.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include .\XamlSourceFocusNavigationResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides members you can use to attach a **DesktopWindowXamlSource** object that hosts a WinRT XAML control to a parent UI element in your desktop app.
 * @remarks
 * This interface is implemented by the [DesktopWindowXamlSource](/uwp/api/windows.ui.xaml.hosting.desktopwindowxamlsource) class. **DesktopWindowXamlSource** is a key component the [WinRT XAML hosting API](/windows/apps/desktop/modernize/using-the-xaml-hosting-api), which desktop apps can use to host WinRT XAML controls in any UI element that is associated with a window handle (this feature is also called *XAML Islands*).
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.xaml.hosting.desktopwindowxamlsource/nn-windows-ui-xaml-hosting-desktopwindowxamlsource-idesktopwindowxamlsourcenative
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class IDesktopWindowXamlSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDesktopWindowXamlSource
     * @type {Guid}
     */
    static IID => Guid("{d585bfe1-00ff-51be-ba1d-a1329956ea0a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Content", "put_Content", "get_HasFocus", "add_TakeFocusRequested", "remove_TakeFocusRequested", "add_GotFocus", "remove_GotFocus", "NavigateFocus"]

    /**
     * @type {UIElement} 
     */
    Content {
        get => this.get_Content()
        set => this.put_Content(value)
    }

    /**
     * @type {Boolean} 
     */
    HasFocus {
        get => this.get_HasFocus()
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Content() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIElement(value)
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Content(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasFocus() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<DesktopWindowXamlSource, DesktopWindowXamlSourceTakeFocusRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TakeFocusRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TakeFocusRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<DesktopWindowXamlSource, DesktopWindowXamlSourceGotFocusEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GotFocus(handler) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_GotFocus(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {XamlSourceFocusNavigationRequest} request 
     * @returns {XamlSourceFocusNavigationResult} 
     */
    NavigateFocus(request) {
        result := ComCall(13, this, "ptr", request, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XamlSourceFocusNavigationResult(result_)
    }
}
