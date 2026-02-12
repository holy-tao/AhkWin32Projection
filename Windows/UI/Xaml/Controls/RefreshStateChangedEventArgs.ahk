#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRefreshStateChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [RefreshVisualizer.RefreshStateChanged](refreshvisualizer_refreshstatechanged.md) event.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshStateChangedEventArgs](/windows/winui/api/microsoft.ui.xaml.controls.refreshstatechangedeventargs) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.refreshstatechangedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class RefreshStateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRefreshStateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRefreshStateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates the previous state of the [RefreshVisualizer](refreshvisualizer.md).
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshStateChangedEventArgs.OldState](/windows/winui/api/microsoft.ui.xaml.controls.refreshstatechangedeventargs.oldstate) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.refreshstatechangedeventargs.oldstate
     * @type {Integer} 
     */
    OldState {
        get => this.get_OldState()
    }

    /**
     * Gets a value that indicates the new state of the [RefreshVisualizer](refreshvisualizer.md).
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshStateChangedEventArgs.NewState](/windows/winui/api/microsoft.ui.xaml.controls.refreshstatechangedeventargs.newstate) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.refreshstatechangedeventargs.newstate
     * @type {Integer} 
     */
    NewState {
        get => this.get_NewState()
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
    get_OldState() {
        if (!this.HasProp("__IRefreshStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRefreshStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRefreshStateChangedEventArgs := IRefreshStateChangedEventArgs(outPtr)
        }

        return this.__IRefreshStateChangedEventArgs.get_OldState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NewState() {
        if (!this.HasProp("__IRefreshStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRefreshStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRefreshStateChangedEventArgs := IRefreshStateChangedEventArgs(outPtr)
        }

        return this.__IRefreshStateChangedEventArgs.get_NewState()
    }

;@endregion Instance Methods
}
