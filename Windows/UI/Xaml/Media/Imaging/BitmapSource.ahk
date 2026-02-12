#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\ImageSource.ahk
#Include .\IBitmapSource.ahk
#Include .\IBitmapSourceStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides a source object for properties that use a bitmap-format image source.
 * @remarks
 * > [!IMPORTANT]
 * > You don't typically use or create a BitmapSource type directly, that's why you don't see code examples on this page. It's more common to create a [BitmapImage](bitmapimage.md) and use that as a value. For code examples and more info, see the reference page for [BitmapImage](bitmapimage.md).
 * 
 * [ImageSource](../windows.ui.xaml.media/imagesource.md) and BitmapSource are intermediate base classes for [BitmapImage](bitmapimage.md). For more info on how to create an image source to use for [Image.Source](../windows.ui.xaml.controls/image_source.md) and [ImageBrush.ImageSource](../windows.ui.xaml.media/imagebrush_imagesource.md), see [Image and ImageBrush](/windows/uwp/controls-and-patterns/images-imagebrushes) and [BitmapImage](bitmapimage.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapsource
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class BitmapSource extends ImageSource {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBitmapSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBitmapSource.IID

    /**
     * Identifies the [PixelWidth](bitmapsource_pixelwidth.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapsource.pixelwidthproperty
     * @type {DependencyProperty} 
     */
    static PixelWidthProperty {
        get => BitmapSource.get_PixelWidthProperty()
    }

    /**
     * Identifies the [PixelHeight](bitmapsource_pixelheight.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapsource.pixelheightproperty
     * @type {DependencyProperty} 
     */
    static PixelHeightProperty {
        get => BitmapSource.get_PixelHeightProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PixelWidthProperty() {
        if (!BitmapSource.HasProp("__IBitmapSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.BitmapSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapSourceStatics.IID)
            BitmapSource.__IBitmapSourceStatics := IBitmapSourceStatics(factoryPtr)
        }

        return BitmapSource.__IBitmapSourceStatics.get_PixelWidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PixelHeightProperty() {
        if (!BitmapSource.HasProp("__IBitmapSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.BitmapSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapSourceStatics.IID)
            BitmapSource.__IBitmapSourceStatics := IBitmapSourceStatics(factoryPtr)
        }

        return BitmapSource.__IBitmapSourceStatics.get_PixelHeightProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the width of the bitmap in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapsource.pixelwidth
     * @type {Integer} 
     */
    PixelWidth {
        get => this.get_PixelWidth()
    }

    /**
     * Gets the height of the bitmap in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapsource.pixelheight
     * @type {Integer} 
     */
    PixelHeight {
        get => this.get_PixelHeight()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelWidth() {
        if (!this.HasProp("__IBitmapSource")) {
            if ((queryResult := this.QueryInterface(IBitmapSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapSource := IBitmapSource(outPtr)
        }

        return this.__IBitmapSource.get_PixelWidth()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelHeight() {
        if (!this.HasProp("__IBitmapSource")) {
            if ((queryResult := this.QueryInterface(IBitmapSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapSource := IBitmapSource(outPtr)
        }

        return this.__IBitmapSource.get_PixelHeight()
    }

    /**
     * Sets the source image for a [BitmapSource](bitmapsource.md) by accessing a stream. Most callers should use [SetSourceAsync](bitmapsource_setsourceasync_1118221574.md) instead.
     * @remarks
     * Calling SetSource rather than [SetSourceAsync](bitmapsource_setsourceasync_1118221574.md) has the potential to block the UI thread until the image source file is returned and processed. It is for this reason that we generally recommend calling [SetSourceAsync](bitmapsource_setsourceasync_1118221574.md) instead of calling SetSource.
     * 
     * In low memory situations (most likely on lower-memory phones), it is possible for an exception to be raised with the message "The image is unrecognized" and an HRESULT of 0x88982F60. While this exception ordinarily indicates bad data, if your app is close to its memory limit then the cause of the exception is likely to be low memory. In that case, we recommend that you free memory and try again.
     * @param {IRandomAccessStream} streamSource The stream source that sets the image source value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapsource.setsource
     */
    SetSource(streamSource) {
        if (!this.HasProp("__IBitmapSource")) {
            if ((queryResult := this.QueryInterface(IBitmapSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapSource := IBitmapSource(outPtr)
        }

        return this.__IBitmapSource.SetSource(streamSource)
    }

    /**
     * Sets the source image for a [BitmapSource](bitmapsource.md) by accessing a stream and processing the result asynchronously.
     * @remarks
     * Setting an image source by calling the asynchronous SetSourceAsync method rather than the similar [SetSource](bitmapsource_setsource_548578678.md) method avoids blocking the UI thread. The SetSourceAsync behavior is similar to what the system does internally when you set an image source as a URI in markup: the system doesn't wait to retrieve and decode, but it does run layout again once the image source is available. The markup parsing equivalent doesn't expose the **async** infrastructure, but the SetSourceAsync method does. For more info on how to use **async**, **await**, or how to work with an [IAsyncAction](../windows.foundation/iasyncaction.md) value, see [Call asynchronous APIs in C# or Visual Basic](/windows/uwp/threading-async/call-asynchronous-apis-in-csharp-or-visual-basic).
     * 
     * If the app changes the image source again via SetSourceAsync, [SetSource](bitmapsource_setsource_548578678.md) or [UriSource](bitmapimage_urisource.md) while a SetSourceAsync call is already in progress, the pending SetSourceAsync action will throw a [TaskCanceledException](/dotnet/api/system.threading.tasks.taskcanceledexception?view=dotnet-uwp-10.0&preserve-view=true) and set the [Status](/dotnet/api/system.threading.tasks.task.status?view=dotnet-uwp-10.0&preserve-view=true) to [Canceled](/dotnet/api/system.threading.tasks.taskstatus?view=dotnet-uwp-10.0&preserve-view=true).
     * 
     * If you have a Microsoft .NET stream that you want to use as a source, you can use the [AsRandomAccessStream](/dotnet/standard/cross-platform/windowsruntimestreamextensions-asrandomaccessstream-method) extension method to convert it to the [IRandomAccessStream](../windows.storage.streams/irandomaccessstream.md) type that's needed as input for SetSourceAsync.
     * 
     * In low memory situations (most likely on lower-memory phones), it is possible for an exception to be raised with the message "The image is unrecognized" and an HRESULT of 0x88982F60. While this exception ordinarily indicates bad data, if your app is close to its memory limit then the cause of the exception is likely to be low memory. In that case, we recommend that you free memory and try again.
     * @param {IRandomAccessStream} streamSource The stream source that sets the image source value.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapsource.setsourceasync
     */
    SetSourceAsync(streamSource) {
        if (!this.HasProp("__IBitmapSource")) {
            if ((queryResult := this.QueryInterface(IBitmapSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapSource := IBitmapSource(outPtr)
        }

        return this.__IBitmapSource.SetSourceAsync(streamSource)
    }

;@endregion Instance Methods
}
