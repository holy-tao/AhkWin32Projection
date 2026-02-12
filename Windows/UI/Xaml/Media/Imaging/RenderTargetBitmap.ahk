#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\ImageSource.ahk
#Include .\IRenderTargetBitmap.ahk
#Include .\IRenderTargetBitmapStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents an image source that can be populated with the combined contents of a XAML visual tree. See  for some notable limitations on which XAML visuals can be captured in a RenderTargetBitmap.
 * @remarks
 * Using a RenderTargetBitmap, you can accomplish scenarios such as applying image effects to a visual that originally came from a XAML UI composition, generating thumbnail images of child pages for a navigation system, or enabling the user to save parts of the UI as an image source and then share that image with other apps.
 * 
 * Because RenderTargetBitmap is a subclass of [ImageSource](../windows.ui.xaml.media/imagesource.md), it can be used as the image source for [Image](../windows.ui.xaml.controls/image.md) elements or an [ImageBrush](../windows.ui.xaml.media/imagebrush.md) brush.
 * 
 * Calling [RenderAsync](rendertargetbitmap_renderasync_1804035726.md) provides a useful image source but the full buffer representation of rendering content is not copied out of video memory until the app calls [GetPixelsAsync](rendertargetbitmap_getpixelsasync_1480284075.md). It is faster to call [RenderAsync](rendertargetbitmap_renderasync_1804035726.md) only (without calling [GetPixelsAsync](rendertargetbitmap_getpixelsasync_1480284075.md)) and use the RenderTargetBitmap as an [Image](../windows.ui.xaml.controls/image.md) or [ImageBrush](../windows.ui.xaml.media/imagebrush.md) source if the app only intends to display the rendered content and does not need the pixel data. You probably do need the pixel data if you intend to capture the image for a [DataTransferManager](../windows.applicationmodel.datatransfer/datatransfermanager.md) operation such as a Share contract exchange, or if you want to apply effects to the image or transcode it using the [Windows.Graphics.Imaging](../windows.graphics.imaging/windows_graphics_imaging.md)API.
 * 
 * The RenderTargetBitmap  API you'll use the most often is [RenderAsync](rendertargetbitmap_renderasync_1804035726.md). There are two overloads of this method: [RenderAsync(UIElement)](rendertargetbitmap_renderasync_1804035726.md) and [another overload](rendertargetbitmap_renderasync_806843678.md) where you can specify the desired dimensions of the image source to be different than the natural size of the source visual tree. [RenderAsync](rendertargetbitmap_renderasync_1804035726.md) is an async method by design, so there's no guarantee of exact frame synchronization with the UI source, but it's close enough timing-wise for most scenarios.
 * 
 * <!--If you want your image to be larger or smaller than the XAML source, you should use this second overload to do your sizing rather than applying a <xref targtype="class_winrt" rid="w_ui_xaml_med.scaletransform"  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">ScaleTransform</xref> or altering the <xref targtype="class_winrt" rid="w_ui_xaml_ctrl.image">Image</xref> or <xref targtype="class_winrt" rid="w_ui_xaml_med_img.bitmapimage">BitmapImage</xref> width/height versus the natural size. The <xref targtype="method_winrt" rid="w_ui_xaml_med_img.rendertargetbitmap_renderasync_806843678">RenderAsync</xref> call has access to lower-level info about the visual content that will generate a better-quality snapshot at your desired sizing than could be achieved by other sizing techniques.-->
 * 
 * A RenderTargetBitmap object isn't typically declared in a XAML UI, because you need to call [RenderAsync](rendertargetbitmap_renderasync_1804035726.md) in code before you have a useful, image-populated instance of RenderTargetBitmap for UI display purposes.
 * 
 * For more code examples of using RenderTargetBitmap, see [XAML render to bitmap sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/XAML%20render%20to%20bitmap%20sample).
 * 
 * The contents of a RenderTargetBitmap can be lost in rare cases because of interaction with other lower-level systems, for example if the video driver is reset as part of a recovery (see [Timeout Detection and Recovery (TDR)](XREF:TODO:display.timeout_detection_and_recovery)). If that happens, the [CompositionTarget.SurfaceContentsLost](../windows.ui.xaml.media/compositiontarget_surfacecontentslost.md) event will fire. To account for this case and similar info-loss cases, apps should listen for the [CompositionTarget.SurfaceContentsLost](../windows.ui.xaml.media/compositiontarget_surfacecontentslost.md) event and re-render the contents of a RenderTargetBitmap by calling [RenderAsync](rendertargetbitmap_renderasync_1804035726.md) again.
 * 
 * The rendered bitmap contents of a RenderTargetBitmap do not automatically scale when the current DPI setting changes. Apps should re-render the contents of a RenderTargetBitmap when the current view's DPI setting changes in order to ensure that the rendered vector content remains crisp. For example, a resize can occur if the user moves an app between two monitors running at a different DPI setting. Consider listening for the [DisplayInformation.DpiChanged](../windows.graphics.display/displayinformation_dpichanged.md) event to detect these cases.
 * 
 * The maximum rendered size of a XAML visual tree is restricted by the maximum dimensions of a Microsoft DirectX texture; for more info see [Resource Limits (Direct3D 11)](/windows/desktop/direct3d11/overviews-direct3d-11-resources-limits). This limit can vary depending on the hardware where the app runs. Very large content that exceeds this limit might be scaled to fit. If scaling limits are applied in this way, the rendered size after scaling can be queried using the [PixelWidth](rendertargetbitmap_pixelwidth.md) and [PixelHeight](rendertargetbitmap_pixelheight.md) properties. For example, a 10000 by 10000 pixel XAML visual tree might be scaled to 4096 by 4096 pixels, an example of a particular limit as forced by the hardware where the app runs.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.rendertargetbitmap
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class RenderTargetBitmap extends ImageSource {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRenderTargetBitmap

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRenderTargetBitmap.IID

    /**
     * Identifies the [PixelWidth](rendertargetbitmap_pixelwidth.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.rendertargetbitmap.pixelwidthproperty
     * @type {DependencyProperty} 
     */
    static PixelWidthProperty {
        get => RenderTargetBitmap.get_PixelWidthProperty()
    }

    /**
     * Identifies the [PixelHeight](rendertargetbitmap_pixelheight.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.rendertargetbitmap.pixelheightproperty
     * @type {DependencyProperty} 
     */
    static PixelHeightProperty {
        get => RenderTargetBitmap.get_PixelHeightProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PixelWidthProperty() {
        if (!RenderTargetBitmap.HasProp("__IRenderTargetBitmapStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.RenderTargetBitmap")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRenderTargetBitmapStatics.IID)
            RenderTargetBitmap.__IRenderTargetBitmapStatics := IRenderTargetBitmapStatics(factoryPtr)
        }

        return RenderTargetBitmap.__IRenderTargetBitmapStatics.get_PixelWidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PixelHeightProperty() {
        if (!RenderTargetBitmap.HasProp("__IRenderTargetBitmapStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.RenderTargetBitmap")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRenderTargetBitmapStatics.IID)
            RenderTargetBitmap.__IRenderTargetBitmapStatics := IRenderTargetBitmapStatics(factoryPtr)
        }

        return RenderTargetBitmap.__IRenderTargetBitmapStatics.get_PixelHeightProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the width of the rendered bitmap in pixels.
     * @remarks
     * Don't rely on this value prior to [RenderAsync](rendertargetbitmap_renderasync_1804035726.md) being called.
     * 
     * The maximum rendered size of a XAML visual tree is restricted by the maximum dimensions of a Microsoft DirectX texture; for more info see [Resource Limits ()](/windows/desktop/direct3d11/overviews-direct3d-11-resources-limits). This resource limit can vary depending on the hardware where the app runs. Very large content that exceeds this limit might be scaled to fit. If scaling limits are applied in this way, the rendered size after scaling can be queried using the PixelWidth and [PixelHeight](rendertargetbitmap_pixelheight.md) properties. For example, a 10000 by 10000 pixel XAML visual tree might be scaled to 4096 by 4096 pixels, an example of a particular resource limit on 2D textures being applied.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.rendertargetbitmap.pixelwidth
     * @type {Integer} 
     */
    PixelWidth {
        get => this.get_PixelWidth()
    }

    /**
     * Gets the height of the rendered bitmap in pixels.
     * @remarks
     * Don't rely on this value prior to [RenderAsync](rendertargetbitmap_renderasync_1804035726.md) being called.
     * 
     * The maximum rendered size of a XAML visual tree is restricted by the maximum dimensions of a Microsoft DirectX texture; for more info see [Resource Limits ()](/windows/desktop/direct3d11/overviews-direct3d-11-resources-limits). This resource limit can vary depending on the hardware where the app runs. Very large content that exceeds this limit might be scaled to fit. If scaling limits are applied in this way, the rendered size after scaling can be queried using the [PixelWidth](rendertargetbitmap_pixelwidth.md) and PixelHeight properties. For example, a 10000 by 10000 pixel XAML visual tree might be scaled to 4096 by 4096 pixels, an example of a particular resource limit on 2D textures being applied.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.rendertargetbitmap.pixelheight
     * @type {Integer} 
     */
    PixelHeight {
        get => this.get_PixelHeight()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [RenderTargetBitmap](rendertargetbitmap.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.RenderTargetBitmap")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelWidth() {
        if (!this.HasProp("__IRenderTargetBitmap")) {
            if ((queryResult := this.QueryInterface(IRenderTargetBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRenderTargetBitmap := IRenderTargetBitmap(outPtr)
        }

        return this.__IRenderTargetBitmap.get_PixelWidth()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelHeight() {
        if (!this.HasProp("__IRenderTargetBitmap")) {
            if ((queryResult := this.QueryInterface(IRenderTargetBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRenderTargetBitmap := IRenderTargetBitmap(outPtr)
        }

        return this.__IRenderTargetBitmap.get_PixelHeight()
    }

    /**
     * Renders a snapshot of a [UIElement](../windows.ui.xaml/uielement.md) visual tree to an image source.
     * @remarks
     * The rendered image isn't returned by this method. But after it returns, so long as the async [Status](../windows.foundation/iasyncinfo_status.md) value doesn't indicate an error, the [RenderTargetBitmap](rendertargetbitmap.md) that called it will have valid image info. The [RenderTargetBitmap](rendertargetbitmap.md) can then be assigned in code as an image source for an [Image](../windows.ui.xaml.controls/image.md) control or [ImageBrush](../windows.ui.xaml.media/imagebrush.md) instance.
     * 
     * If you need a pixel buffer representation of the rendered content and not just an image source, use [GetPixelsAsync](rendertargetbitmap_getpixelsasync_1480284075.md) after calling RenderAsync.
     * 
     * This is an async method, so there's no guarantee of exact frame synchronization with the UI source. See Remarks in [RenderTargetBitmap](rendertargetbitmap.md) for info on some other limitations.
     * 
     * You can pass **null** for the *element* parameter, and that renders the root visual tree of the app.
     * @param {UIElement} element A [UIElement](../windows.ui.xaml/uielement.md) that represents the visual tree fragment to render.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.rendertargetbitmap.renderasync
     */
    RenderAsync(element) {
        if (!this.HasProp("__IRenderTargetBitmap")) {
            if ((queryResult := this.QueryInterface(IRenderTargetBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRenderTargetBitmap := IRenderTargetBitmap(outPtr)
        }

        return this.__IRenderTargetBitmap.RenderAsync(element)
    }

    /**
     * Renders a snapshot of a [UIElement](../windows.ui.xaml/uielement.md) visual tree to an image source.
     * @remarks
     * The rendered image isn't returned by this method. But after it returns, so long as the async [Status](../windows.foundation/iasyncinfo_status.md) value doesn't indicate an error, the [RenderTargetBitmap](rendertargetbitmap.md) that called it will have valid image info. The [RenderTargetBitmap](rendertargetbitmap.md) can then be assigned in code as an image source for an [Image](../windows.ui.xaml.controls/image.md) control or [ImageBrush](../windows.ui.xaml.media/imagebrush.md) instance.
     * 
     * If you need a pixel buffer representation of the rendered content and not just an image source, use [GetPixelsAsync](rendertargetbitmap_getpixelsasync_1480284075.md) after calling RenderAsync.
     * 
     * This is an async method, so there's no guarantee of exact frame synchronization with the UI source. See Remarks in [RenderTargetBitmap](rendertargetbitmap.md) for info on some other limitations.
     * 
     * You can pass **null** for the *element* parameter, and that renders the root visual tree of the app.
     * @param {UIElement} element A [UIElement](../windows.ui.xaml/uielement.md) that represents the visual tree fragment to render.
     * @param {Integer} scaledWidth 
     * @param {Integer} scaledHeight 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.rendertargetbitmap.renderasync
     */
    RenderToSizeAsync(element, scaledWidth, scaledHeight) {
        if (!this.HasProp("__IRenderTargetBitmap")) {
            if ((queryResult := this.QueryInterface(IRenderTargetBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRenderTargetBitmap := IRenderTargetBitmap(outPtr)
        }

        return this.__IRenderTargetBitmap.RenderToSizeAsync(element, scaledWidth, scaledHeight)
    }

    /**
     * Retrieves the previously rendered [RenderTargetBitmap](rendertargetbitmap.md) image as a buffered stream of bytes in **BGRA8**, [premultiplied alpha](/windows/apps/develop/win2d/premultiplied-alpha) format.
     * @remarks
     * The [IBuffer](../windows.storage.streams/ibuffer.md) return value enables passing the result to a [WriteableBitmap](writeablebitmap.md) and its [PixelBuffer](writeablebitmap_pixelbuffer.md). Another alternative is passing the buffer to a [BitmapEncoder](../windows.graphics.imaging/bitmapencoder.md). If you want an array of bytes, use a [DataReader](../windows.storage.streams/datareader.md) and the [FromBuffer](../windows.storage.streams/datareader_frombuffer_328414308.md) method to help with the conversion.
     * 
     * Through the [IAsyncOperation](../windows.foundation/iasyncoperation_1.md) intermediate value, this method returns the pixels of the image source that was produced by the most recent call to [RenderAsync](rendertargetbitmap_renderasync_1804035726.md).
     * 
     * Always call [RenderAsync](rendertargetbitmap_renderasync_1804035726.md) before calling GetPixelsAsync. If you call GetPixelsAsync and never called [RenderAsync](rendertargetbitmap_renderasync_1804035726.md) previously on that [RenderTargetBitmap](rendertargetbitmap.md) instance, GetPixelsAsync will return an empty buffer stream, and no error will occur (async [Status](../windows.foundation/iasyncinfo_status.md) is **Completed**, so you can't use that as an indicator).
     * @returns {IAsyncOperation<IBuffer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.rendertargetbitmap.getpixelsasync
     */
    GetPixelsAsync() {
        if (!this.HasProp("__IRenderTargetBitmap")) {
            if ((queryResult := this.QueryInterface(IRenderTargetBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRenderTargetBitmap := IRenderTargetBitmap(outPtr)
        }

        return this.__IRenderTargetBitmap.GetPixelsAsync()
    }

;@endregion Instance Methods
}
