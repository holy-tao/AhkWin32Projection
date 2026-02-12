#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INavigationViewBackRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [NavigationView.BackRequested](navigationview_backrequested.md) event.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewBackRequestedEventArgs](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewbackrequestedeventargs) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewbackrequestedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class NavigationViewBackRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INavigationViewBackRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INavigationViewBackRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
