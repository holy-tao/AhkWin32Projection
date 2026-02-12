#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDesktopWindowXamlSourceTakeFocusRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [TakeFocusRequested](desktopwindowxamlsource_takefocusrequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.desktopwindowxamlsourcetakefocusrequestedeventargs
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class DesktopWindowXamlSourceTakeFocusRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDesktopWindowXamlSourceTakeFocusRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDesktopWindowXamlSourceTakeFocusRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a [XamlSourceFocusNavigationRequest](xamlsourcefocusnavigationrequest.md) object that specifies the reason and other info for the focus navigation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.desktopwindowxamlsourcetakefocusrequestedeventargs.request
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
        if (!this.HasProp("__IDesktopWindowXamlSourceTakeFocusRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDesktopWindowXamlSourceTakeFocusRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDesktopWindowXamlSourceTakeFocusRequestedEventArgs := IDesktopWindowXamlSourceTakeFocusRequestedEventArgs(outPtr)
        }

        return this.__IDesktopWindowXamlSourceTakeFocusRequestedEventArgs.get_Request()
    }

;@endregion Instance Methods
}
