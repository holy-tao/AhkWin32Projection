#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\IconSource.ahk
#Include .\IBitmapIconSource.ahk
#Include .\IBitmapIconSourceFactory.ahk
#Include .\IBitmapIconSourceStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an icon source that uses a bitmap as its content.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.BitmapIconSource](/windows/winui/api/microsoft.ui.xaml.controls.bitmapiconsource) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * **BitmapIconSource** is similar to [BitmapIcon](bitmapicon.md). However, because it is not a [FrameworkElement](../windows.ui.xaml/frameworkelement.md), it can be shared.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.bitmapiconsource
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class BitmapIconSource extends IconSource {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBitmapIconSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBitmapIconSource.IID

    /**
     * Identifies the UriSource dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.BitmapIconSource.UriSourceProperty](/windows/winui/api/microsoft.ui.xaml.controls.bitmapiconsource.urisourceproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.bitmapiconsource.urisourceproperty
     * @type {DependencyProperty} 
     */
    static UriSourceProperty {
        get => BitmapIconSource.get_UriSourceProperty()
    }

    /**
     * Identifies the ShowAsMonochrome dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.BitmapIconSource.ShowAsMonochromeProperty](/windows/winui/api/microsoft.ui.xaml.controls.bitmapiconsource.showasmonochromeproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.bitmapiconsource.showasmonochromeproperty
     * @type {DependencyProperty} 
     */
    static ShowAsMonochromeProperty {
        get => BitmapIconSource.get_ShowAsMonochromeProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {BitmapIconSource} 
     */
    static CreateInstance() {
        if (!BitmapIconSource.HasProp("__IBitmapIconSourceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.BitmapIconSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapIconSourceFactory.IID)
            BitmapIconSource.__IBitmapIconSourceFactory := IBitmapIconSourceFactory(factoryPtr)
        }

        return BitmapIconSource.__IBitmapIconSourceFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_UriSourceProperty() {
        if (!BitmapIconSource.HasProp("__IBitmapIconSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.BitmapIconSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapIconSourceStatics.IID)
            BitmapIconSource.__IBitmapIconSourceStatics := IBitmapIconSourceStatics(factoryPtr)
        }

        return BitmapIconSource.__IBitmapIconSourceStatics.get_UriSourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ShowAsMonochromeProperty() {
        if (!BitmapIconSource.HasProp("__IBitmapIconSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.BitmapIconSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapIconSourceStatics.IID)
            BitmapIconSource.__IBitmapIconSourceStatics := IBitmapIconSourceStatics(factoryPtr)
        }

        return BitmapIconSource.__IBitmapIconSourceStatics.get_ShowAsMonochromeProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the Uniform Resource Identifier (URI) of the bitmap to use as the icon content.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.BitmapIconSource.UriSource](/windows/winui/api/microsoft.ui.xaml.controls.bitmapiconsource.urisource) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.bitmapiconsource.urisource
     * @type {Uri} 
     */
    UriSource {
        get => this.get_UriSource()
        set => this.put_UriSource(value)
    }

    /**
     * Gets or sets a value that indicates whether the bitmap is shown in a single color.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.BitmapIconSource.ShowAsMonochrome](/windows/winui/api/microsoft.ui.xaml.controls.bitmapiconsource.showasmonochrome) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.bitmapiconsource.showasmonochrome
     * @type {Boolean} 
     */
    ShowAsMonochrome {
        get => this.get_ShowAsMonochrome()
        set => this.put_ShowAsMonochrome(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_UriSource() {
        if (!this.HasProp("__IBitmapIconSource")) {
            if ((queryResult := this.QueryInterface(IBitmapIconSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapIconSource := IBitmapIconSource(outPtr)
        }

        return this.__IBitmapIconSource.get_UriSource()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_UriSource(value) {
        if (!this.HasProp("__IBitmapIconSource")) {
            if ((queryResult := this.QueryInterface(IBitmapIconSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapIconSource := IBitmapIconSource(outPtr)
        }

        return this.__IBitmapIconSource.put_UriSource(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowAsMonochrome() {
        if (!this.HasProp("__IBitmapIconSource")) {
            if ((queryResult := this.QueryInterface(IBitmapIconSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapIconSource := IBitmapIconSource(outPtr)
        }

        return this.__IBitmapIconSource.get_ShowAsMonochrome()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShowAsMonochrome(value) {
        if (!this.HasProp("__IBitmapIconSource")) {
            if ((queryResult := this.QueryInterface(IBitmapIconSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapIconSource := IBitmapIconSource(outPtr)
        }

        return this.__IBitmapIconSource.put_ShowAsMonochrome(value)
    }

;@endregion Instance Methods
}
