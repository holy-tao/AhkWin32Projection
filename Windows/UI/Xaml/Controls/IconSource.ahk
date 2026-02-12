#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IIconSource.ahk
#Include .\IIconSourceStatics.ahk
#Include .\IIconSourceFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the base class for an icon source.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.IconSource](/windows/winui/api/microsoft.ui.xaml.controls.iconsource) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * **IconSource** is similar to [IconElement](iconelement.md). However, because it is not a [FrameworkElement](../windows.ui.xaml/frameworkelement.md), it can be shared.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.iconsource
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IconSource extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIconSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIconSource.IID

    /**
     * Identifies the Foreground dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.IconSource.ForegroundProperty](/windows/winui/api/microsoft.ui.xaml.controls.iconsource.foregroundproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.iconsource.foregroundproperty
     * @type {DependencyProperty} 
     */
    static ForegroundProperty {
        get => IconSource.get_ForegroundProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ForegroundProperty() {
        if (!IconSource.HasProp("__IIconSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.IconSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIconSourceStatics.IID)
            IconSource.__IIconSourceStatics := IIconSourceStatics(factoryPtr)
        }

        return IconSource.__IIconSourceStatics.get_ForegroundProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a brush that describes the foreground color.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.IconSource.Foreground](/windows/winui/api/microsoft.ui.xaml.controls.iconsource.foreground) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.iconsource.foreground
     * @type {Brush} 
     */
    Foreground {
        get => this.get_Foreground()
        set => this.put_Foreground(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Foreground() {
        if (!this.HasProp("__IIconSource")) {
            if ((queryResult := this.QueryInterface(IIconSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIconSource := IIconSource(outPtr)
        }

        return this.__IIconSource.get_Foreground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Foreground(value) {
        if (!this.HasProp("__IIconSource")) {
            if ((queryResult := this.QueryInterface(IIconSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIconSource := IIconSource(outPtr)
        }

        return this.__IIconSource.put_Foreground(value)
    }

;@endregion Instance Methods
}
