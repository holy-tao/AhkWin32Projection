#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\FrameworkElement.ahk
#Include .\IImage.ahk
#Include .\IImage2.ahk
#Include .\IImage3.ahk
#Include .\IImageStatics.ahk
#Include ..\ExceptionRoutedEventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\ExceptionRoutedEventArgs.ahk
#Include ..\RoutedEventHandler.ahk
#Include ..\RoutedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a control that displays an image. The image source is specified by referring to an image file, using several supported formats. The image source can also be set with a stream. See Remarks for the list of supported image source formats.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.image
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class Image extends FrameworkElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IImage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IImage.IID

    /**
     * Identifies the [Source](image_source.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.image.sourceproperty
     * @type {DependencyProperty} 
     */
    static SourceProperty {
        get => Image.get_SourceProperty()
    }

    /**
     * Identifies the [Stretch](image_stretch.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.image.stretchproperty
     * @type {DependencyProperty} 
     */
    static StretchProperty {
        get => Image.get_StretchProperty()
    }

    /**
     * Identifies the [NineGrid](image_ninegrid.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.image.ninegridproperty
     * @type {DependencyProperty} 
     */
    static NineGridProperty {
        get => Image.get_NineGridProperty()
    }

    /**
     * Identifies the [PlayToSource](image_playtosource.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.image.playtosourceproperty
     * @type {DependencyProperty} 
     */
    static PlayToSourceProperty {
        get => Image.get_PlayToSourceProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SourceProperty() {
        if (!Image.HasProp("__IImageStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Image")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IImageStatics.IID)
            Image.__IImageStatics := IImageStatics(factoryPtr)
        }

        return Image.__IImageStatics.get_SourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StretchProperty() {
        if (!Image.HasProp("__IImageStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Image")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IImageStatics.IID)
            Image.__IImageStatics := IImageStatics(factoryPtr)
        }

        return Image.__IImageStatics.get_StretchProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_NineGridProperty() {
        if (!Image.HasProp("__IImageStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Image")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IImageStatics.IID)
            Image.__IImageStatics := IImageStatics(factoryPtr)
        }

        return Image.__IImageStatics.get_NineGridProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlayToSourceProperty() {
        if (!Image.HasProp("__IImageStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Image")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IImageStatics.IID)
            Image.__IImageStatics := IImageStatics(factoryPtr)
        }

        return Image.__IImageStatics.get_PlayToSourceProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the source for the image.
     * @remarks
     * Setting the Source property is inherently an asynchronous action. Because it's a property, there isn't an awaitable syntax, but for most scenarios you don't need to interact with the asynchronous aspects of image source file loading. The framework will wait for the image source to be returned, and will rerun layout when the image source file becomes available.
     * 
     * Setting the source to a Uniform Resource Identifier (URI) value that can't be resolved to a valid image source file does not throw an exception. Instead, it fires an [ImageFailed](image_imagefailed.md) event. Decoding failures also fire [ImageFailed](image_imagefailed.md). You can write an [ImageFailed](image_imagefailed.md) handler and attach it to the [Image](image.md) object to detect this, and possibly use the [ErrorMessage](../windows.ui.xaml/exceptionroutedeventargs_errormessage.md) in event data to determine the nature of the failure. Also, if you want to verify that an image source file was loaded correctly, you can handle the [ImageOpened](image_imageopened.md) event on the [Image](image.md) element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.image.source
     * @type {ImageSource} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * Gets or sets a value that describes how an [Image](image.md) should be stretched to fill the destination rectangle.
     * @remarks
     * The value of the Stretch property is only relevant if the [Image](image.md) instance is not already using explicitly set values for the [Height](../windows.ui.xaml/frameworkelement_height.md) and/or [Width](../windows.ui.xaml/frameworkelement_width.md) property, and if the [Image](image.md) instance is inside a container that can stretch the image to fill some available space in layout. If you set the value of the Stretch property to **None**, the image always retains its natural size, even if there's a layout container that might stretch it otherwise. For more info on image sizing, see Remarks in [Image](image.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.image.stretch
     * @type {Integer} 
     */
    Stretch {
        get => this.get_Stretch()
        set => this.put_Stretch(value)
    }

    /**
     * Gets or sets a value for a nine-grid metaphor that controls how the image can be resized. The nine-grid metaphor enables you to stretch edges and corners of an image differently than its center. See Remarks for more info and an illustration.
     * @remarks
     * When you use nine-grid rendering, you can specify how different areas of the image are stretched. This feature is useful for preserving the detail on image corners when an image scales or stretches.
     * 
     * Nine-grid rendering divides an image into a grid of nine sections:
     * 
     * <img src="images/ninegrid.png" alt="A grid of nine sections." />
     * Nine-grid rendering enables you to preserve the original dimensions of the corners (boxes 1, 3, 7, and 9). The top and bottom (boxes 2 and 8) are stretched horizontally only, and the sides (boxes 4 and 6) are stretched vertically only. The center (box 5) is stretched in both dimensions. To use nine-grid rendering, you create an [Image](image.md) element and specify a value for the NineGrid property—pixel values for the lengths of the left, top, right, and bottom sides of the grid. In XAML, you specify the NineGrid attribute value as a string that specifies pixel values for the sides in left, top, right, bottom order. Internally, this syntax creates a [Thickness](../windows.ui.xaml/thickness.md) object that represents this type of measurement. If you want a uniform value, you can specify just one value that's applied to all four edges.
     * 
     * Applying nine-grid rendering is very useful when the image itself includes some type of border or edge decoration embedded within the image source. For example, imagine you're using an image source for a [Button](button.md) that has the outline as part of an image with transparency. You might want the center area that contains an icon to stretch. But if you stretch the corners you might get aliasing artifacts from rounded corners. Or the border sides might get too thick and wouldn't look as good when scaled. To prevent that, you could use a NineGrid with uniform values that always keep the pixel size of the border the same size as in the image source.
     * 
     * Either in code or in XAML, the values for the [Thickness](../windows.ui.xaml/thickness.md) that you use to set the NineGrid property are device-independent pixel values.
     * 
     * Here's example XAML for an [Image](image.md) element using a NineGrid value:
     * 
     * 
     * 
     * ```xaml
     * <Image Source="Images/9grid.bmp" NineGrid="30,20,30,20" />
     * ```
     * 
     * 
     * 
     * A NineGrid value is only relevant for image rendering if the image does not have specific values set for [Width](../windows.ui.xaml/frameworkelement_width.md) and/or [Height](../windows.ui.xaml/frameworkelement_height.md), and where the image is being stretched (image is rendered into a larger container space and the value for [Stretch](image_stretch.md) is not** None**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.image.ninegrid
     * @type {Thickness} 
     */
    NineGrid {
        get => this.get_NineGrid()
        set => this.put_NineGrid(value)
    }

    /**
     * Gets the information that is transmitted if the [Image](image.md) is used for a Play To scenario.
     * @remarks
     * You can use Play To to enable users to easily stream audio, video, or images from their computer to devices in their home network. Image.PlayToSource is specifically for the XAML images version of this scenario.
     * 
     * Play To is part of the Devices charm. Users open the Devices charm to select devices from their home network that they can stream the media content to. When a user selects a Play To target from the Devices charm, Play To fires the [SourceRequested](../windows.media.playto/playtomanager_sourcerequested.md) event. Play To then streams the media element that was passed to the [SetSource](../windows.media.playto/playtosourcerequest_setsource_1024738425.md) method to the target device that the user has selected. Image.PlayToSource provides the [PlayToSource](../windows.media.playto/playtosource.md) controller object that the [PlayToManager](../windows.media.playto/playtomanager.md) can use in this scenario. For an example of how to use Play To in an application, see [PlayReady DRM](/windows/uwp/audio-video-camera/playready-client-sdk).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.image.playtosource
     * @type {PlayToSource} 
     */
    PlayToSource {
        get => this.get_PlayToSource()
    }

    /**
     * Occurs when there is an error associated with image retrieval or format.
     * @remarks
     * Conditions in which this event can occur include:
     * 
     * 
     * + File not found
     * + Invalid (unrecognized or unsupported) file format
     * + Unknown file format decoding error after upload
     * + Qualified resource reload by the system
     * You might be able to use the [ErrorMessage](../windows.ui.xaml/exceptionroutedeventargs_errormessage.md) in event data to determine the nature of the failure.
     * 
     * ImageFailed and [ImageOpened](image_imageopened.md) are mutually exclusive. One event or the other will always fire whenever an [Image](image.md) has a [Source](image_source.md) value set or reset.
     * 
     * One scenario for handling ImageFailed is to set the [UriSource](../windows.ui.xaml.media.imaging/bitmapimage_urisource.md) of the underlying [BitmapImage](../windows.ui.xaml.media.imaging/bitmapimage.md) source to a different local image file. This can serve as a fallback value to display instead of empty space. For example, if you are trying to display an external image where it's possible that the source is no longer there, or for when the user has no Internet connection, you could set the [UriSource](../windows.ui.xaml.media.imaging/bitmapimage_urisource.md) to reference a local fallback or placeholder image that's part of your app package and is always guaranteed to be available.
     * 
     * When the Image element isn’t in the live visual tree, the Image element will not fire [ImageOpened](image_imageopened.md) or ImageFailed events.  If you need to receive these events while the element isn’t in the live tree, use the BitmapImage.[ImageOpened](../windows.ui.xaml.media.imaging/bitmapimage_imageopened.md)/[ImageFailed](../windows.ui.xaml.media.imaging/bitmapimage_imagefailed.md) events.
     * 
     * 
     * ```csharp
     * private void Image_ImageFailed(object sender, ExceptionRoutedEventArgs e) {
     *     Image img = sender as Image;
     *     BitmapImage fallbackImage = new BitmapImage(new Uri("ms-appx:///Images/fallback.png"));
     *     img.Width = 100; //set to known width of this source's natural size
     *      //might instead want image to stretch to fill, depends on scenario
     *     img.Source = fallbackImage;
     * }
     * ```
     * 
     * 
     * 
     * 
     * <!--The following remark is relevant for Windows 8 > 8.1 migration. See WBB 459121-->
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
     * Occurs when the image source is downloaded and decoded with no failure. You can use this event to determine the natural size of the image source.
     * @remarks
     * When ImageOpened fires, that serves as the notification that any asynchronous operations have completed and all the properties of the object used as the image source are ready for use. For example, to determine the size of the image, handle ImageOpened, and check the value of the [PixelWidth](../windows.ui.xaml.media.imaging/bitmapsource_pixelwidth.md) and [PixelHeight](../windows.ui.xaml.media.imaging/bitmapsource_pixelheight.md) properties on the object referenced as [Image.Source](image_source.md). The event data for the ImageOpened event isn't typically useful.
     * 
     * When the Image element isn’t in the live visual tree, the Image element will not fire ImageOpened or [ImageFailed](image_imagefailed.md) events.  If you need to receive these events while the element isn’t in the live tree, use the BitmapImage.[ImageOpened](../windows.ui.xaml.media.imaging/bitmapimage_imageopened.md)/[ImageFailed](../windows.ui.xaml.media.imaging/bitmapimage_imagefailed.md) events.
     * 
     * <!--The following remark is relevant for Windows 8 > 8.1 migration. See WBB 459121-->
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
     * Initializes a new instance of the [Image](image.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Image")
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
    get_Source() {
        if (!this.HasProp("__IImage")) {
            if ((queryResult := this.QueryInterface(IImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImage := IImage(outPtr)
        }

        return this.__IImage.get_Source()
    }

    /**
     * 
     * @param {ImageSource} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        if (!this.HasProp("__IImage")) {
            if ((queryResult := this.QueryInterface(IImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImage := IImage(outPtr)
        }

        return this.__IImage.put_Source(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Stretch() {
        if (!this.HasProp("__IImage")) {
            if ((queryResult := this.QueryInterface(IImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImage := IImage(outPtr)
        }

        return this.__IImage.get_Stretch()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Stretch(value) {
        if (!this.HasProp("__IImage")) {
            if ((queryResult := this.QueryInterface(IImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImage := IImage(outPtr)
        }

        return this.__IImage.put_Stretch(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_NineGrid() {
        if (!this.HasProp("__IImage")) {
            if ((queryResult := this.QueryInterface(IImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImage := IImage(outPtr)
        }

        return this.__IImage.get_NineGrid()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_NineGrid(value) {
        if (!this.HasProp("__IImage")) {
            if ((queryResult := this.QueryInterface(IImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImage := IImage(outPtr)
        }

        return this.__IImage.put_NineGrid(value)
    }

    /**
     * 
     * @returns {PlayToSource} 
     */
    get_PlayToSource() {
        if (!this.HasProp("__IImage")) {
            if ((queryResult := this.QueryInterface(IImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImage := IImage(outPtr)
        }

        return this.__IImage.get_PlayToSource()
    }

    /**
     * 
     * @param {ExceptionRoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ImageFailed(handler) {
        if (!this.HasProp("__IImage")) {
            if ((queryResult := this.QueryInterface(IImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImage := IImage(outPtr)
        }

        return this.__IImage.add_ImageFailed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ImageFailed(token) {
        if (!this.HasProp("__IImage")) {
            if ((queryResult := this.QueryInterface(IImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImage := IImage(outPtr)
        }

        return this.__IImage.remove_ImageFailed(token)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ImageOpened(handler) {
        if (!this.HasProp("__IImage")) {
            if ((queryResult := this.QueryInterface(IImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImage := IImage(outPtr)
        }

        return this.__IImage.add_ImageOpened(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ImageOpened(token) {
        if (!this.HasProp("__IImage")) {
            if ((queryResult := this.QueryInterface(IImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImage := IImage(outPtr)
        }

        return this.__IImage.remove_ImageOpened(token)
    }

    /**
     * Returns the image as a [CastingSource](../windows.media.casting/castingsource.md).
     * @remarks
     * For more info about using [Image](image.md) as a casting source, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * @returns {CastingSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.image.getascastingsource
     */
    GetAsCastingSource() {
        if (!this.HasProp("__IImage2")) {
            if ((queryResult := this.QueryInterface(IImage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImage2 := IImage2(outPtr)
        }

        return this.__IImage2.GetAsCastingSource()
    }

    /**
     * Returns a mask that represents the alpha channel of an image as a [CompositionBrush](../windows.ui.composition/compositionbrush.md).
     * @remarks
     * This method gets an alpha mask from an image as a [CompositionBrush](../windows.ui.composition/compositionbrush.md) that you can use as an input to composition shadows and effects. The alpha mask [CompositionBrush](../windows.ui.composition/compositionbrush.md) has the same alignment and stretch property values that the source XAML element applies to its rendered content so that you can use those values to correctly position shadows or effects relative to the XAML element.
     * @returns {CompositionBrush} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.image.getalphamask
     */
    GetAlphaMask() {
        if (!this.HasProp("__IImage3")) {
            if ((queryResult := this.QueryInterface(IImage3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImage3 := IImage3(outPtr)
        }

        return this.__IImage3.GetAlphaMask()
    }

;@endregion Instance Methods
}
