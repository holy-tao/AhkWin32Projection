#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INavigationViewDisplayModeChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [NavigationView.DisplayModeChanged](navigationview_displaymodechanged.md) event.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewDisplayModeChangedEventArgs](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewdisplaymodechangedeventargs) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewdisplaymodechangedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class NavigationViewDisplayModeChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INavigationViewDisplayModeChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INavigationViewDisplayModeChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the new display mode.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewDisplayModeChangedEventArgs.DisplayMode](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewdisplaymodechangedeventargs.displaymode) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewdisplaymodechangedeventargs.displaymode
     * @type {Integer} 
     */
    DisplayMode {
        get => this.get_DisplayMode()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DisplayMode() {
        if (!this.HasProp("__INavigationViewDisplayModeChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(INavigationViewDisplayModeChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationViewDisplayModeChangedEventArgs := INavigationViewDisplayModeChangedEventArgs(outPtr)
        }

        return this.__INavigationViewDisplayModeChangedEventArgs.get_DisplayMode()
    }

;@endregion Instance Methods
}
