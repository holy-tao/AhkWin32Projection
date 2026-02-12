#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IColorChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the ColorChanged event.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorChangedEventArgs](/windows/winui/api/microsoft.ui.xaml.controls.colorchangedeventargs) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorchangedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ColorChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IColorChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IColorChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the color that was previously selected in the control.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorChangedEventArgs.OldColor](/windows/winui/api/microsoft.ui.xaml.controls.colorchangedeventargs.oldcolor) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorchangedeventargs.oldcolor
     * @type {Color} 
     */
    OldColor {
        get => this.get_OldColor()
    }

    /**
     * Gets the color that is currently selected in the control.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorChangedEventArgs.NewColor](/windows/winui/api/microsoft.ui.xaml.controls.colorchangedeventargs.newcolor) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorchangedeventargs.newcolor
     * @type {Color} 
     */
    NewColor {
        get => this.get_NewColor()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_OldColor() {
        if (!this.HasProp("__IColorChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IColorChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorChangedEventArgs := IColorChangedEventArgs(outPtr)
        }

        return this.__IColorChangedEventArgs.get_OldColor()
    }

    /**
     * 
     * @returns {Color} 
     */
    get_NewColor() {
        if (!this.HasProp("__IColorChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IColorChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorChangedEventArgs := IColorChangedEventArgs(outPtr)
        }

        return this.__IColorChangedEventArgs.get_NewColor()
    }

;@endregion Instance Methods
}
