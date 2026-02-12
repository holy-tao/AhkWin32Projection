#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRefreshRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for RefreshRequested events.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshRequestedEventArgs](/windows/winui/api/microsoft.ui.xaml.controls.refreshrequestedeventargs) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.refreshrequestedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class RefreshRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRefreshRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRefreshRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets a deferral object for managing the work done in the RefreshRequested event handler.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshRequestedEventArgs.GetDeferral](/windows/winui/api/microsoft.ui.xaml.controls.refreshrequestedeventargs.getdeferral) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * A deferral should be used if any asynchronous work is being done in the RefreshRequested event handler, so that the next event in the sequence isn't raised until this work is completed.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.refreshrequestedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IRefreshRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRefreshRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRefreshRequestedEventArgs := IRefreshRequestedEventArgs(outPtr)
        }

        return this.__IRefreshRequestedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
