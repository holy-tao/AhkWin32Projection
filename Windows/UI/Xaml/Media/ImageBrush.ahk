#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\TileBrush.ahk
#Include .\IImageBrush.ahk
#Include .\IImageBrushStatics.ahk
#Include ..\ExceptionRoutedEventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\ExceptionRoutedEventArgs.ahk
#Include ..\RoutedEventHandler.ahk
#Include ..\RoutedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Paints an area with an image. The image source is typically obtained from file formats such as Joint Photographic Experts Group (JPEG).
 * @remarks
 * An ImageBrush is a type of [brush](brush.md) that defines its content as an image which can be optionally stretched and aligned. Uses for an ImageBrush include decorative effects for text, or image backgrounds for controls or layout containers.
 * 
 * It's useful to use an ImageBrush instead of an [Image control](/uwp/api/Windows.UI.Xaml.Controls.Image) in two main  scenarios:
 * 
 * 1. You want to paint a non-rectangular area such as an ellipse or border with an image
 * 2. You want to use a single ImageBrush to paint multiple areas or UIElements with the same image, which is more efficient than using multiple [Image](/uwp/api/Windows.UI.Xaml.Controls.Image) controls
 * 
 * 
 * If you define an ImageBrush using code, use the default constructor, then set [ImageBrush.ImageSource](imagebrush_imagesource.md). This requires a [BitmapImage](../windows.ui.xaml.media.imaging/bitmapimage.md) (not a Uniform Resource Identifier (URI)) in code. If your source is a stream, use the [SetSourceAsync](../windows.ui.xaml.media.imaging/bitmapsource_setsourceasync_1118221574.md) method to initialize the value. If your source is a Uniform Resource Identifier (URI), which includes content in your app that uses the **ms-appx** or **ms-resource** schemes, use the [BitmapImage](../windows.ui.xaml.media.imaging/bitmapimage_bitmapimage_843413386.md) constructor that takes a Uniform Resource Identifier (URI). You might also consider handling the [ImageOpened](imagebrush_imageopened.md) event if there are any timing issues with retrieving or decoding the image source, where you might need alternate content to display until the image source is available. See [XAML images sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/XAML%20images%20sample) for example code.
 * 
 * > [!NOTE]
 * > You can use automatic handling for accessing unqualified resources with current scale and culture qualifiers, or you can use [ResourceManager](../windows.applicationmodel.resources.core/resourcemanager.md) and [ResourceMap](../windows.applicationmodel.resources.core/resourcemap.md) with qualifiers for culture and scale to obtain the resources directly. For more info see [Resource management system](/windows/uwp/app-resources/resource-management-system).
 * 
 * The [Stretch](tilebrush_stretch.md) property is important for how the image is applied when used as a brush. Some images look good when stretched as applied to a particular [Brush](brush.md) property with the **Fill** behavior whereas other images do not stretch or scale well and might require a value of **None** or **Uniform** for [Stretch](tilebrush_stretch.md). Experiment with different values for [Stretch](tilebrush_stretch.md) to see which behavior looks best when applied to the UI.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imagebrush
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class ImageBrush extends TileBrush {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IImageBrush

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IImageBrush.IID

    /**
     * Identifies the [ImageSource](imagebrush_imagesource.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imagebrush.imagesourceproperty
     * @type {DependencyProperty} 
     */
    static ImageSourceProperty {
        get => ImageBrush.get_ImageSourceProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ImageSourceProperty() {
        if (!ImageBrush.HasProp("__IImageBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.ImageBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IImageBrushStatics.IID)
            ImageBrush.__IImageBrushStatics := IImageBrushStatics(factoryPtr)
        }

        return ImageBrush.__IImageBrushStatics.get_ImageSourceProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the image source displayed by this [ImageBrush](imagebrush.md). In code you set this with an [ImageSource](imagesource.md) subclass instance, in XAML you set this with a URI to an image source file.
     * @remarks
     * Setting an image source from an image source file or stream is inherently an asynchronous action. Setting the source to a Uniform Resource Identifier (URI) value that cannot be resolved to a valid image source file does not throw an error. Instead, it fires an [ImageFailed](imagebrush_imagefailed.md) event on the [ImageBrush](imagebrush.md). If you want to verify that an image source file did load correctly, you can handle [ImageOpened](imagebrush_imageopened.md) for verification, plus [ImageFailed](imagebrush_imagefailed.md) as a way to provide a fallback image source or recompose your UI.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imagebrush.imagesource
     * @type {ImageSource} 
     */
    ImageSource {
        get => this.get_ImageSource()
        set => this.put_ImageSource(value)
    }

    /**
     * Occurs when there is an error associated with image retrieval or format.
     * @remarks
     * If this event fires, that means that the [ImageSource](imagebrush_imagesource.md) value has been asynchronously determined to not be available, or is not suitable for use. Conditions in which this event can occur include:
     * 
     * 
     * + File not found
     * + Invalid (unrecognized or unsupported) file format
     * + Unknown file format decoding error after upload
     * An [ImageBrush](imagebrush.md) in this situation won't display anything. There is no default "missing image" placeholder image for app images as there might be when a browser can't resolve an image URI. If you want behavior like that you'll have to implement it.
     * 
     * ImageFailed and [ImageOpened](imagebrush_imageopened.md) are mutually exclusive. One event or the other will always file whenever an [ImageBrush](imagebrush.md) has the [ImageSource](imagebrush_imagesource.md) value set or reset.
     * @type {ExceptionRoutedEventHandler}
    */
    OnImageFailed {
        get {
            if(!this.HasProp("__OnImageFailed")){
                this.__OnImageFailed := WinRTEventHandler(
                    ExceptionRoutedEventHandler,
                    ExceptionRoutedEventHandler.IID,
                    IInspectable,
                    ExceptionRoutedEventArgs
                )
                this.__OnImageFailedToken := this.add_ImageFailed(this.__OnImageFailed.iface)
            }
            return this.__OnImageFailed
        }
    }

    /**
     * Occurs when the image source is downloaded and decoded with no failure. You can use this event to determine the size of an image before rendering it.
     * @remarks
     * For the scenario of checking the size of an image before rendering, that info isn't part of the ImageOpened event data. Instead, the fact that the event fired is the notification that the [PixelHeight](../windows.ui.xaml.media.imaging/bitmapsource_pixelheight.md) and [PixelWidth](../windows.ui.xaml.media.imaging/bitmapsource_pixelwidth.md) values of the image source ([ImageSource](imagebrush_imagesource.md) value) are available.
     * @type {RoutedEventHandler}
    */
    OnImageOpened {
        get {
            if(!this.HasProp("__OnImageOpened")){
                this.__OnImageOpened := WinRTEventHandler(
                    RoutedEventHandler,
                    RoutedEventHandler.IID,
                    IInspectable,
                    RoutedEventArgs
                )
                this.__OnImageOpenedToken := this.add_ImageOpened(this.__OnImageOpened.iface)
            }
            return this.__OnImageOpened
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ImageBrush](imagebrush.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.ImageBrush")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnImageFailedToken")) {
            this.remove_ImageFailed(this.__OnImageFailedToken)
            this.__OnImageFailed.iface.Dispose()
        }

        if(this.HasProp("__OnImageOpenedToken")) {
            this.remove_ImageOpened(this.__OnImageOpenedToken)
            this.__OnImageOpened.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {ImageSource} 
     */
    get_ImageSource() {
        if (!this.HasProp("__IImageBrush")) {
            if ((queryResult := this.QueryInterface(IImageBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageBrush := IImageBrush(outPtr)
        }

        return this.__IImageBrush.get_ImageSource()
    }

    /**
     * 
     * @param {ImageSource} value 
     * @returns {HRESULT} 
     */
    put_ImageSource(value) {
        if (!this.HasProp("__IImageBrush")) {
            if ((queryResult := this.QueryInterface(IImageBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageBrush := IImageBrush(outPtr)
        }

        return this.__IImageBrush.put_ImageSource(value)
    }

    /**
     * 
     * @param {ExceptionRoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ImageFailed(handler) {
        if (!this.HasProp("__IImageBrush")) {
            if ((queryResult := this.QueryInterface(IImageBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageBrush := IImageBrush(outPtr)
        }

        return this.__IImageBrush.add_ImageFailed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ImageFailed(token) {
        if (!this.HasProp("__IImageBrush")) {
            if ((queryResult := this.QueryInterface(IImageBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageBrush := IImageBrush(outPtr)
        }

        return this.__IImageBrush.remove_ImageFailed(token)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ImageOpened(handler) {
        if (!this.HasProp("__IImageBrush")) {
            if ((queryResult := this.QueryInterface(IImageBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageBrush := IImageBrush(outPtr)
        }

        return this.__IImageBrush.add_ImageOpened(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ImageOpened(token) {
        if (!this.HasProp("__IImageBrush")) {
            if ((queryResult := this.QueryInterface(IImageBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageBrush := IImageBrush(outPtr)
        }

        return this.__IImageBrush.remove_ImageOpened(token)
    }

;@endregion Instance Methods
}
