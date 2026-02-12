#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\FrameworkElement.ahk
#Include .\IIconElement.ahk
#Include .\IIconElementFactory.ahk
#Include .\IIconElementStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the base class for an icon UI element.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.iconelement
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IconElement extends FrameworkElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIconElement

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIconElement.IID

    /**
     * Identifies the [Foreground](iconelement_foreground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.iconelement.foregroundproperty
     * @type {DependencyProperty} 
     */
    static ForegroundProperty {
        get => IconElement.get_ForegroundProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ForegroundProperty() {
        if (!IconElement.HasProp("__IIconElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.IconElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIconElementStatics.IID)
            IconElement.__IIconElementStatics := IIconElementStatics(factoryPtr)
        }

        return IconElement.__IIconElementStatics.get_ForegroundProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a brush that describes the foreground color.
     * @remarks
     * You can set the **Foreground** property on the [AppBarButton](appbarbutton.md) or on an [IconElement](iconelement.md) derived icon. If you set the [Foreground](control_foreground.md) on the [AppBarButton](appbarbutton.md), it's applied only to the default visual state. It's not applied to the other visual states defined in the [AppBarButton](appbarbutton.md) template, like `MouseOver`. If you set the Foreground on the [IconElement](iconelement.md) derived icon, the color is applied to all visual states.
     * 
     * The only valid [Brush](../windows.ui.xaml.media/brush.md) type for the Foreground value is [SolidColorBrush](../windows.ui.xaml.media/solidcolorbrush.md). If you attempt to use a brush that's not declaring a solid color, the value is ignored at run time and replaced with a [SolidColorBrush](../windows.ui.xaml.media/solidcolorbrush.md) that is white or black, depending on the current theme.
     * 
     * Foreground replaces the color information from a [BitmapIcon.UriSource](bitmapicon_urisource.md) source file. Any non-transparent pixel in the source image is replaced with the Foreground color.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.iconelement.foreground
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
        if (!this.HasProp("__IIconElement")) {
            if ((queryResult := this.QueryInterface(IIconElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIconElement := IIconElement(outPtr)
        }

        return this.__IIconElement.get_Foreground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Foreground(value) {
        if (!this.HasProp("__IIconElement")) {
            if ((queryResult := this.QueryInterface(IIconElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIconElement := IIconElement(outPtr)
        }

        return this.__IIconElement.put_Foreground(value)
    }

;@endregion Instance Methods
}
