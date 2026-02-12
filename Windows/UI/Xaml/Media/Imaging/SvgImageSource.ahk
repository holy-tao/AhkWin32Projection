#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\ImageSource.ahk
#Include .\ISvgImageSource.ahk
#Include .\ISvgImageSourceFactory.ahk
#Include .\ISvgImageSourceStatics.ahk
#Include ..\..\..\..\Foundation\TypedEventHandler.ahk
#Include .\SvgImageSource.ahk
#Include .\SvgImageSourceOpenedEventArgs.ahk
#Include .\SvgImageSourceFailedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides a source object for properties that use a Scalable Vector Graphics (SVG) source. You can define a SvgImageSource by using a Uniform Resource Identifier (URI) that references a SVG file, or by calling [SetSourceAsync(IRandomAccessStream)](svgimagesource_setsourceasync_1118221574.md) and supplying a stream.
 * @remarks
 * SvgImageSource lets you use a SVG source to be displayed using an [ImageBrush](../windows.ui.xaml.media/imagebrush.md) or directly in an [Image](../windows.ui.xaml.controls/image.md) control. SvgImageSource supports secure static mode from the SVG specification and does not support animations or interactions. 
 * The Direct2D API supplies the underlying SVG rendering support and for more info on specific SVG element and attribute support, see [SVG Support](/windows/desktop/Direct2D/svg-support). For more info on formats and how to use Uniform Resource Identifier (URI) to access image source files that come from app resources, see [Image and ImageBrush](/windows/uwp/controls-and-patterns/images-imagebrushes).
 * 
 * The SvgImageSource represents an abstraction so that a SVG source can be set asynchronously but still be referenced in XAML markup as a property value, or in code as an object that doesn't use awaitable syntax. When you create a SvgImageSource
 * object in code, it initially has no valid source. You should then set its source using one of these techniques:
 * 
 * * Use the [SvgImageSource(Uri)](svgimagesource_svgimagesource_843413386.md) constructor rather than the default constructor. Although it's a constructor, you can think of this as having an implicit asynchronous behavior: the SvgImageSource
 * won't be ready for use until it raises an [Opened](svgimagesource_opened.md) event that indicates a successful async source set operation.
 * * Set the [UriSource](svgimagesource_urisource.md) property. As with the **Uri** constructor, this action is implicitly asynchronous, and the SvgImageSource won't be ready for use until it raises an [Opened](svgimagesource_opened.md) event.
 * * Use [SetSourceAsync(IRandomAccessStream)](svgimagesource_setsourceasync_1118221574.md). This method is explicitly asynchronous. The properties where you might use a SvgImageSource, such as [Source](/uwp/api/windows.ui.xaml.controls.image.Source), are designed for this asynchronous behavior, and won't throw exceptions if they are set using a SvgImageSource that doesn't have a complete source yet. Rather than handling exceptions, you should handle [Opened](svgimagesource_opened.md) or [OpenFailed](svgimagesource_openfailed.md) events either on the SvgImageSource directly or on the control that uses the source (if those events are available on the control class).
 * 
 * [Opened](svgimagesource_opened.md) and [OpenFailed](svgimagesource_openfailed.md) are mutually exclusive. One event or the other will always be raised whenever a SvgImageSource
 * object has its source value set or reset.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.svgimagesource
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class SvgImageSource extends ImageSource {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISvgImageSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISvgImageSource.IID

    /**
     * Identifies the **UriSource** dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.svgimagesource.urisourceproperty
     * @type {DependencyProperty} 
     */
    static UriSourceProperty {
        get => SvgImageSource.get_UriSourceProperty()
    }

    /**
     * Identifies the **RasterizePixelWidth** dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.svgimagesource.rasterizepixelwidthproperty
     * @type {DependencyProperty} 
     */
    static RasterizePixelWidthProperty {
        get => SvgImageSource.get_RasterizePixelWidthProperty()
    }

    /**
     * Identifies the **RasterizePixelHeight** dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.svgimagesource.rasterizepixelheightproperty
     * @type {DependencyProperty} 
     */
    static RasterizePixelHeightProperty {
        get => SvgImageSource.get_RasterizePixelHeightProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {SvgImageSource} 
     */
    static CreateInstance() {
        if (!SvgImageSource.HasProp("__ISvgImageSourceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.SvgImageSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISvgImageSourceFactory.IID)
            SvgImageSource.__ISvgImageSourceFactory := ISvgImageSourceFactory(factoryPtr)
        }

        return SvgImageSource.__ISvgImageSourceFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @param {Uri} uriSource 
     * @returns {SvgImageSource} 
     */
    static CreateInstanceWithUriSource(uriSource) {
        if (!SvgImageSource.HasProp("__ISvgImageSourceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.SvgImageSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISvgImageSourceFactory.IID)
            SvgImageSource.__ISvgImageSourceFactory := ISvgImageSourceFactory(factoryPtr)
        }

        return SvgImageSource.__ISvgImageSourceFactory.CreateInstanceWithUriSource(uriSource, 0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_UriSourceProperty() {
        if (!SvgImageSource.HasProp("__ISvgImageSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.SvgImageSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISvgImageSourceStatics.IID)
            SvgImageSource.__ISvgImageSourceStatics := ISvgImageSourceStatics(factoryPtr)
        }

        return SvgImageSource.__ISvgImageSourceStatics.get_UriSourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RasterizePixelWidthProperty() {
        if (!SvgImageSource.HasProp("__ISvgImageSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.SvgImageSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISvgImageSourceStatics.IID)
            SvgImageSource.__ISvgImageSourceStatics := ISvgImageSourceStatics(factoryPtr)
        }

        return SvgImageSource.__ISvgImageSourceStatics.get_RasterizePixelWidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RasterizePixelHeightProperty() {
        if (!SvgImageSource.HasProp("__ISvgImageSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.SvgImageSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISvgImageSourceStatics.IID)
            SvgImageSource.__ISvgImageSourceStatics := ISvgImageSourceStatics(factoryPtr)
        }

        return SvgImageSource.__ISvgImageSourceStatics.get_RasterizePixelHeightProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the Uniform Resource Identifier (URI) of the SVG source file that generated this [SvgImageSource](svgimagesource.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.svgimagesource.urisource
     * @type {Uri} 
     */
    UriSource {
        get => this.get_UriSource()
        set => this.put_UriSource(value)
    }

    /**
     * Gets or sets the width to use for SVG rasterization operations.
     * @remarks
     * Since the units are logical pixels, the SVG is decoded using values that are pre-factored for the logical resolution, and it potentially won't use as much memory.
     * 
     * If [RasterizePixelHeight](svgimagesource_rasterizepixelheight.md) and RasterizePixelWidth are NaN, then the application's layout will determine the decode size so that the [SvgImageSource](svgimagesource.md) fits
     * in the available space.
     * 
     * > [!NOTE]
     * > In C#, you can obtain NaN from [Double.NaN](/dotnet/api/system.double.nan?view=dotnet-uwp-10.0&preserve-view=true).
     * >
     * > In C++, you can obtain NaN by using the [`NAN` macro](/cpp/standard-library/cmath) or [`std::numeric_limits<double>::quiet_NaN()`](/cpp/standard-library/numeric-limits-class#quiet_nan).
     * >
     * > Do not use the `==` operator to test for NaN.
     * >
     * > In C#, use [Double.IsNaN()](/dotnet/api/system.double.isnan?view=dotnet-uwp-10.0&preserve-view=true) to test for NaN.
     * >
     * > In C++, use [isnan()](/cpp/c-runtime-library/reference/isnan-isnan-isnanf) to test for NaN.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.svgimagesource.rasterizepixelwidth
     * @type {Float} 
     */
    RasterizePixelWidth {
        get => this.get_RasterizePixelWidth()
        set => this.put_RasterizePixelWidth(value)
    }

    /**
     * Gets or sets the height to use for SVG rasterization operations.
     * @remarks
     * Since the units are logical pixels, the SVG is decoded using values that are pre-factored for the logical resolution, and it potentially won't use as much memory.
     * 
     * If RasterizePixelHeight and [RasterizePixelWidth](svgimagesource_rasterizepixelwidth.md) are NaN, then the application's layout will determine the decode size so that the [SvgImageSource](svgimagesource.md) fits
     * in the available space.
     * 
     * > [!NOTE]
     * > In C#, you can obtain NaN from [Double.NaN](/dotnet/api/system.double.nan?view=dotnet-uwp-10.0&preserve-view=true).
     * >
     * > In C++, you can obtain NaN by using the [`NAN` macro](/cpp/standard-library/cmath) or [`std::numeric_limits<double>::quiet_NaN()`](/cpp/standard-library/numeric-limits-class#quiet_nan).
     * >
     * > Do not use the `==` operator to test for NaN.
     * >
     * > In C#, use [Double.IsNaN()](/dotnet/api/system.double.isnan?view=dotnet-uwp-10.0&preserve-view=true) to test for NaN.
     * >
     * > In C++, use [isnan()](/cpp/c-runtime-library/reference/isnan-isnan-isnanf) to test for NaN.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.svgimagesource.rasterizepixelheight
     * @type {Float} 
     */
    RasterizePixelHeight {
        get => this.get_RasterizePixelHeight()
        set => this.put_RasterizePixelHeight(value)
    }

    /**
     * Occurs when the SVG source is downloaded and decoded with no failure.
     * @remarks
     * When the Opened event occurs, it serves as the notification that any asynchronous operations have completed and all the properties of an [SvgImageSource](svgimagesource.md) are ready for use.
     * @type {TypedEventHandler<SvgImageSource, SvgImageSourceOpenedEventArgs>}
    */
    OnOpened {
        get {
            if(!this.HasProp("__OnOpened")){
                this.__OnOpened := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{9e321151-8b27-5e18-9ea3-50520aceb7ef}"),
                    SvgImageSource,
                    SvgImageSourceOpenedEventArgs
                )
                this.__OnOpenedToken := this.add_Opened(this.__OnOpened.iface)
            }
            return this.__OnOpened
        }
    }

    /**
     * Occurs when there is an error associated with SVG retrieval or format.
     * @remarks
     * You can use the OpenFailed event to determine why the SVG didn't load correctly by checking the [SvgImageSourceFailedEventArgs](svgimagesourcefailedeventargs.md), which contain error information in the [Status](svgimagesourcefailedeventargs_status.md) property.
     * One scenario for handling OpenFailed is to set the [UriSource](svgimagesource_urisource.md) to a different local SVG source file that can serve as a fallback value. For example, if you are trying to display an external image where it's possible that either the source is no longer there, the user has no Internet connection,
     * or the SVG source is not in the correct format, you could set the [UriSource](svgimagesource_urisource.md) to reference a local fallback or placeholder SVG that's part of your app package and is always guaranteed to be available.
     * 
     * ```csharp
     * private void SvgImageSource_OpenFailed(SvgImageSource sender, SvgImageSourceFailedEventArgs args) {
     *     if(args.Status != SvgImageSourceLoadStatus.Success) {
     *         sender.UriSource = new Uri("ms-appx:///Assets/fallback.svg");
     *     }
     * }
     * 
     * ```
     * @type {TypedEventHandler<SvgImageSource, SvgImageSourceFailedEventArgs>}
    */
    OnOpenFailed {
        get {
            if(!this.HasProp("__OnOpenFailed")){
                this.__OnOpenFailed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d723938d-efee-5a0c-ab3e-1e1db3c9a216}"),
                    SvgImageSource,
                    SvgImageSourceFailedEventArgs
                )
                this.__OnOpenFailedToken := this.add_OpenFailed(this.__OnOpenFailed.iface)
            }
            return this.__OnOpenFailed
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnOpenedToken")) {
            this.remove_Opened(this.__OnOpenedToken)
            this.__OnOpened.iface.Dispose()
        }

        if(this.HasProp("__OnOpenFailedToken")) {
            this.remove_OpenFailed(this.__OnOpenFailedToken)
            this.__OnOpenFailed.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_UriSource() {
        if (!this.HasProp("__ISvgImageSource")) {
            if ((queryResult := this.QueryInterface(ISvgImageSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISvgImageSource := ISvgImageSource(outPtr)
        }

        return this.__ISvgImageSource.get_UriSource()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_UriSource(value) {
        if (!this.HasProp("__ISvgImageSource")) {
            if ((queryResult := this.QueryInterface(ISvgImageSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISvgImageSource := ISvgImageSource(outPtr)
        }

        return this.__ISvgImageSource.put_UriSource(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RasterizePixelWidth() {
        if (!this.HasProp("__ISvgImageSource")) {
            if ((queryResult := this.QueryInterface(ISvgImageSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISvgImageSource := ISvgImageSource(outPtr)
        }

        return this.__ISvgImageSource.get_RasterizePixelWidth()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RasterizePixelWidth(value) {
        if (!this.HasProp("__ISvgImageSource")) {
            if ((queryResult := this.QueryInterface(ISvgImageSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISvgImageSource := ISvgImageSource(outPtr)
        }

        return this.__ISvgImageSource.put_RasterizePixelWidth(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RasterizePixelHeight() {
        if (!this.HasProp("__ISvgImageSource")) {
            if ((queryResult := this.QueryInterface(ISvgImageSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISvgImageSource := ISvgImageSource(outPtr)
        }

        return this.__ISvgImageSource.get_RasterizePixelHeight()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RasterizePixelHeight(value) {
        if (!this.HasProp("__ISvgImageSource")) {
            if ((queryResult := this.QueryInterface(ISvgImageSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISvgImageSource := ISvgImageSource(outPtr)
        }

        return this.__ISvgImageSource.put_RasterizePixelHeight(value)
    }

    /**
     * 
     * @param {TypedEventHandler<SvgImageSource, SvgImageSourceOpenedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Opened(handler) {
        if (!this.HasProp("__ISvgImageSource")) {
            if ((queryResult := this.QueryInterface(ISvgImageSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISvgImageSource := ISvgImageSource(outPtr)
        }

        return this.__ISvgImageSource.add_Opened(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Opened(token) {
        if (!this.HasProp("__ISvgImageSource")) {
            if ((queryResult := this.QueryInterface(ISvgImageSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISvgImageSource := ISvgImageSource(outPtr)
        }

        return this.__ISvgImageSource.remove_Opened(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SvgImageSource, SvgImageSourceFailedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_OpenFailed(handler) {
        if (!this.HasProp("__ISvgImageSource")) {
            if ((queryResult := this.QueryInterface(ISvgImageSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISvgImageSource := ISvgImageSource(outPtr)
        }

        return this.__ISvgImageSource.add_OpenFailed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_OpenFailed(token) {
        if (!this.HasProp("__ISvgImageSource")) {
            if ((queryResult := this.QueryInterface(ISvgImageSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISvgImageSource := ISvgImageSource(outPtr)
        }

        return this.__ISvgImageSource.remove_OpenFailed(token)
    }

    /**
     * Sets the source SVG for a [SvgImageSource](svgimagesource.md) by accessing a stream and processing the result asynchronously.
     * @remarks
     * Setting a SVG source by calling the asynchronous SetSourceAsync(IRandomAccessStream) method avoids blocking the UI thread. For more info on how to use **async** or **await**, see [Call asynchronous APIs in C# or Visual Basic](/windows/uwp/threading-async/call-asynchronous-apis-in-csharp-or-visual-basic).
     * If the app changes the SVG source again via SetSourceAsync(IRandomAccessStream) or [UriSource](svgimagesource_urisource.md) while a SetSourceAsync(IRandomAccessStream) call is already in progress, the pending SetSourceAsync(IRandomAccessStream) action will throw a [TaskCanceledException](/dotnet/api/system.threading.tasks.taskcanceledexception?view=dotnet-uwp-10.0&preserve-view=true).
     * @param {IRandomAccessStream} streamSource The stream source that sets the SVG source value.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.svgimagesource.setsourceasync
     */
    SetSourceAsync(streamSource) {
        if (!this.HasProp("__ISvgImageSource")) {
            if ((queryResult := this.QueryInterface(ISvgImageSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISvgImageSource := ISvgImageSource(outPtr)
        }

        return this.__ISvgImageSource.SetSourceAsync(streamSource)
    }

;@endregion Instance Methods
}
