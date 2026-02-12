#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SurfaceImageSource.ahk
#Include .\IVirtualSurfaceImageSource.ahk
#Include .\IVirtualSurfaceImageSourceFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Extends [SurfaceImageSource](surfaceimagesource.md) to support scenarios when the content is potentially larger than what can fit on screen and the content must be virtualized to render optimally.
 * @remarks
 * This class has additional API, but those API are for Microsoft DirectX interoperation and are not part of the general app programming model otherwise described in this documentation. For example, from the Microsoft DirectX side, you can call **BeginDraw**. For more info on how to draw to a VirtualSurfaceImageSource, including sample code, see [DirectX and XAML interop](/previous-versions/windows/apps/hh825871(v=win.10)).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.virtualsurfaceimagesource
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class VirtualSurfaceImageSource extends SurfaceImageSource {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVirtualSurfaceImageSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVirtualSurfaceImageSource.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [VirtualSurfaceImageSource](virtualsurfaceimagesource.md) class, specifying the size of the drawing area.
     * @remarks
     * <!--The following remark is relevant for Windows 8 > 8.1 migration. See WBB 464445-->
     * @param {Integer} pixelWidth Width of the drawing area in pixels.
     * @param {Integer} pixelHeight Height of the drawing area in pixels.
     * @returns {VirtualSurfaceImageSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.virtualsurfaceimagesource.#ctor
     */
    static CreateInstanceWithDimensions(pixelWidth, pixelHeight) {
        if (!VirtualSurfaceImageSource.HasProp("__IVirtualSurfaceImageSourceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.VirtualSurfaceImageSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVirtualSurfaceImageSourceFactory.IID)
            VirtualSurfaceImageSource.__IVirtualSurfaceImageSourceFactory := IVirtualSurfaceImageSourceFactory(factoryPtr)
        }

        return VirtualSurfaceImageSource.__IVirtualSurfaceImageSourceFactory.CreateInstanceWithDimensions(pixelWidth, pixelHeight)
    }

    /**
     * Initializes a new instance of the [VirtualSurfaceImageSource](virtualsurfaceimagesource.md) class, specifying the size of the drawing area and a preference for whether to render with an alpha transparency.
     * @remarks
     * <!--The following remark is relevant for Windows 8 > 8.1 migration. See WBB 464445-->
     * @param {Integer} pixelWidth Width of the drawing area in pixels.
     * @param {Integer} pixelHeight Height of the drawing area in pixels.
     * @param {Boolean} isOpaque **true** if the area should render opaque. **false** to render with possible alpha transparency.
     * @returns {VirtualSurfaceImageSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.virtualsurfaceimagesource.#ctor
     */
    static CreateInstanceWithDimensionsAndOpacity(pixelWidth, pixelHeight, isOpaque) {
        if (!VirtualSurfaceImageSource.HasProp("__IVirtualSurfaceImageSourceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.VirtualSurfaceImageSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVirtualSurfaceImageSourceFactory.IID)
            VirtualSurfaceImageSource.__IVirtualSurfaceImageSourceFactory := IVirtualSurfaceImageSourceFactory(factoryPtr)
        }

        return VirtualSurfaceImageSource.__IVirtualSurfaceImageSourceFactory.CreateInstanceWithDimensionsAndOpacity(pixelWidth, pixelHeight, isOpaque)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
