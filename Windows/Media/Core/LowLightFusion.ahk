#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILowLightFusionStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * This class allows you to submit a set of image frames, captured in low-light settings and in close temporal proximity, and receieve a single image that has been processed to improve image lighting and fidelity.
 * @remarks
 * This class implements the same computational photography algorithms as the [AdvancedPhotoCapture](/uwp/api/windows.media.capture.advancedphotocapture) class when used in low-light mode. The difference between this feature and **AdvancedPhotoCapture** is that because this feature is decoupled from the capture pipeline, you can use it on images that were captured at any time and in any manner, as long as the image format is supported. Supported formats can be determined by checking the [SupportedBitmapPixelFormats](/uwp/api/windows.media.core.lowlightfusion.SupportedBitmapPixelFormats) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.lowlightfusion
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class LowLightFusion extends IInspectable {
;@region Static Properties
    /**
     * Gets a list of [BitmapPixelFormat](/uwp/api/windows.graphics.imaging.bitmappixelformat) values that define the supported pixel formats for the **FuseAsync** method.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.lowlightfusion.supportedbitmappixelformats
     * @type {IVectorView<Integer>} 
     */
    static SupportedBitmapPixelFormats {
        get => LowLightFusion.get_SupportedBitmapPixelFormats()
    }

    /**
     * Gets the maximum number of frames that can be submitted to the **FuseAsync** method.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.lowlightfusion.maxsupportedframecount
     * @type {Integer} 
     */
    static MaxSupportedFrameCount {
        get => LowLightFusion.get_MaxSupportedFrameCount()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    static get_SupportedBitmapPixelFormats() {
        if (!LowLightFusion.HasProp("__ILowLightFusionStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.LowLightFusion")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILowLightFusionStatics.IID)
            LowLightFusion.__ILowLightFusionStatics := ILowLightFusionStatics(factoryPtr)
        }

        return LowLightFusion.__ILowLightFusionStatics.get_SupportedBitmapPixelFormats()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MaxSupportedFrameCount() {
        if (!LowLightFusion.HasProp("__ILowLightFusionStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.LowLightFusion")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILowLightFusionStatics.IID)
            LowLightFusion.__ILowLightFusionStatics := ILowLightFusionStatics(factoryPtr)
        }

        return LowLightFusion.__ILowLightFusionStatics.get_MaxSupportedFrameCount()
    }

    /**
     * Asynchronously fuses a set of images into a single image that has been computed to improve image lighting and fidelity.
     * @remarks
     * This method will return in an error in the following cases:
     * 
     * * The number of images in the provided collection exceeds the specified by **MaxSupportedFrameCount** property.
     * * The images in the provided collection have different pixel formats.
     * * The images in the provided collection have different resolutions.
     * * The images in the provided collection are in an unsupported pixel format.  Supported formats can be determined by checking the **SupportedBitmapPixelFormats** property.
     * @param {IIterable<SoftwareBitmap>} frameSet The collection of image frames to be processed.
     * @returns {IAsyncOperationWithProgress<LowLightFusionResult, Float>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.lowlightfusion.fuseasync
     */
    static FuseAsync(frameSet) {
        if (!LowLightFusion.HasProp("__ILowLightFusionStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.LowLightFusion")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILowLightFusionStatics.IID)
            LowLightFusion.__ILowLightFusionStatics := ILowLightFusionStatics(factoryPtr)
        }

        return LowLightFusion.__ILowLightFusionStatics.FuseAsync(frameSet)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
