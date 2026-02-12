#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\IconElement.ahk
#Include .\IBitmapIcon.ahk
#Include .\IBitmapIcon2.ahk
#Include .\IBitmapIconStatics2.ahk
#Include .\IBitmapIconStatics.ahk
#Include .\IBitmapIconFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an icon that uses a bitmap as its content.
 * @remarks
 * > [!NOTE]
 * > BitmapIcon is typically used to provide the icon for an AppBarButton, and the remarks in this section assume this usage. However, it can be used anywhere a UIElement can be used. The remarks apply to all usages.
 * 
 * To use a BitmapIcon as the [Icon](appbarbutton_icon.md) for an [AppBarButton](appbarbutton.md), you specify the URI of an image file.
 * 
 * The file that you use should be a solid image on a transparent background. The bitmap image as retrieved from the [UriSource](bitmapicon_urisource.md) location is expected to be a true bitmap that has transparent pixels and non-transparent pixels. The recommended format is PNG. Other file-format image sources will load apparently without error but result in a solid block of the foreground color inside the [AppBarButton](appbarbutton.md). This behavior can be ignored by setting the [ShowAsMonochrome](bitmapicon_showasmonochrome.md) property to false.
 * 
 * All color info is stripped from the bitmap when the BitmapIcon is rendered. The remaining non-transparent colors are combined to produce an image that's entirely the foreground color as set by the [Foreground](iconelement_foreground.md) property (this typically comes from styles or templates, such as the default template resolving to a theme resource). You can override this behavior by setting the [ShowAsMonochrome](bitmapicon_showasmonochrome.md) property.
 * 
 * The value of the [Foreground](iconelement_foreground.md) property must be a [SolidColorBrush](../windows.ui.xaml.media/solidcolorbrush.md). After the Foreground's Color property is read, changes to it are ignored. To change the  color you must change the value of the Foreground property itself to a new SolidColorBrush.
 * 
 * > [!NOTE]
 * > You can set the **Foreground** property on the [AppBarButton](appbarbutton.md) or on the BitmapIcon. If you set the [Foreground](control_foreground.md) on the [AppBarButton](appbarbutton.md), it's applied only to the default visual state. It's not applied to the other visual states defined in the [AppBarButton](appbarbutton.md) template, like `MouseOver`. If you set the [Foreground](iconelement_foreground.md) on the BitmapIcon, the color is applied to all visual states.
 * 
 * The default font size for an AppBarButton Icon is 20px.
 * 
 * You typically specify a [UriSource](bitmapicon_urisource.md) value that references a bitmap that you've included as part of the app, as a resource or otherwise within the app package. For more info on the **ms-appx:** scheme and other URI schemes that you can use to reference resources in your app, see [Uri schemes](/previous-versions/windows/apps/jj655406(v=win.10)).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.bitmapicon
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class BitmapIcon extends IconElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBitmapIcon

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBitmapIcon.IID

    /**
     * Identifies the [ShowAsMonochrome](bitmapicon_showasmonochrome.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.bitmapicon.showasmonochromeproperty
     * @type {DependencyProperty} 
     */
    static ShowAsMonochromeProperty {
        get => BitmapIcon.get_ShowAsMonochromeProperty()
    }

    /**
     * Identifies the [UriSource](bitmapicon_urisource.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.bitmapicon.urisourceproperty
     * @type {DependencyProperty} 
     */
    static UriSourceProperty {
        get => BitmapIcon.get_UriSourceProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ShowAsMonochromeProperty() {
        if (!BitmapIcon.HasProp("__IBitmapIconStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.BitmapIcon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapIconStatics2.IID)
            BitmapIcon.__IBitmapIconStatics2 := IBitmapIconStatics2(factoryPtr)
        }

        return BitmapIcon.__IBitmapIconStatics2.get_ShowAsMonochromeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_UriSourceProperty() {
        if (!BitmapIcon.HasProp("__IBitmapIconStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.BitmapIcon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapIconStatics.IID)
            BitmapIcon.__IBitmapIconStatics := IBitmapIconStatics(factoryPtr)
        }

        return BitmapIcon.__IBitmapIconStatics.get_UriSourceProperty()
    }

    /**
     * 
     * @returns {BitmapIcon} 
     */
    static CreateInstance() {
        if (!BitmapIcon.HasProp("__IBitmapIconFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.BitmapIcon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapIconFactory.IID)
            BitmapIcon.__IBitmapIconFactory := IBitmapIconFactory(factoryPtr)
        }

        return BitmapIcon.__IBitmapIconFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the Uniform Resource Identifier (URI) of the bitmap to use as the icon content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.bitmapicon.urisource
     * @type {Uri} 
     */
    UriSource {
        get => this.get_UriSource()
        set => this.put_UriSource(value)
    }

    /**
     * Gets or sets a value that indicates whether the bitmap is shown in a single color.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.bitmapicon.showasmonochrome
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
        if (!this.HasProp("__IBitmapIcon")) {
            if ((queryResult := this.QueryInterface(IBitmapIcon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapIcon := IBitmapIcon(outPtr)
        }

        return this.__IBitmapIcon.get_UriSource()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_UriSource(value) {
        if (!this.HasProp("__IBitmapIcon")) {
            if ((queryResult := this.QueryInterface(IBitmapIcon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapIcon := IBitmapIcon(outPtr)
        }

        return this.__IBitmapIcon.put_UriSource(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowAsMonochrome() {
        if (!this.HasProp("__IBitmapIcon2")) {
            if ((queryResult := this.QueryInterface(IBitmapIcon2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapIcon2 := IBitmapIcon2(outPtr)
        }

        return this.__IBitmapIcon2.get_ShowAsMonochrome()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShowAsMonochrome(value) {
        if (!this.HasProp("__IBitmapIcon2")) {
            if ((queryResult := this.QueryInterface(IBitmapIcon2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapIcon2 := IBitmapIcon2(outPtr)
        }

        return this.__IBitmapIcon2.put_ShowAsMonochrome(value)
    }

;@endregion Instance Methods
}
