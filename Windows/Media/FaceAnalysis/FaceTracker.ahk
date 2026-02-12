#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFaceTracker.ahk
#Include .\IFaceTrackerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Detects faces in [VideoFrame](../windows.media/videoframe.md) objects and tracks faces across subsequent video frames.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.faceanalysis.facetracker
 * @namespace Windows.Media.FaceAnalysis
 * @version WindowsRuntime 1.4
 */
class FaceTracker extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFaceTracker

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFaceTracker.IID

    /**
     * Gets a value indicating whether the [FaceTracker](facetracker.md) class is supported on the current device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.faceanalysis.facetracker.issupported
     * @type {Boolean} 
     */
    static IsSupported {
        get => FaceTracker.get_IsSupported()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of the [FaceTracker](facetracker.md) class.
     * @returns {IAsyncOperation<FaceTracker>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.faceanalysis.facetracker.createasync
     */
    static CreateAsync() {
        if (!FaceTracker.HasProp("__IFaceTrackerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.FaceAnalysis.FaceTracker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFaceTrackerStatics.IID)
            FaceTracker.__IFaceTrackerStatics := IFaceTrackerStatics(factoryPtr)
        }

        return FaceTracker.__IFaceTrackerStatics.CreateAsync()
    }

    /**
     * Returns a list of the bitmap pixels formats supported by the [FaceTracker](facetracker.md) on the current device.
     * @returns {IVectorView<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.faceanalysis.facetracker.getsupportedbitmappixelformats
     */
    static GetSupportedBitmapPixelFormats() {
        if (!FaceTracker.HasProp("__IFaceTrackerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.FaceAnalysis.FaceTracker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFaceTrackerStatics.IID)
            FaceTracker.__IFaceTrackerStatics := IFaceTrackerStatics(factoryPtr)
        }

        return FaceTracker.__IFaceTrackerStatics.GetSupportedBitmapPixelFormats()
    }

    /**
     * Queries whether the specified bitmap pixel format is supported by the [FaceTracker](facetracker.md) on the current device.
     * @param {Integer} bitmapPixelFormat_ The bitmap pixel format for which support is queried.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.faceanalysis.facetracker.isbitmappixelformatsupported
     */
    static IsBitmapPixelFormatSupported(bitmapPixelFormat_) {
        if (!FaceTracker.HasProp("__IFaceTrackerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.FaceAnalysis.FaceTracker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFaceTrackerStatics.IID)
            FaceTracker.__IFaceTrackerStatics := IFaceTrackerStatics(factoryPtr)
        }

        return FaceTracker.__IFaceTrackerStatics.IsBitmapPixelFormatSupported(bitmapPixelFormat_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsSupported() {
        if (!FaceTracker.HasProp("__IFaceTrackerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.FaceAnalysis.FaceTracker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFaceTrackerStatics.IID)
            FaceTracker.__IFaceTrackerStatics := IFaceTrackerStatics(factoryPtr)
        }

        return FaceTracker.__IFaceTrackerStatics.get_IsSupported()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the minimum detectable face size, in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.media.faceanalysis.facetracker.mindetectablefacesize
     * @type {BitmapSize} 
     */
    MinDetectableFaceSize {
        get => this.get_MinDetectableFaceSize()
        set => this.put_MinDetectableFaceSize(value)
    }

    /**
     * Gets or sets the maximum detectable face size, in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.media.faceanalysis.facetracker.maxdetectablefacesize
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
     * Asynchronously processes a [VideoFrame](../windows.media/videoframe.md) for face detection.
     * @remarks
     * The provided [SoftwareBitmap](../windows.media/videoframe_softwarebitmap.md) must be in a supported pixel format. Use [GetSupportedBitmapPixelFormats](facetracker_getsupportedbitmappixelformats_1649246406.md) to retrieve a list of supported pixel formats for the current device. Use [IsBitmapPixelFormatSupported](facetracker_isbitmappixelformatsupported_1650024551.md) to test whether a given pixel format is supported.
     * @param {VideoFrame} videoFrame_ The [VideoFrame](../windows.media/videoframe.md) in which faces are detected or tracked.
     * @returns {IAsyncOperation<IVector<DetectedFace>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.faceanalysis.facetracker.processnextframeasync
     */
    ProcessNextFrameAsync(videoFrame_) {
        if (!this.HasProp("__IFaceTracker")) {
            if ((queryResult := this.QueryInterface(IFaceTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFaceTracker := IFaceTracker(outPtr)
        }

        return this.__IFaceTracker.ProcessNextFrameAsync(videoFrame_)
    }

    /**
     * 
     * @returns {BitmapSize} 
     */
    get_MinDetectableFaceSize() {
        if (!this.HasProp("__IFaceTracker")) {
            if ((queryResult := this.QueryInterface(IFaceTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFaceTracker := IFaceTracker(outPtr)
        }

        return this.__IFaceTracker.get_MinDetectableFaceSize()
    }

    /**
     * 
     * @param {BitmapSize} value 
     * @returns {HRESULT} 
     */
    put_MinDetectableFaceSize(value) {
        if (!this.HasProp("__IFaceTracker")) {
            if ((queryResult := this.QueryInterface(IFaceTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFaceTracker := IFaceTracker(outPtr)
        }

        return this.__IFaceTracker.put_MinDetectableFaceSize(value)
    }

    /**
     * 
     * @returns {BitmapSize} 
     */
    get_MaxDetectableFaceSize() {
        if (!this.HasProp("__IFaceTracker")) {
            if ((queryResult := this.QueryInterface(IFaceTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFaceTracker := IFaceTracker(outPtr)
        }

        return this.__IFaceTracker.get_MaxDetectableFaceSize()
    }

    /**
     * 
     * @param {BitmapSize} value 
     * @returns {HRESULT} 
     */
    put_MaxDetectableFaceSize(value) {
        if (!this.HasProp("__IFaceTracker")) {
            if ((queryResult := this.QueryInterface(IFaceTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFaceTracker := IFaceTracker(outPtr)
        }

        return this.__IFaceTracker.put_MaxDetectableFaceSize(value)
    }

;@endregion Instance Methods
}
