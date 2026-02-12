#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaFrameReference.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include .\IMediaFrameReference2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A wrapper class that represents a frame obtained from a [MediaFrameSource](mediaframesource.md). Use the properties of this class to access the specific frame type provided by the source, such as a [VideoMediaFrame](videomediaframe.md) or [BufferMediaFrame](buffermediaframe.md).
 * @remarks
 * To get an instance of MediaFrameReference from a media frame source, create a [MediaFrameReader](mediaframereader.md) by calling [CreateFrameReaderAsync](../windows.media.capture/mediacapture_createframereaderasync_1014922223.md) on a [MediaCapture](/windows/uwp/audio-video-camera/capture-photos-and-video-with-mediacapture) object that has been initialized to use the desired media frame source. After the frame reader has been started by calling [StartAsync](mediaframereader_startasync_1931900819.md), call [TryAcquireLatestFrame](mediaframereader_tryacquirelatestframe_612769713.md) to get a MediaFrameReference representing the latest frame from the media frame source.
 * 
 * Each [MediaFrameReader](mediaframereader.md) maintains a circular buffer of **MediaFrameReference** objects obtained from [TryAcquireLatestFrame](mediaframereader_tryacquirelatestframe_612769713.md). After all of the **MediaFrameReference** objects in the buffer have been used, subsequent calls to **TryAcquireLatestFrame** will cause the system to call [Close](mediaframereference_close_811482585.md) (or **Dispose** in C#) on the oldest buffer object in order to reuse it. Once the object has been disposed, you can no longer use it to access the frame data. For this reason, you should not store the **MediaFrameReference** object longer than you actually need to process the frame. If your app scenario requires you to keep a reference to the data for longer, you should use one of the APIs provided to get the underlying data. These include:
 * 
 * + [VideoMediaFrame.SoftwareBitmap](videomediaframe_softwarebitmap.md)
 * + [VideoMediaFrame.Direct3DSurface](videomediaframe_direct3dsurface.md)
 * 
 * It is the responsibility of the app to call [Close](mediaframereference_close_811482585.md) (or **Dispose**) on the objects returned by these APIs when they are no longer being used.
 * 
 * > [!IMPORTANT]
 * > If you access the [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md) or [Direct3DSurface](../windows.graphics.directx.direct3d11/idirect3dsurface.md) objects provided by the [VideoMediaFrame](mediaframereference_videomediaframe.md) property of a MediaFrameReference, the system creates a strong reference to these objects, which means that they will not be disposed when you call [Dispose](mediaframereference_close_811482585.md) on the containing **MediaFrameReference**. This also applies to the **SoftwareBitmap** or **Direct3DSurface** objects provided by the **VideoFrame** object that you obtain from the [MediaFrameReference.VideoMediaFrame](mediaframereference_videomediaframe.md) property. You must explicitly call the **Dispose** method of the **SoftwareBitmap** or **Direct3DSurface** directly for the objects to be immediately disposed. Otherwise, the garbage collector will eventually free the memory for these objects, but you can't know when this will occur, and if the number of allocated bitmaps or surfaces exceeds the maximum amount allowed by the system, the flow of new frames will stop.
 * 
 * For how-to guidance on using [MediaFrameSource](mediaframesource.md) to capture frames, see [Process media frames with MediaFrameReader](/windows/uwp/audio-video-camera/process-media-frames-with-mediaframereader).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframereference
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class MediaFrameReference extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaFrameReference

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaFrameReference.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the type of [MediaFrameSource](mediaframesource.md) from which the referenced frame originated, such as a color, infrared, or custom source.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframereference.sourcekind
     * @type {Integer} 
     */
    SourceKind {
        get => this.get_SourceKind()
    }

    /**
     * Gets the format of the reference media frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframereference.format
     * @type {MediaFrameFormat} 
     */
    Format {
        get => this.get_Format()
    }

    /**
     * Gets a timestamp that is relative to the system and is correlatable across multiple media sources on the same device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframereference.systemrelativetime
     * @type {IReference<TimeSpan>} 
     */
    SystemRelativeTime {
        get => this.get_SystemRelativeTime()
    }

    /**
     * Gets the duration of the referenced media frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframereference.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * Gets a map of properties for the referenced frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframereference.properties
     * @type {IMapView<Guid, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets the [BufferMediaFrame](buffermediaframe.md) wrapped by the [MediaFrameReference](mediaframereference.md), if that is the type of frame represented.
     * @remarks
     * If the frame reference wraps a different type of frame, such as a [VideoMediaFrame](videomediaframe.md), the object returned by this property is null.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframereference.buffermediaframe
     * @type {BufferMediaFrame} 
     */
    BufferMediaFrame {
        get => this.get_BufferMediaFrame()
    }

    /**
     * Gets the [VideoMediaFrame](videomediaframe.md) wrapped by the [MediaFrameReference](mediaframereference.md), if that is the type of frame represented.
     * @remarks
     * If the frame reference wraps a different type of frame, or if the video frame data is in a format that is unsupported, such as RGB24, then this property is null. In this case, you can access the [BufferMediaFrame](mediaframereference_buffermediaframe.md) property, which is always non-null.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframereference.videomediaframe
     * @type {VideoMediaFrame} 
     */
    VideoMediaFrame {
        get => this.get_VideoMediaFrame()
    }

    /**
     * Gets the spatial coordinate system for the referenced media frame, if one is defined.
     * @remarks
     * If no spatial coordinate system is defined for the referenced media frame, the returned [SpatialCoordinateSystem](../windows.perception.spatial/spatialcoordinatesystem.md) object is null.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframereference.coordinatesystem
     * @type {SpatialCoordinateSystem} 
     */
    CoordinateSystem {
        get => this.get_CoordinateSystem()
    }

    /**
     * Gets the [AudioMediaFrame](audiomediaframe.md) wrapped by the [MediaFrameReference](mediaframereference.md), if that is the type of frame represented.
     * @remarks
     * If the frame reference wraps a different type of frame, or if the audio frame data is in a format that is unsupported, then this property is null. In this case, you can access the [BufferMediaFrame](mediaframereference_buffermediaframe.md) property, which is always non-null.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframereference.audiomediaframe
     * @type {AudioMediaFrame} 
     */
    AudioMediaFrame {
        get => this.get_AudioMediaFrame()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SourceKind() {
        if (!this.HasProp("__IMediaFrameReference")) {
            if ((queryResult := this.QueryInterface(IMediaFrameReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameReference := IMediaFrameReference(outPtr)
        }

        return this.__IMediaFrameReference.get_SourceKind()
    }

    /**
     * 
     * @returns {MediaFrameFormat} 
     */
    get_Format() {
        if (!this.HasProp("__IMediaFrameReference")) {
            if ((queryResult := this.QueryInterface(IMediaFrameReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameReference := IMediaFrameReference(outPtr)
        }

        return this.__IMediaFrameReference.get_Format()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_SystemRelativeTime() {
        if (!this.HasProp("__IMediaFrameReference")) {
            if ((queryResult := this.QueryInterface(IMediaFrameReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameReference := IMediaFrameReference(outPtr)
        }

        return this.__IMediaFrameReference.get_SystemRelativeTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        if (!this.HasProp("__IMediaFrameReference")) {
            if ((queryResult := this.QueryInterface(IMediaFrameReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameReference := IMediaFrameReference(outPtr)
        }

        return this.__IMediaFrameReference.get_Duration()
    }

    /**
     * 
     * @returns {IMapView<Guid, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IMediaFrameReference")) {
            if ((queryResult := this.QueryInterface(IMediaFrameReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameReference := IMediaFrameReference(outPtr)
        }

        return this.__IMediaFrameReference.get_Properties()
    }

    /**
     * 
     * @returns {BufferMediaFrame} 
     */
    get_BufferMediaFrame() {
        if (!this.HasProp("__IMediaFrameReference")) {
            if ((queryResult := this.QueryInterface(IMediaFrameReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameReference := IMediaFrameReference(outPtr)
        }

        return this.__IMediaFrameReference.get_BufferMediaFrame()
    }

    /**
     * 
     * @returns {VideoMediaFrame} 
     */
    get_VideoMediaFrame() {
        if (!this.HasProp("__IMediaFrameReference")) {
            if ((queryResult := this.QueryInterface(IMediaFrameReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameReference := IMediaFrameReference(outPtr)
        }

        return this.__IMediaFrameReference.get_VideoMediaFrame()
    }

    /**
     * 
     * @returns {SpatialCoordinateSystem} 
     */
    get_CoordinateSystem() {
        if (!this.HasProp("__IMediaFrameReference")) {
            if ((queryResult := this.QueryInterface(IMediaFrameReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameReference := IMediaFrameReference(outPtr)
        }

        return this.__IMediaFrameReference.get_CoordinateSystem()
    }

    /**
     * Disposes of the object and associated resources.
     * @remarks
     * The **Close** method is used by Universal Windows app using JavaScript. For apps written using the .NET Framework 4.5 in C# and VB.NET, the **Close** method is exposed as the **Dispose()** method on the [MediaFrameReference](mediaframereference.md) object. For apps written in C++, the **Close** method will be called when using the **delete** keyword on the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframereference.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

    /**
     * 
     * @returns {AudioMediaFrame} 
     */
    get_AudioMediaFrame() {
        if (!this.HasProp("__IMediaFrameReference2")) {
            if ((queryResult := this.QueryInterface(IMediaFrameReference2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameReference2 := IMediaFrameReference2(outPtr)
        }

        return this.__IMediaFrameReference2.get_AudioMediaFrame()
    }

;@endregion Instance Methods
}
