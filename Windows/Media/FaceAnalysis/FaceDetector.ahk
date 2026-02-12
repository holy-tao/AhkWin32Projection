#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFaceDetector.ahk
#Include .\IFaceDetectorStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Detects faces in a [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.faceanalysis.facedetector
 * @namespace Windows.Media.FaceAnalysis
 * @version WindowsRuntime 1.4
 */
class FaceDetector extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFaceDetector

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFaceDetector.IID

    /**
     * Gets a value indicating whether the [FaceDetector](facedetector.md) class is supported on the current device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.faceanalysis.facedetector.issupported
     * @type {Boolean} 
     */
    static IsSupported {
        get => FaceDetector.get_IsSupported()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of the [FaceDetector](facedetector.md) class.
     * @returns {IAsyncOperation<FaceDetector>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.faceanalysis.facedetector.createasync
     */
    static CreateAsync() {
        if (!FaceDetector.HasProp("__IFaceDetectorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.FaceAnalysis.FaceDetector")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFaceDetectorStatics.IID)
            FaceDetector.__IFaceDetectorStatics := IFaceDetectorStatics(factoryPtr)
        }

        return FaceDetector.__IFaceDetectorStatics.CreateAsync()
    }

    /**
     * Returns a list of the bitmap pixels formats supported by the [FaceDetector](facedetector.md) on the current device.
     * @returns {IVectorView<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.faceanalysis.facedetector.getsupportedbitmappixelformats
     */
    static GetSupportedBitmapPixelFormats() {
        if (!FaceDetector.HasProp("__IFaceDetectorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.FaceAnalysis.FaceDetector")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFaceDetectorStatics.IID)
            FaceDetector.__IFaceDetectorStatics := IFaceDetectorStatics(factoryPtr)
        }

        return FaceDetector.__IFaceDetectorStatics.GetSupportedBitmapPixelFormats()
    }

    /**
     * Queries whether the specified bitmap pixel format is supported by the [FaceDetector](facedetector.md) on the current device.
     * @param {Integer} bitmapPixelFormat_ The bitmap pixel format for which support is queried.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.faceanalysis.facedetector.isbitmappixelformatsupported
     */
    static IsBitmapPixelFormatSupported(bitmapPixelFormat_) {
        if (!FaceDetector.HasProp("__IFaceDetectorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.FaceAnalysis.FaceDetector")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFaceDetectorStatics.IID)
            FaceDetector.__IFaceDetectorStatics := IFaceDetectorStatics(factoryPtr)
        }

        return FaceDetector.__IFaceDetectorStatics.IsBitmapPixelFormatSupported(bitmapPixelFormat_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsSupported() {
        if (!FaceDetector.HasProp("__IFaceDetectorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.FaceAnalysis.FaceDetector")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFaceDetectorStatics.IID)
            FaceDetector.__IFaceDetectorStatics := IFaceDetectorStatics(factoryPtr)
        }

        return FaceDetector.__IFaceDetectorStatics.get_IsSupported()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the minimum detectable face size, in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.media.faceanalysis.facedetector.mindetectablefacesize
     * @type {BitmapSize} 
     */
    MinDetectableFaceSize {
        get => this.get_MinDetectableFaceSize()
        set => this.put_MinDetectableFaceSize(value)
    }

    /**
     * Gets or sets the maximum detectable face size, in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.media.faceanalysis.facedetector.maxdetectablefacesize
     * @type {BitmapSize} 
     */
    MaxDetectableFaceSize {
        get => this.get_MaxDetectableFaceSize()
        set => this.put_MaxDetectableFaceSize(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Asynchronously detects faces in the provided [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md) within the specified search area.
     * @param {SoftwareBitmap} image_ The image data to be processed for face detection.
     * @returns {IAsyncOperation<IVector<DetectedFace>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.faceanalysis.facedetector.detectfacesasync
     */
    DetectFacesAsync(image_) {
        if (!this.HasProp("__IFaceDetector")) {
            if ((queryResult := this.QueryInterface(IFaceDetector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFaceDetector := IFaceDetector(outPtr)
        }

        return this.__IFaceDetector.DetectFacesAsync(image_)
    }

    /**
     * Asynchronously detects faces in the provided [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md).
     * @remarks
     * The provided [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md) must be in a supported pixel format for this method and its overloads. Use [GetSupportedBitmapPixelFormats](facedetector_getsupportedbitmappixelformats_1649246406.md) to retrieve a list of supported pixel formats for the current device. Use [IsBitmapPixelFormatSupported](facedetector_isbitmappixelformatsupported_1650024551.md) to test whether a given pixel format is supported.
     * @param {SoftwareBitmap} image_ The image data to be processed for face detection.
     * @param {BitmapBounds} searchArea 
     * @returns {IAsyncOperation<IVector<DetectedFace>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.faceanalysis.facedetector.detectfacesasync
     */
    DetectFacesWithSearchAreaAsync(image_, searchArea) {
        if (!this.HasProp("__IFaceDetector")) {
            if ((queryResult := this.QueryInterface(IFaceDetector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFaceDetector := IFaceDetector(outPtr)
        }

        return this.__IFaceDetector.DetectFacesWithSearchAreaAsync(image_, searchArea)
    }

    /**
     * 
     * @returns {BitmapSize} 
     */
    get_MinDetectableFaceSize() {
        if (!this.HasProp("__IFaceDetector")) {
            if ((queryResult := this.QueryInterface(IFaceDetector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFaceDetector := IFaceDetector(outPtr)
        }

        return this.__IFaceDetector.get_MinDetectableFaceSize()
    }

    /**
     * 
     * @param {BitmapSize} value 
     * @returns {HRESULT} 
     */
    put_MinDetectableFaceSize(value) {
        if (!this.HasProp("__IFaceDetector")) {
            if ((queryResult := this.QueryInterface(IFaceDetector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFaceDetector := IFaceDetector(outPtr)
        }

        return this.__IFaceDetector.put_MinDetectableFaceSize(value)
    }

    /**
     * 
     * @returns {BitmapSize} 
     */
    get_MaxDetectableFaceSize() {
        if (!this.HasProp("__IFaceDetector")) {
            if ((queryResult := this.QueryInterface(IFaceDetector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFaceDetector := IFaceDetector(outPtr)
        }

        return this.__IFaceDetector.get_MaxDetectableFaceSize()
    }

    /**
     * 
     * @param {BitmapSize} value 
     * @returns {HRESULT} 
     */
    put_MaxDetectableFaceSize(value) {
        if (!this.HasProp("__IFaceDetector")) {
            if ((queryResult := this.QueryInterface(IFaceDetector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFaceDetector := IFaceDetector(outPtr)
        }

        return this.__IFaceDetector.put_MaxDetectableFaceSize(value)
    }

;@endregion Instance Methods
}
