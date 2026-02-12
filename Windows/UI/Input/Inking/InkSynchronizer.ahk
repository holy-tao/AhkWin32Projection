#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkSynchronizer.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Manages the synchronization of ink input and provides methods for rendering it to the Direct2D device context of your Universal Windows app, instead of the default [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control. This requires an [IInkD2DRenderer](/windows/desktop/api/inkrenderer/nn-inkrenderer-iinkd2drenderer) object to manage the ink input (see the [Complex ink sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/ComplexInk)).
  * 
  * By default, ink input is processed on a low-latency background thread and rendered "wet" as it is drawn. When the stroke is completed (pen or finger lifted, or mouse button released), the stroke is processed on the UI thread and rendered "dry" to the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) layer (above the application content and replacing the wet ink).
  * 
  * By calling [ActivateCustomDrying](inkpresenter_activatecustomdrying_1826048524.md) (before the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) is loaded), an app creates an InkSynchronizer object to customize how an ink stroke is rendered dry to a [SurfaceImageSource](../windows.ui.xaml.media.imaging/surfaceimagesource.md) or [VirtualSurfaceImageSource](../windows.ui.xaml.media.imaging/virtualsurfaceimagesource.md). For example, an ink stroke could be rasterized and integrated into application content instead of as a separate [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) layer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inksynchronizer
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkSynchronizer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkSynchronizer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkSynchronizer.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Initiates a custom "dry" of ink input to the Direct2D device context of your app, instead of the default [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control. This requires an [IInkD2DRenderer](/windows/desktop/api/inkrenderer/nn-inkrenderer-iinkd2drenderer) object to manage the ink input (see the [Complex ink sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/ComplexInk)).
     * 
     * By default, ink input is processed on a low-latency background thread and rendered "wet" as it is drawn. When the stroke is completed (pen or finger lifted, or mouse button released), the stroke is processed on the UI thread and rendered "dry" to the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) layer (above the application content and replacing the wet ink).
     * 
     * By calling [ActivateCustomDrying](inkpresenter_activatecustomdrying_1826048524.md) (before the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) is loaded), an app creates an [InkSynchronizer](inksynchronizer.md) object to customize how an ink stroke is rendered dry to a [SurfaceImageSource](../windows.ui.xaml.media.imaging/surfaceimagesource.md) or [VirtualSurfaceImageSource](../windows.ui.xaml.media.imaging/virtualsurfaceimagesource.md). For example, an ink stroke could be rasterized and integrated into application content instead of as a separate [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) layer.
     * @returns {IVectorView<InkStroke>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inksynchronizer.begindry
     */
    BeginDry() {
        if (!this.HasProp("__IInkSynchronizer")) {
            if ((queryResult := this.QueryInterface(IInkSynchronizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkSynchronizer := IInkSynchronizer(outPtr)
        }

        return this.__IInkSynchronizer.BeginDry()
    }

    /**
     * Finalizes a custom "dry" of ink input to the Direct2D device context of your app, instead of the default [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control, and notifies the system that "wet" ink can be removed. This requires an [IInkD2DRenderer](/windows/desktop/api/inkrenderer/nn-inkrenderer-iinkd2drenderer) object to manage the ink input (see the [Complex ink sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/ComplexInk)).
     * 
     * By default, ink input is processed on a low-latency background thread and rendered "wet" as it is drawn. When the stroke is completed (pen or finger lifted, or mouse button released), the stroke is processed on the UI thread and rendered "dry" to the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) layer (above the application content and replacing the wet ink).
     * 
     * By calling [ActivateCustomDrying](inkpresenter_activatecustomdrying_1826048524.md) (before the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) is loaded), an app creates an [InkSynchronizer](inksynchronizer.md) object to customize how an ink stroke is rendered dry to a [SurfaceImageSource](../windows.ui.xaml.media.imaging/surfaceimagesource.md) or [VirtualSurfaceImageSource](../windows.ui.xaml.media.imaging/virtualsurfaceimagesource.md). For example, an ink stroke could be rasterized and integrated into application content instead of as a separate [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) layer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inksynchronizer.enddry
     */
    EndDry() {
        if (!this.HasProp("__IInkSynchronizer")) {
            if ((queryResult := this.QueryInterface(IInkSynchronizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkSynchronizer := IInkSynchronizer(outPtr)
        }

        return this.__IInkSynchronizer.EndDry()
    }

;@endregion Instance Methods
}
