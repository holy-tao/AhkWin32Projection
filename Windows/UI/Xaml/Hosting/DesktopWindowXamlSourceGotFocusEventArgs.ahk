#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDesktopWindowXamlSourceGotFocusEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [GotFocus](desktopwindowxamlsource_gotfocus.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.desktopwindowxamlsourcegotfocuseventargs
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class DesktopWindowXamlSourceGotFocusEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDesktopWindowXamlSourceGotFocusEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDesktopWindowXamlSourceGotFocusEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a [XamlSourceFocusNavigationRequest](xamlsourcefocusnavigationrequest.md) object that specifies the reason and other info for the focus navigation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.desktopwindowxamlsourcegotfocuseventargs.request
     * @type {XamlSourceFocusNavigationRequest} 
     */
    Request {
        get => this.get_Request()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {XamlSourceFocusNavigationRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IDesktopWindowXamlSourceGotFocusEventArgs")) {
            if ((queryResult := this.QueryInterface(IDesktopWindowXamlSourceGotFocusEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDesktopWindowXamlSourceGotFocusEventArgs := IDesktopWindowXamlSourceGotFocusEventArgs(outPtr)
        }

        return this.__IDesktopWindowXamlSourceGotFocusEventArgs.get_Request()
    }

;@endregion Instance Methods
}
