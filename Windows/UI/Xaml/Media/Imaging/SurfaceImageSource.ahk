#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\ImageSource.ahk
#Include .\ISurfaceImageSource.ahk
#Include .\ISurfaceImageSourceFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides Microsoft DirectX shared surfaces to draw into and then composes the bits into app content.
 * @remarks
 * This class is a display area for Microsoft DirectX interoperation whereby Microsoft DirectX content can draw within an otherwise XAML-composed UI. One consideration for a SurfaceImageSource is that while it can incorporate the Microsoft DirectX content, the rendering cycle is still XAML-centric. Too many Microsoft DirectX draws in this render model can result in latency or poor responsiveness. If you anticipate a high number of redraws for your Microsoft DirectX content, and you intend to display that content full-screen without any surrounding XAML UI, you probably should use the [SwapChainBackgroundPanel](../windows.ui.xaml.controls/swapchainbackgroundpanel.md) technique instead. Another alternative for non-full-screen content is to render to a separate scratch surface on a background thread, then copy its contents to the surface returned from **BeginDraw** on the UI thread. This can unblock the UI thread at the cost of higher memory usage.
 * 
 * For more info on how to draw to a SurfaceImageSource, including sample code, see [DirectX and XAML interop](/previous-versions/windows/apps/hh825871(v=win.10)).
 * 
 * This class has additional API, but those API are for Microsoft DirectX interoperation and are not part of the general app programming model otherwise described in this documentation. For example, from the Microsoft DirectX side, you can call **BeginDraw**.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.surfaceimagesource
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class SurfaceImageSource extends ImageSource {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISurfaceImageSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISurfaceImageSource.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Integer} pixelWidth 
     * @param {Integer} pixelHeight 
     * @returns {SurfaceImageSource} 
     */
    static CreateInstanceWithDimensions(pixelWidth, pixelHeight) {
        if (!SurfaceImageSource.HasProp("__ISurfaceImageSourceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.SurfaceImageSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISurfaceImageSourceFactory.IID)
            SurfaceImageSource.__ISurfaceImageSourceFactory := ISurfaceImageSourceFactory(factoryPtr)
        }

        return SurfaceImageSource.__ISurfaceImageSourceFactory.CreateInstanceWithDimensions(pixelWidth, pixelHeight, 0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @param {Integer} pixelWidth 
     * @param {Integer} pixelHeight 
     * @param {Boolean} isOpaque 
     * @returns {SurfaceImageSource} 
     */
    static CreateInstanceWithDimensionsAndOpacity(pixelWidth, pixelHeight, isOpaque) {
        if (!SurfaceImageSource.HasProp("__ISurfaceImageSourceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.SurfaceImageSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISurfaceImageSourceFactory.IID)
            SurfaceImageSource.__ISurfaceImageSourceFactory := ISurfaceImageSourceFactory(factoryPtr)
        }

        return SurfaceImageSource.__ISurfaceImageSourceFactory.CreateInstanceWithDimensionsAndOpacity(pixelWidth, pixelHeight, isOpaque, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
