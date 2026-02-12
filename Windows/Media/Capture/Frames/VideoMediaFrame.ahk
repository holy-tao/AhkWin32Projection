#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVideoMediaFrame.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a frame from a [MediaFrameSource](mediaframesource.md) that provides data in a video frame represented by a [IDirect3DSurface](../windows.graphics.directx.direct3d11/idirect3dsurface.md) or [SoftwareBitmap](videomediaframe_softwarebitmap.md).
 * @remarks
 * Get an instance of this class by accessing the [VideoMediaFrame](mediaframereference_videomediaframe.md) property of a [MediaFrameReference](mediaframereference.md) object that was obtained from a media frame source.
 * 
 * 
 * 
 * > [!IMPORTANT]
 * > If you access the [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md) or [Direct3DSurface](../windows.graphics.directx.direct3d11/idirect3dsurface.md) objects provided by the [VideoMediaFrame](mediaframereference_videomediaframe.md) property of a [MediaFrameReference](mediaframereference.md), the system creates a strong reference to these objects, which means that they will not be disposed when you call [Dispose](mediaframereference_close_811482585.md) on the containing **MediaFrameReference**. You must explicitly call the **Dispose** method of the **SoftwareBitmap** or **Direct3DSurface** directly for the objects to be immediately disposed. Otherwise, the garbage collector will eventually free the memory for these objects, but you can't know when this will occur, and if the number of allocated bitmaps or surfaces exceeds the maximum amount allowed by the system, the flow of new frames will stop. In that same line of thought, if you have called (GetVideoFrame())[videomediaframe_getvideoframe_824740069.md], then the (VideoFrame)[../windows.media/videoframe.md] retrieved has a reference on the **SoftwareBitmap** or **Direct3DSurface** objects provided by the VideoMediaFrame and needs to be disposed of by calling manually its **Dispose** method to avoid blocking the fow of frames. If you intend to hold on to a VideoFrame retrieved via (GetVideoFrame())[videomediaframe_getvideoframe_824740069.md] for an extended period of time, it may be better to hold on to a copy of it instead.
 * 
 * For how-to guidance on using [MediaFrameSource](mediaframesource.md) to capture frames, see [Process media frames with MediaFrameReader](/windows/uwp/audio-video-camera/process-media-frames-with-mediaframereader).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.videomediaframe
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class VideoMediaFrame extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVideoMediaFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVideoMediaFrame.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [MediaFrameReference](mediaframereference.md) wrapper object associated with the [VideoMediaFrame](videomediaframe.md), which provides access to format information and other properties of the media frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.videomediaframe.framereference
     * @type {MediaFrameReference} 
     */
    FrameReference {
        get => this.get_FrameReference()
    }

    /**
     * Gets an object describing the format of the [VideoMediaFrame](videomediaframe.md) image data.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.videomediaframe.videoformat
     * @type {VideoMediaFrameFormat} 
     */
    VideoFormat {
        get => this.get_VideoFormat()
    }

    /**
     * Gets a SoftwareBitmap object containing the image data for the [VideoMediaFrame](videomediaframe.md).
     * @remarks
     * Initialize a [MediaCapture](../windows.media.capture/mediacapture.md) object to use CPU memory for captured frames by setting the [MemoryPreference](../windows.media.capture/mediacaptureinitializationsettings_memorypreference.md) property of the [MediaCaptureInitializationSettings](../windows.media.capture/mediacaptureinitializationsettings.md) to [Cpu](../windows.media.capture/mediacapturememorypreference.md). Doing this guarantees that the **SoftwareBitmap** property of a received [VideoMediaFrame](videomediaframe.md) will be non-null and contain the image data from the frame. Setting the memory preference to [Auto](../windows.media.capture/mediacapturememorypreference.md) allows the system to choose the optimal memory location for the current device. If the system chooses to use GPU memory, the **SoftwareBitmap** property will be null and the [Direct3DSurface](videomediaframe_direct3dsurface.md) property should be used instead.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.videomediaframe.softwarebitmap
     * @type {SoftwareBitmap} 
     */
    SoftwareBitmap {
        get => this.get_SoftwareBitmap()
    }

    /**
     * Gets an [IDirect3DSurface](../windows.graphics.directx.direct3d11/idirect3dsurface.md) object containing the image data for the [VideoMediaFrame](videomediaframe.md).
     * @remarks
     * If you initialize a [MediaCapture](../windows.media.capture/mediacapture.md) object to use CPU memory for captured frames by setting the [MemoryPreference](../windows.media.capture/mediacaptureinitializationsettings_memorypreference.md) property of the [MediaCaptureInitializationSettings](../windows.media.capture/mediacaptureinitializationsettings.md) to [Cpu](../windows.media.capture/mediacapturememorypreference.md), the Direct3DSurface property of a received [VideoMediaFrame](videomediaframe.md) will be null and the [SoftwareBitmap](videomediaframe_softwarebitmap.md) property will be non-null and contain the image data from the frame. Setting the memory preference to [Auto](../windows.media.capture/mediacapturememorypreference.md) allows the system to choose the optimal memory location for the current device. If the system chooses to use GPU memory, the [SoftwareBitmap](videomediaframe_softwarebitmap.md) property will be null and the **Direct3DSurface** property will contain the frame's image data..
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.videomediaframe.direct3dsurface
     * @type {IDirect3DSurface} 
     */
    Direct3DSurface {
        get => this.get_Direct3DSurface()
    }

    /**
     * Gets an object that describes the distortion model of the camera that generated the [VideoMediaFrame](videomediaframe.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.videomediaframe.cameraintrinsics
     * @type {CameraIntrinsics} 
     */
    CameraIntrinsics {
        get => this.get_CameraIntrinsics()
    }

    /**
     * Gets an [InfraredMediaFrame](infraredmediaframe.md) containing depth data for the [VideoMediaFrame](videomediaframe.md), if the frame contains infrared data.
     * @remarks
     * If the [MediaFrameSource](mediaframesource.md) that generated the [VideoMediaFrame](depthmediaframe_videomediaframe.md) does not produce infrared data, this object is null.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.videomediaframe.infraredmediaframe
     * @type {InfraredMediaFrame} 
     */
    InfraredMediaFrame {
        get => this.get_InfraredMediaFrame()
    }

    /**
     * Gets a [DepthMediaFrame](depthmediaframe.md) containing depth data for the [VideoMediaFrame](videomediaframe.md), if the frame contains depth data.
     * @remarks
     * If the [MediaFrameSource](mediaframesource.md) that generated the [VideoMediaFrame](depthmediaframe_videomediaframe.md) does not produce depth data, this object is null.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.videomediaframe.depthmediaframe
     * @type {DepthMediaFrame} 
     */
    DepthMediaFrame {
        get => this.get_DepthMediaFrame()
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
        if (!this.HasProp("__IVideoMediaFrame")) {
            if ((queryResult := this.QueryInterface(IVideoMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoMediaFrame := IVideoMediaFrame(outPtr)
        }

        return this.__IVideoMediaFrame.get_FrameReference()
    }

    /**
     * 
     * @returns {VideoMediaFrameFormat} 
     */
    get_VideoFormat() {
        if (!this.HasProp("__IVideoMediaFrame")) {
            if ((queryResult := this.QueryInterface(IVideoMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoMediaFrame := IVideoMediaFrame(outPtr)
        }

        return this.__IVideoMediaFrame.get_VideoFormat()
    }

    /**
     * 
     * @returns {SoftwareBitmap} 
     */
    get_SoftwareBitmap() {
        if (!this.HasProp("__IVideoMediaFrame")) {
            if ((queryResult := this.QueryInterface(IVideoMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoMediaFrame := IVideoMediaFrame(outPtr)
        }

        return this.__IVideoMediaFrame.get_SoftwareBitmap()
    }

    /**
     * 
     * @returns {IDirect3DSurface} 
     */
    get_Direct3DSurface() {
        if (!this.HasProp("__IVideoMediaFrame")) {
            if ((queryResult := this.QueryInterface(IVideoMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoMediaFrame := IVideoMediaFrame(outPtr)
        }

        return this.__IVideoMediaFrame.get_Direct3DSurface()
    }

    /**
     * 
     * @returns {CameraIntrinsics} 
     */
    get_CameraIntrinsics() {
        if (!this.HasProp("__IVideoMediaFrame")) {
            if ((queryResult := this.QueryInterface(IVideoMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoMediaFrame := IVideoMediaFrame(outPtr)
        }

        return this.__IVideoMediaFrame.get_CameraIntrinsics()
    }

    /**
     * 
     * @returns {InfraredMediaFrame} 
     */
    get_InfraredMediaFrame() {
        if (!this.HasProp("__IVideoMediaFrame")) {
            if ((queryResult := this.QueryInterface(IVideoMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoMediaFrame := IVideoMediaFrame(outPtr)
        }

        return this.__IVideoMediaFrame.get_InfraredMediaFrame()
    }

    /**
     * 
     * @returns {DepthMediaFrame} 
     */
    get_DepthMediaFrame() {
        if (!this.HasProp("__IVideoMediaFrame")) {
            if ((queryResult := this.QueryInterface(IVideoMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoMediaFrame := IVideoMediaFrame(outPtr)
        }

        return this.__IVideoMediaFrame.get_DepthMediaFrame()
    }

    /**
     * Creates a copy of the [VideoMediaFrame](videomediaframe.md) as a [VideoFrame](../windows.media/videoframe.md) object.
     * @returns {VideoFrame} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.videomediaframe.getvideoframe
     */
    GetVideoFrame() {
        if (!this.HasProp("__IVideoMediaFrame")) {
            if ((queryResult := this.QueryInterface(IVideoMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoMediaFrame := IVideoMediaFrame(outPtr)
        }

        return this.__IVideoMediaFrame.GetVideoFrame()
    }

;@endregion Instance Methods
}
