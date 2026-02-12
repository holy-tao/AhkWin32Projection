#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRefreshInteractionRatioChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshInteractionRatioChangedEventArgs](/windows/winui/api/microsoft.ui.xaml.controls.refreshinteractionratiochangedeventargs) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.refreshinteractionratiochangedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class RefreshInteractionRatioChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRefreshInteractionRatioChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRefreshInteractionRatioChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the interaction ratio value.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshInteractionRatioChangedEventArgs.InteractionRatio](/windows/winui/api/microsoft.ui.xaml.controls.refreshinteractionratiochangedeventargs.interactionratio) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.refreshinteractionratiochangedeventargs.interactionratio
     * @type {Float} 
     */
    InteractionRatio {
        get => this.get_InteractionRatio()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_InteractionRatio() {
        if (!this.HasProp("__IRefreshInteractionRatioChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRefreshInteractionRatioChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRefreshInteractionRatioChangedEventArgs := IRefreshInteractionRatioChangedEventArgs(outPtr)
        }

        return this.__IRefreshInteractionRatioChangedEventArgs.get_InteractionRatio()
    }

;@endregion Instance Methods
}
