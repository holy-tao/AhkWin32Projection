#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\BitmapSource.ahk
#Include .\IBitmapImage.ahk
#Include .\IBitmapImage2.ahk
#Include .\IBitmapImage3.ahk
#Include .\IBitmapImageStatics3.ahk
#Include .\IBitmapImageStatics.ahk
#Include .\IBitmapImageFactory.ahk
#Include .\IBitmapImageStatics2.ahk
#Include .\DownloadProgressEventHandler.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\DownloadProgressEventArgs.ahk
#Include ..\..\RoutedEventHandler.ahk
#Include ..\..\RoutedEventArgs.ahk
#Include ..\..\ExceptionRoutedEventHandler.ahk
#Include ..\..\ExceptionRoutedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides the practical object source type for the [Image.Source](../windows.ui.xaml.controls/image_source.md) and [ImageBrush.ImageSource](../windows.ui.xaml.media/imagebrush_imagesource.md) properties. You can define a BitmapImage by using a Uniform Resource Identifier (URI) that references an image source file, or by calling [SetSourceAsync](bitmapsource_setsourceasync_1118221574.md) and supplying a stream.
 * @remarks
 * A BitmapImage can be sourced from these image file formats:
 * 
 * + Joint Photographic Experts Group (JPEG)
 * + Portable Network Graphics (PNG)
 * + bitmap (BMP)
 * + Graphics Interchange Format (GIF)
 * + Tagged Image File Format (TIFF)
 * + JPEG XR
 * + icons (ICO)
 * 
 * If the image source is a stream, that stream is expected to contain an image file in one of these formats.
 * 
 * The BitmapImage class represents an abstraction so that an image source can be set asynchronously but still be referenced in XAML markup as a property value, or in code as an object that doesn't use awaitable syntax. When you create a BitmapImage object in code, it initially has no valid source. You should then set its source using one of these techniques:
 * 
 * + Use the [BitmapImage(Uri)](bitmapimage_bitmapimage_843413386.md) constructor rather than the default constructor. Although it's a constructor you can think of this as having an implicit asynchronous behavior: the BitmapImage won't be ready for use until it raises an [ImageOpened](bitmapimage_imageopened.md) event that indicates a successful async source set operation.
 * + Set the [UriSource](bitmapimage_urisource.md) property. As with using the **Uri** constructor, this action is implicitly asynchronous, and the BitmapImage won't be ready for use until it raises an [ImageOpened](bitmapimage_imageopened.md) event.
 * + Use [SetSourceAsync](bitmapsource_setsourceasync_1118221574.md). This method is explicitly asynchronous.
 *  The properties where you might use a BitmapImage, such as [Image.Source](../windows.ui.xaml.controls/image_source.md), are designed for this asynchronous behavior, and won't throw exceptions if they are set using a BitmapImage that doesn't have a complete source yet. Rather than handling exceptions, you should handle [ImageOpened](bitmapimage_imageopened.md) or [ImageFailed](bitmapimage_imagefailed.md) events either on the BitmapImage directly or on the control that uses the source (if those events are available on the control class).
 * 
 * [ImageFailed](bitmapimage_imagefailed.md) and [ImageOpened](bitmapimage_imageopened.md) are mutually exclusive. One event or the other will always be raised whenever a BitmapImage object has its source value set or reset.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapimage
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class BitmapImage extends BitmapSource {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBitmapImage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBitmapImage.IID

    /**
     * Identifies the [IsAnimatedBitmap](bitmapimage_isanimatedbitmap.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapimage.isanimatedbitmapproperty
     * @type {DependencyProperty} 
     */
    static IsAnimatedBitmapProperty {
        get => BitmapImage.get_IsAnimatedBitmapProperty()
    }

    /**
     * Identifies the [IsPlaying](bitmapimage_isplaying.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapimage.isplayingproperty
     * @type {DependencyProperty} 
     */
    static IsPlayingProperty {
        get => BitmapImage.get_IsPlayingProperty()
    }

    /**
     * Identifies the [AutoPlay](bitmapimage_autoplay.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapimage.autoplayproperty
     * @type {DependencyProperty} 
     */
    static AutoPlayProperty {
        get => BitmapImage.get_AutoPlayProperty()
    }

    /**
     * Identifies the [CreateOptions](bitmapimage_createoptions.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapimage.createoptionsproperty
     * @type {DependencyProperty} 
     */
    static CreateOptionsProperty {
        get => BitmapImage.get_CreateOptionsProperty()
    }

    /**
     * Identifies the [UriSource](bitmapimage_urisource.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapimage.urisourceproperty
     * @type {DependencyProperty} 
     */
    static UriSourceProperty {
        get => BitmapImage.get_UriSourceProperty()
    }

    /**
     * Identifies the [DecodePixelWidth](bitmapimage_decodepixelwidth.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapimage.decodepixelwidthproperty
     * @type {DependencyProperty} 
     */
    static DecodePixelWidthProperty {
        get => BitmapImage.get_DecodePixelWidthProperty()
    }

    /**
     * Identifies the [DecodePixelHeight](bitmapimage_decodepixelheight.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapimage.decodepixelheightproperty
     * @type {DependencyProperty} 
     */
    static DecodePixelHeightProperty {
        get => BitmapImage.get_DecodePixelHeightProperty()
    }

    /**
     * Identifies the [DecodePixelType](bitmapimage_decodepixeltype.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapimage.decodepixeltypeproperty
     * @type {DependencyProperty} 
     */
    static DecodePixelTypeProperty {
        get => BitmapImage.get_DecodePixelTypeProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsAnimatedBitmapProperty() {
        if (!BitmapImage.HasProp("__IBitmapImageStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.BitmapImage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapImageStatics3.IID)
            BitmapImage.__IBitmapImageStatics3 := IBitmapImageStatics3(factoryPtr)
        }

        return BitmapImage.__IBitmapImageStatics3.get_IsAnimatedBitmapProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsPlayingProperty() {
        if (!BitmapImage.HasProp("__IBitmapImageStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.BitmapImage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapImageStatics3.IID)
            BitmapImage.__IBitmapImageStatics3 := IBitmapImageStatics3(factoryPtr)
        }

        return BitmapImage.__IBitmapImageStatics3.get_IsPlayingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AutoPlayProperty() {
        if (!BitmapImage.HasProp("__IBitmapImageStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.BitmapImage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapImageStatics3.IID)
            BitmapImage.__IBitmapImageStatics3 := IBitmapImageStatics3(factoryPtr)
        }

        return BitmapImage.__IBitmapImageStatics3.get_AutoPlayProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CreateOptionsProperty() {
        if (!BitmapImage.HasProp("__IBitmapImageStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.BitmapImage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapImageStatics.IID)
            BitmapImage.__IBitmapImageStatics := IBitmapImageStatics(factoryPtr)
        }

        return BitmapImage.__IBitmapImageStatics.get_CreateOptionsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_UriSourceProperty() {
        if (!BitmapImage.HasProp("__IBitmapImageStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.BitmapImage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapImageStatics.IID)
            BitmapImage.__IBitmapImageStatics := IBitmapImageStatics(factoryPtr)
        }

        return BitmapImage.__IBitmapImageStatics.get_UriSourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DecodePixelWidthProperty() {
        if (!BitmapImage.HasProp("__IBitmapImageStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.BitmapImage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapImageStatics.IID)
            BitmapImage.__IBitmapImageStatics := IBitmapImageStatics(factoryPtr)
        }

        return BitmapImage.__IBitmapImageStatics.get_DecodePixelWidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DecodePixelHeightProperty() {
        if (!BitmapImage.HasProp("__IBitmapImageStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.BitmapImage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapImageStatics.IID)
            BitmapImage.__IBitmapImageStatics := IBitmapImageStatics(factoryPtr)
        }

        return BitmapImage.__IBitmapImageStatics.get_DecodePixelHeightProperty()
    }

    /**
     * Initializes a new instance of the [BitmapImage](bitmapimage.md) class, using the supplied Uniform Resource Identifier (URI).
     * @param {Uri} uriSource A reference to the image source file.
     * @returns {BitmapImage} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapimage.#ctor
     */
    static CreateInstanceWithUriSource(uriSource) {
        if (!BitmapImage.HasProp("__IBitmapImageFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.BitmapImage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapImageFactory.IID)
            BitmapImage.__IBitmapImageFactory := IBitmapImageFactory(factoryPtr)
        }

        return BitmapImage.__IBitmapImageFactory.CreateInstanceWithUriSource(uriSource)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DecodePixelTypeProperty() {
        if (!BitmapImage.HasProp("__IBitmapImageStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.BitmapImage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapImageStatics2.IID)
            BitmapImage.__IBitmapImageStatics2 := IBitmapImageStatics2(factoryPtr)
        }

        return BitmapImage.__IBitmapImageStatics2.get_DecodePixelTypeProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the [BitmapCreateOptions](bitmapcreateoptions.md) for a [BitmapImage](bitmapimage.md).
     * @remarks
     * The other possible value for CreateOptions is [BitmapCreateOptions.IgnoreImageCache](bitmapcreateoptions.md). You should only use [BitmapCreateOptions.IgnoreImageCache](bitmapcreateoptions.md) in cases where you know that the source image file as retrieved by Uniform Resource Identifier (URI) has the potential to change over time. Otherwise, setting CreateOptions to use [BitmapCreateOptions.IgnoreImageCache](bitmapcreateoptions.md) causes all newly retrieved image sources to be decoded again, which can negatively impact performance. [BitmapCreateOptions.IgnoreImageCache](bitmapcreateoptions.md) is typically only used by design tools that directly manipulate an image in a file location and need to enforce that any URI-determined content is always reloaded from the location, not from the cache.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapimage.createoptions
     * @type {Integer} 
     */
    CreateOptions {
        get => this.get_CreateOptions()
        set => this.put_CreateOptions(value)
    }

    /**
     * Gets or sets the Uniform Resource Identifier (URI) of the graphics source file that generated this [BitmapImage](bitmapimage.md).
     * @remarks
     * The [BaseUri](../windows.ui.xaml/frameworkelement_baseuri.md) property might be useful for forming the URI if you're applying an image source file to a particular [Image](../windows.ui.xaml.controls/image.md) element.
     * 
     * In low memory situations (most likely on lower-memory phones), it is possible for an exception to be raised with the message "The image is unrecognized" and an HRESULT of 0x88982F60. While this exception ordinarily indicates bad data, if your app is close to its memory limit then the cause of the exception is likely to be low memory. In that case, we recommend that you free memory and try again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapimage.urisource
     * @type {Uri} 
     */
    UriSource {
        get => this.get_UriSource()
        set => this.put_UriSource(value)
    }

    /**
     * Gets or sets the width to use for image decoding operations.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapimage.decodepixelwidth
     * @type {Integer} 
     */
    DecodePixelWidth {
        get => this.get_DecodePixelWidth()
        set => this.put_DecodePixelWidth(value)
    }

    /**
     * Gets or sets the height to use for image decoding operations.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapimage.decodepixelheight
     * @type {Integer} 
     */
    DecodePixelHeight {
        get => this.get_DecodePixelHeight()
        set => this.put_DecodePixelHeight(value)
    }

    /**
     * Gets or sets a value that determines how [DecodePixelWidth](bitmapimage_decodepixelwidth.md) and [DecodePixelHeight](bitmapimage_decodepixelheight.md) values are interpreted for decoding operations.
     * @remarks
     * DecodePixelType can be set to **Logical** or **Physical**. The default value is **Physical**. If DecodePixelType is not set, or set to **Physical**, the image is decoded using [DecodePixelWidth](bitmapimage_decodepixelwidth.md) and [DecodePixelHeight](bitmapimage_decodepixelheight.md) values that represent physical pixels, and the decode operation uses these values directly. If DecodePixelType is set to **Logical**, the image is decoded using [DecodePixelWidth](bitmapimage_decodepixelwidth.md) and [DecodePixelHeight](bitmapimage_decodepixelheight.md) values that represent logical pixels. Internal logic converts the decode width and height based on device resolution info and how logical and physical pixels are factored on the target device.
     * 
     * [Width](../windows.ui.xaml/frameworkelement_width.md) and [Height](../windows.ui.xaml/frameworkelement_height.md) for the [Image](../windows.ui.xaml.controls/image.md) element are specified in logical pixels once the image is rendered, but those logical pixels are influenced by the device resolution. For the [BitmapImage](bitmapimage.md) element that represents the image file source, [DecodePixelWidth](bitmapimage_decodepixelwidth.md) and [DecodePixelHeight](bitmapimage_decodepixelheight.md) are specified in physical pixels, by default. The physical pixel values for provided for the decode operation influences the size of the bitmap that's created in memory. By specifying DecodePixelType as **Logical**, the image is decoded using values that are pre-factored for the logical resolution, and it potentially won't use as much memory. For more info on device resolution and image sources, see [Effective pixels and scaling](/windows/apps/design/basics).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapimage.decodepixeltype
     * @type {Integer} 
     */
    DecodePixelType {
        get => this.get_DecodePixelType()
        set => this.put_DecodePixelType(value)
    }

    /**
     * Gets a value that indicates whether an image is animated.
     * @remarks
     * Starting in Windows 10, version 1607, the XAML [Image](../windows.ui.xaml.controls/image.md) element supports animated GIF images. When you use a [BitmapImage](bitmapimage.md) as the image [Source](../windows.ui.xaml.controls/image_source.md), you can access [BitmapImage](bitmapimage.md)  API to control playback of the animated GIF image. For more info, see the 'Animated images' section of the [BitmapImage](bitmapimage.md) class Remarks and the [Animated GIF playback sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/XamlAnimatedGif).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapimage.isanimatedbitmap
     * @type {Boolean} 
     */
    IsAnimatedBitmap {
        get => this.get_IsAnimatedBitmap()
    }

    /**
     * Gets a value that indicates whether an animated image is playing.
     * @remarks
     * Starting in Windows 10, version 1607, the XAML [Image](../windows.ui.xaml.controls/image.md) element supports animated GIF images. When you use a [BitmapImage](bitmapimage.md) as the image [Source](../windows.ui.xaml.controls/image_source.md), you can access [BitmapImage](bitmapimage.md)  API to control playback of the animated GIF image. For more info, see the 'Animated images' section of the [BitmapImage](bitmapimage.md) class Remarks and the [Animated GIF playback sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/XamlAnimatedGif).
     * 
     * Use the IsPlaying property along with the [Play](bitmapimage_play_848564459.md) and [Stop](bitmapimage_stop_1201535524.md) methods to control the playback of an animated bitmap.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapimage.isplaying
     * @type {Boolean} 
     */
    IsPlaying {
        get => this.get_IsPlaying()
    }

    /**
     * Gets or sets a value that indicates whether an animated image should play as soon as it loads.
     * @remarks
     * Starting in Windows 10, version 1607, the XAML [Image](../windows.ui.xaml.controls/image.md) element supports animated GIF images. When you use a [BitmapImage](bitmapimage.md) as the image [Source](../windows.ui.xaml.controls/image_source.md), you can access [BitmapImage](bitmapimage.md)  API to control playback of the animated GIF image. For more info, see the 'Animated images' section of the [BitmapImage](bitmapimage.md) class Remarks and the [Animated GIF playback sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/XamlAnimatedGif).
     * 
     * Use the AutoPlay property, which defaults to **true**, to specify whether or not an animated bitmap plays as soon as it loads.
     * 
     * > [!NOTE]
     * > For most apps, we recommend that you set AutoPlay to **false** if [UISettings.AnimationsEnabled](../windows.ui.viewmanagement/uisettings_animationsenabled.md) is **false**, to support the accessibility needs of users. Do not do this if the content of the animated GIF is important for the usability of your app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapimage.autoplay
     * @type {Boolean} 
     */
    AutoPlay {
        get => this.get_AutoPlay()
        set => this.put_AutoPlay(value)
    }

    /**
     * Occurs when a significant change has occurred in the download progress of the [BitmapImage](bitmapimage.md) content.
     * @remarks
     * For cases where the async loading and decoding of a [BitmapImage](bitmapimage.md) object are long enough to be noticeable to the user, an app can handle DownloadProgress on the source and display a [ProgressRing](../windows.ui.xaml.controls/progressring.md) or [ProgressBar](../windows.ui.xaml.controls/progressbar.md) to indicate the progress state. These might display in the UI region that the image eventually displays in, or somewhere else in the UI. Use [DownloadProgressEventArgs.Progress](downloadprogresseventargs_progress.md) to modify the UI for a [ProgressBar](../windows.ui.xaml.controls/progressbar.md).
     * @type {DownloadProgressEventHandler}
    */
    OnDownloadProgress {
        get {
            if(!this.HasProp("__OnDownloadProgress")){
                this.__OnDownloadProgress := WinRTEventHandler(
                    DownloadProgressEventHandler,
                    DownloadProgressEventHandler.IID,
                    IInspectable,
                    DownloadProgressEventArgs
                )
                this.__OnDownloadProgressToken := this.add_DownloadProgress(this.__OnDownloadProgress.iface)
            }
            return this.__OnDownloadProgress
        }
    }

    /**
     * Occurs when the image source is downloaded and decoded with no failure. You can use this event to determine the size of an image before rendering it.
     * @remarks
     * When ImageOpened fires, that serves as the notification that any asynchronous operations have completed and all the properties of a [BitmapImage](bitmapimage.md) are ready for use. For example, to determine the size of the image before rendering it, handle ImageOpened, and check the value of the [PixelWidth](bitmapsource_pixelwidth.md) and [PixelHeight](bitmapsource_pixelheight.md) properties on the [BitmapImage](bitmapimage.md) that fired the event. The event data for the ImageOpened event isn't typically useful.
     * 
     * The [Image](surfaceimagesource.md) class also has an [ImageOpened](../windows.ui.xaml.controls/image_imageopened.md) event (as does [ImageBrush](../windows.ui.xaml.media/imagebrush.md)). For the other **ImageOpened** events, these fire at a time when the image has probably already rendered. The BitmapImage.ImageOpened fires at a time that is potentially before you've assigned your [BitmapImage](bitmapimage.md) to be the source of an [Image](bitmapimage.md) or [ImageBrush](../windows.ui.xaml.media/imagebrush.md). If you want to change properties that affect rendering of the image based on reading properties of the [BitmapImage](bitmapimage.md), it's often best to handle the underlying [BitmapImage](bitmapimage.md)'s event prior to assigning it as a source. 
     * <!--Otherwise it's possible that rerunning the layout can produce a transition that's visible to the user.-->
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

    /**
     * Occurs when there is an error associated with image retrieval or format.
     * @remarks
     * One scenario for handling ImageFailed is to set the [UriSource](bitmapimage_urisource.md) to a different local image file that can serve as a fallback value. For example, if you are trying to display an external image where it's possible that the source is no longer there, or for when the user has no Internet connection, you could set the [UriSource](bitmapimage_urisource.md) to reference a local fallback or placeholder image that's part of your app package and is always guaranteed to be available.
     * 
     * 
     * 
     * ```csharp
     * private void BitmapImage_ImageFailed(object sender, ExceptionRoutedEventArgs e) {
     *     BitmapImage bitmapImage = sender as BitmapImage;
     *     bitmapImage.UriSource = new Uri("ms-appx:///Images/fallback.png");
     * }
     * ```
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

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [BitmapImage](bitmapimage.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.BitmapImage")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnDownloadProgressToken")) {
            this.remove_DownloadProgress(this.__OnDownloadProgressToken)
            this.__OnDownloadProgress.iface.Dispose()
        }

        if(this.HasProp("__OnImageOpenedToken")) {
            this.remove_ImageOpened(this.__OnImageOpenedToken)
            this.__OnImageOpened.iface.Dispose()
        }

        if(this.HasProp("__OnImageFailedToken")) {
            this.remove_ImageFailed(this.__OnImageFailedToken)
            this.__OnImageFailed.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CreateOptions() {
        if (!this.HasProp("__IBitmapImage")) {
            if ((queryResult := this.QueryInterface(IBitmapImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapImage := IBitmapImage(outPtr)
        }

        return this.__IBitmapImage.get_CreateOptions()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CreateOptions(value) {
        if (!this.HasProp("__IBitmapImage")) {
            if ((queryResult := this.QueryInterface(IBitmapImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapImage := IBitmapImage(outPtr)
        }

        return this.__IBitmapImage.put_CreateOptions(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_UriSource() {
        if (!this.HasProp("__IBitmapImage")) {
            if ((queryResult := this.QueryInterface(IBitmapImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapImage := IBitmapImage(outPtr)
        }

        return this.__IBitmapImage.get_UriSource()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_UriSource(value) {
        if (!this.HasProp("__IBitmapImage")) {
            if ((queryResult := this.QueryInterface(IBitmapImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapImage := IBitmapImage(outPtr)
        }

        return this.__IBitmapImage.put_UriSource(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DecodePixelWidth() {
        if (!this.HasProp("__IBitmapImage")) {
            if ((queryResult := this.QueryInterface(IBitmapImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapImage := IBitmapImage(outPtr)
        }

        return this.__IBitmapImage.get_DecodePixelWidth()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DecodePixelWidth(value) {
        if (!this.HasProp("__IBitmapImage")) {
            if ((queryResult := this.QueryInterface(IBitmapImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapImage := IBitmapImage(outPtr)
        }

        return this.__IBitmapImage.put_DecodePixelWidth(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DecodePixelHeight() {
        if (!this.HasProp("__IBitmapImage")) {
            if ((queryResult := this.QueryInterface(IBitmapImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapImage := IBitmapImage(outPtr)
        }

        return this.__IBitmapImage.get_DecodePixelHeight()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DecodePixelHeight(value) {
        if (!this.HasProp("__IBitmapImage")) {
            if ((queryResult := this.QueryInterface(IBitmapImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapImage := IBitmapImage(outPtr)
        }

        return this.__IBitmapImage.put_DecodePixelHeight(value)
    }

    /**
     * 
     * @param {DownloadProgressEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DownloadProgress(handler) {
        if (!this.HasProp("__IBitmapImage")) {
            if ((queryResult := this.QueryInterface(IBitmapImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapImage := IBitmapImage(outPtr)
        }

        return this.__IBitmapImage.add_DownloadProgress(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DownloadProgress(token) {
        if (!this.HasProp("__IBitmapImage")) {
            if ((queryResult := this.QueryInterface(IBitmapImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapImage := IBitmapImage(outPtr)
        }

        return this.__IBitmapImage.remove_DownloadProgress(token)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ImageOpened(handler) {
        if (!this.HasProp("__IBitmapImage")) {
            if ((queryResult := this.QueryInterface(IBitmapImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapImage := IBitmapImage(outPtr)
        }

        return this.__IBitmapImage.add_ImageOpened(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ImageOpened(token) {
        if (!this.HasProp("__IBitmapImage")) {
            if ((queryResult := this.QueryInterface(IBitmapImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapImage := IBitmapImage(outPtr)
        }

        return this.__IBitmapImage.remove_ImageOpened(token)
    }

    /**
     * 
     * @param {ExceptionRoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ImageFailed(handler) {
        if (!this.HasProp("__IBitmapImage")) {
            if ((queryResult := this.QueryInterface(IBitmapImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapImage := IBitmapImage(outPtr)
        }

        return this.__IBitmapImage.add_ImageFailed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ImageFailed(token) {
        if (!this.HasProp("__IBitmapImage")) {
            if ((queryResult := this.QueryInterface(IBitmapImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapImage := IBitmapImage(outPtr)
        }

        return this.__IBitmapImage.remove_ImageFailed(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DecodePixelType() {
        if (!this.HasProp("__IBitmapImage2")) {
            if ((queryResult := this.QueryInterface(IBitmapImage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapImage2 := IBitmapImage2(outPtr)
        }

        return this.__IBitmapImage2.get_DecodePixelType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DecodePixelType(value) {
        if (!this.HasProp("__IBitmapImage2")) {
            if ((queryResult := this.QueryInterface(IBitmapImage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapImage2 := IBitmapImage2(outPtr)
        }

        return this.__IBitmapImage2.put_DecodePixelType(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAnimatedBitmap() {
        if (!this.HasProp("__IBitmapImage3")) {
            if ((queryResult := this.QueryInterface(IBitmapImage3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapImage3 := IBitmapImage3(outPtr)
        }

        return this.__IBitmapImage3.get_IsAnimatedBitmap()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPlaying() {
        if (!this.HasProp("__IBitmapImage3")) {
            if ((queryResult := this.QueryInterface(IBitmapImage3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapImage3 := IBitmapImage3(outPtr)
        }

        return this.__IBitmapImage3.get_IsPlaying()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoPlay() {
        if (!this.HasProp("__IBitmapImage3")) {
            if ((queryResult := this.QueryInterface(IBitmapImage3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapImage3 := IBitmapImage3(outPtr)
        }

        return this.__IBitmapImage3.get_AutoPlay()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutoPlay(value) {
        if (!this.HasProp("__IBitmapImage3")) {
            if ((queryResult := this.QueryInterface(IBitmapImage3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapImage3 := IBitmapImage3(outPtr)
        }

        return this.__IBitmapImage3.put_AutoPlay(value)
    }

    /**
     * Starts the animation of an animated image.
     * @remarks
     * Starting in Windows 10, version 1607, the XAML [Image](../windows.ui.xaml.controls/image.md) element supports animated GIF images. When you use a [BitmapImage](bitmapimage.md) as the image [Source](../windows.ui.xaml.controls/image_source.md), you can access [BitmapImage](bitmapimage.md)  API to control playback of the animated GIF image. For more info, see the 'Animated images' section of the [BitmapImage](bitmapimage.md) class Remarks and the [Animated GIF playback sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/XamlAnimatedGif).
     * 
     * Use the [IsPlaying](bitmapimage_isplaying.md) property along with the Play and [Stop](bitmapimage_stop_1201535524.md) methods to control the playback of an animated bitmap.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapimage.play
     */
    Play() {
        if (!this.HasProp("__IBitmapImage3")) {
            if ((queryResult := this.QueryInterface(IBitmapImage3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapImage3 := IBitmapImage3(outPtr)
        }

        return this.__IBitmapImage3.Play()
    }

    /**
     * Ends the animation of an animated image.
     * @remarks
     * Starting in Windows 10, version 1607, the XAML [Image](../windows.ui.xaml.controls/image.md) element supports animated GIF images. When you use a [BitmapImage](bitmapimage.md) as the image [Source](../windows.ui.xaml.controls/image_source.md), you can access [BitmapImage](bitmapimage.md)  API to control playback of the animated GIF image. For more info, see the 'Animated images' section of the [BitmapImage](bitmapimage.md) class Remarks and the [Animated GIF playback sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/XamlAnimatedGif).
     * 
     * Use the [IsPlaying](bitmapimage_isplaying.md) property along with the [Play](bitmapimage_play_848564459.md) and Stop methods to control the playback of an animated bitmap.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapimage.stop
     */
    Stop() {
        if (!this.HasProp("__IBitmapImage3")) {
            if ((queryResult := this.QueryInterface(IBitmapImage3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapImage3 := IBitmapImage3(outPtr)
        }

        return this.__IBitmapImage3.Stop()
    }

;@endregion Instance Methods
}
