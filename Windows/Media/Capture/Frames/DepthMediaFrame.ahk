#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDepthMediaFrame.ahk
#Include .\IDepthMediaFrame2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a [VideoMediaFrame](videomediaframe.md) that contains depth video data.
 * @remarks
 * Get an instance of this class by accessing the DepthMediaFrame property of the [VideoMediaFrame](videomediaframe.md) class.
 * 
 * For how-to guidance on using [MediaFrameSource](mediaframesource.md) to capture frames, see [Process media frames with MediaFrameReader](/windows/uwp/audio-video-camera/process-media-frames-with-mediaframereader).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.depthmediaframe
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class DepthMediaFrame extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDepthMediaFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDepthMediaFrame.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [MediaFrameReference](mediaframereference.md) wrapper object associated with the [DepthMediaFrame](depthmediaframe.md), which provides access to format information and other properties of the media frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.depthmediaframe.framereference
     * @type {MediaFrameReference} 
     */
    FrameReference {
        get => this.get_FrameReference()
    }

    /**
     * Gets the [VideoMediaFrame](videomediaframe.md) associated with the [DepthMediaFrame](depthmediaframe.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.depthmediaframe.videomediaframe
     * @type {VideoMediaFrame} 
     */
    VideoMediaFrame {
        get => this.get_VideoMediaFrame()
    }

    /**
     * Gets an object that describes the format of the depth data in the [DepthMediaFrame](depthmediaframe.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.depthmediaframe.depthformat
     * @type {DepthMediaFrameFormat} 
     */
    DepthFormat {
        get => this.get_DepthFormat()
    }

    /**
     * Gets a value that specifies the maximum reliable depth value for the camera that captured the depth frame.
     * @remarks
     * A depth camera may not be able to reliably sense the depth for the full range of the UInt16 value that is used to express depth in a depth media frame. The value of **MaxReliableDepth** is set by the depth camera device to indicate the upper limit of values within the UInt16 range for which the device can reliably capture depth data. You can safely clamp depth pixel values greater than this value. The lower limit of reliable depth values is specified with the [MinReliableDepth](./depthmediaframe_minreliabledepth.md) property. These properties are expressed in the same units as the individual depth pixel values. You can convert **MaxReliableDepth** to meters by multiplying it by the value of the [DepthScaleInMeters](./depthmediaframeformat_depthscaleinmeters.md) property of the [DepthFormat](./depthmediaframe_depthformat.md) property of the [DepthMediaFrame](./depthmediaframe.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.depthmediaframe.maxreliabledepth
     * @type {Integer} 
     */
    MaxReliableDepth {
        get => this.get_MaxReliableDepth()
    }

    /**
     * Gets a value that specifies the minimum reliable depth value for the camera that captured the depth frame.
     * @remarks
     * A depth camera may not be able to reliably sense the depth for the full range of the UInt16 value that is used to express depth in a depth media frame. The value of **MinReliableDepth** is set by the depth camera device to indicate the lower limit of values within the UInt16 range for which the device can reliably capture depth data. You can safely clamp depth pixel values lower than this value. The upper limit of reliable depth values is specified with the [MaxReliableDepth](./depthmediaframe_maxreliabledepth.md) property. These properties are expressed in the same units as the individual depth pixel values. You can convert **MinReliableDepth** to meters by multiplying it by the value of the [DepthScaleInMeters](./depthmediaframeformat_depthscaleinmeters.md) property of the [DepthFormat](./depthmediaframe_depthformat.md) property of the [DepthMediaFrame](./depthmediaframe.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.depthmediaframe.minreliabledepth
     * @type {Integer} 
     */
    MinReliableDepth {
        get => this.get_MinReliableDepth()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {MediaFrameReference} 
     */
    get_FrameReference() {
        if (!this.HasProp("__IDepthMediaFrame")) {
            if ((queryResult := this.QueryInterface(IDepthMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDepthMediaFrame := IDepthMediaFrame(outPtr)
        }

        return this.__IDepthMediaFrame.get_FrameReference()
    }

    /**
     * 
     * @returns {VideoMediaFrame} 
     */
    get_VideoMediaFrame() {
        if (!this.HasProp("__IDepthMediaFrame")) {
            if ((queryResult := this.QueryInterface(IDepthMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDepthMediaFrame := IDepthMediaFrame(outPtr)
        }

        return this.__IDepthMediaFrame.get_VideoMediaFrame()
    }

    /**
     * 
     * @returns {DepthMediaFrameFormat} 
     */
    get_DepthFormat() {
        if (!this.HasProp("__IDepthMediaFrame")) {
            if ((queryResult := this.QueryInterface(IDepthMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDepthMediaFrame := IDepthMediaFrame(outPtr)
        }

        return this.__IDepthMediaFrame.get_DepthFormat()
    }

    /**
     * Attempts to create a [DepthCorrelatedCoordinateMapper](../windows.media.devices.core/depthcorrelatedcoordinatemapper.md) for the [DepthMediaFrame](depthmediaframe.md). This object provides methods for mapping pixel coordinates from a [MediaFrameSource](mediaframesource.md) camera to the coordinate system of a different **MediaFrameSource** or to 3D space.
     * @remarks
     * The [DepthCorrelatedCoordinateMapper](../windows.media.devices.core/depthcorrelatedcoordinatemapper.md) returned by this method will use depth data from the [DepthMediaFrame](depthmediaframe.md) to map coordinates from one media frame or [MediaFrameSource](mediaframesource.md) to the coordinate system of another media frame or **MediaFrameSource**. The parameters to this method specify the camera intrinsics and coordinate system of the original coordinates to be mapped.
     * 
     * Get static camera intrinsics for a **MediaFrameSource** by calling [TryGetCameraIntrinsics](mediaframesource_trygetcameraintrinsics_1850716602.md). Get the static coordinate system for a **MediaFrameSource** by accessing the [CoordinateSystem](mediaframesourceinfo_coordinatesystem.md) property of the [MediaFrameSourceInfo](mediaframesourceinfo.md) associated with the frame source. Get dynamic camera instrinsics by accessing [CameraIntrinsics](videomediaframe_cameraintrinsics.md) property of a [VideoMediaFrame](videomediaframe.md). Get the dynamic coordinate system from a [MediaFrameReference](mediaframereference.md) with the [CoordinateSystem](mediaframereference_coordinatesystem.md) property.
     * 
     * You specify the camera intrinsics and coordinate system of the target frame or frame source, to which the source points will be mapped, when you call the mapping methods of the **DepthCorrelatedCoordinateMapper**.
     * @param {CameraIntrinsics} cameraIntrinsics_ An object that describes the distortion model of the **MediaFrameSource** camera for which coordinates will be mapped using the [DepthMediaFrame](depthmediaframe.md) data.
     * @param {SpatialCoordinateSystem} coordinateSystem An object representing the spatial coordinate system of the camera for which coordinates will be mapped using the [DepthMediaFrame](depthmediaframe.md) data.
     * @returns {DepthCorrelatedCoordinateMapper} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.depthmediaframe.trycreatecoordinatemapper
     */
    TryCreateCoordinateMapper(cameraIntrinsics_, coordinateSystem) {
        if (!this.HasProp("__IDepthMediaFrame")) {
            if ((queryResult := this.QueryInterface(IDepthMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDepthMediaFrame := IDepthMediaFrame(outPtr)
        }

        return this.__IDepthMediaFrame.TryCreateCoordinateMapper(cameraIntrinsics_, coordinateSystem)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxReliableDepth() {
        if (!this.HasProp("__IDepthMediaFrame2")) {
            if ((queryResult := this.QueryInterface(IDepthMediaFrame2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDepthMediaFrame2 := IDepthMediaFrame2(outPtr)
        }

        return this.__IDepthMediaFrame2.get_MaxReliableDepth()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinReliableDepth() {
        if (!this.HasProp("__IDepthMediaFrame2")) {
            if ((queryResult := this.QueryInterface(IDepthMediaFrame2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDepthMediaFrame2 := IDepthMediaFrame2(outPtr)
        }

        return this.__IDepthMediaFrame2.get_MinReliableDepth()
    }

;@endregion Instance Methods
}
