#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaFrameReader.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include .\IMediaFrameReader2.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\MediaFrameReader.ahk
#Include .\MediaFrameArrivedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides access to frames from a [MediaFrameSource](mediaframesource.md) and notification when a new frame arrives.
 * @remarks
 * Get an instance of this class by calling [CreateFrameReaderAsync](../windows.media.capture/mediacapture_createframereaderasync_1014922223.md) on a [MediaCapture](/windows/uwp/audio-video-camera/capture-photos-and-video-with-mediacapture) object that has been initialized to use the desired media frame source.
 * 
 * For how-to guidance on using [MediaFrameSource](mediaframesource.md) to capture frames, see [Process media frames with MediaFrameReader](/windows/uwp/audio-video-camera/process-media-frames-with-mediaframereader).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframereader
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class MediaFrameReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaFrameReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaFrameReader.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that specifies the way that the system should manage frames acquired from a **MediaFrameReader** when a new frame arrives before the app has finished processing the previous frame.
     * @remarks
     * If this property is set to [Realtime](/uwp/api/windows.media.capture.frames.mediaframereaderacquisitionmode), frames that arrive while the app's [FrameArrived](/uwp/api/windows.media.capture.frames.mediaframereader.FrameArrived) event handler is executing are dropped. This mode works well for scenarios where processing the most current frame is prioritized, such as real-time computer vision applications.
     * 
     * If this property is set to [Buffered](/uwp/api/windows.media.capture.frames.mediaframereaderacquisitionmode),  frames that arrive while the app's **FrameArrived** event handler is executing are buffered in memory by the system. The **FrameArrived** event is raised for each buffered frame when the event handler for the previous frame has completed. This mode is intended for apps for which the sequence of frames is critical and for which dropped frames will break the scenario. Note that once the system's memory limit for buffered frames has been reached, no more frames will be acquired until the app processes buffered frames, freeing memory for the acquisition of additional frames.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframereader.acquisitionmode
     * @type {Integer} 
     */
    AcquisitionMode {
        get => this.get_AcquisitionMode()
        set => this.put_AcquisitionMode(value)
    }

    /**
     * Occurs when a new frame arrives from the media frame source associated with the [MediaFrameReader](mediaframereader.md).
     * @remarks
     * In the handler for the **FrameArrived** event, call [TryAcquireLatestFrame](mediaframereader_tryacquirelatestframe_612769713.md) to get a [MediaFrameReference](mediaframereference.md) representing the latest frame from the media frame source.
     * @type {TypedEventHandler<MediaFrameReader, MediaFrameArrivedEventArgs>}
    */
    OnFrameArrived {
        get {
            if(!this.HasProp("__OnFrameArrived")){
                this.__OnFrameArrived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d3dd49cb-8d25-591a-80f7-8363d5c03ec9}"),
                    MediaFrameReader,
                    MediaFrameArrivedEventArgs
                )
                this.__OnFrameArrivedToken := this.add_FrameArrived(this.__OnFrameArrived.iface)
            }
            return this.__OnFrameArrived
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnFrameArrivedToken")) {
            this.remove_FrameArrived(this.__OnFrameArrivedToken)
            this.__OnFrameArrived.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaFrameReader, MediaFrameArrivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameArrived(handler) {
        if (!this.HasProp("__IMediaFrameReader")) {
            if ((queryResult := this.QueryInterface(IMediaFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameReader := IMediaFrameReader(outPtr)
        }

        return this.__IMediaFrameReader.add_FrameArrived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FrameArrived(token) {
        if (!this.HasProp("__IMediaFrameReader")) {
            if ((queryResult := this.QueryInterface(IMediaFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameReader := IMediaFrameReader(outPtr)
        }

        return this.__IMediaFrameReader.remove_FrameArrived(token)
    }

    /**
     * Attempts to obtain a [MediaFrameReference](mediaframereference.md) object representing the latest frame from the [MediaFrameSource](mediaframesource.md).
     * @remarks
     * This method does not always succeed. If the method fails, the returned **MediaFrameReference** will be null, so you should always test to see if the returned object is null before trying to use it. You should call this method from within the handler for the [MediaFrameReader.FrameArrived](mediaframereader_framearrived.md) event instead of manually polling for new frames.
     * 
     * Each [MediaFrameReader](mediaframereader.md) maintains a circular buffer of [MediaFrameReference](mediaframereference.md) objects obtained from **TryAcquireLatestFrame**. After all of the **MediaFrameReference** objects in the buffer have been used, subsequent calls to **TryAcquireLatestFrame** will cause the system to call [Close](mediaframereference_close_811482585.md) (or **Dispose** in C#) on the oldest buffer object in order to reuse it. Once the object has been disposed, you can no longer use it to access the frame data. For this reason, you should not store the **MediaFrameReference** object longer than you actually need to process the frame. If your app scenario requires you to keep a reference to the data for longer, you should use one of the APIs provided to get the underlying data. These include:
     * 
     * 
     * + [VideoMediaFrame.SoftwareBitmap](videomediaframe_softwarebitmap.md)
     * + [VideoMediaFrame.Direct3DSurface](videomediaframe_direct3dsurface.md)
     * 
     * It is the responsibility of the app to call [Close](mediaframereference_close_811482585.md) (or **Dispose**) on the objects returned by these APIs when they are no longer being used.
     * 
     * > [!IMPORTANT]
     * > If you access the [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md) or [Direct3DSurface](../windows.graphics.directx.direct3d11/idirect3dsurface.md) objects provided by the [VideoMediaFrame](mediaframereference_videomediaframe.md) property of a [MediaFrameReference](mediaframereference.md), the system creates a strong reference to these objects, which means that they will not be disposed when you call [Dispose](mediaframereference_close_811482585.md) on the containing **MediaFrameReference**. This also applies to the **SoftwareBitmap** or **Direct3DSurface** objects provided by the **VideoFrame** object that you obtain from the [MediaFrameReference.VideoMediaFrame](mediaframereference_videomediaframe.md) property. You must explicitly call the **Dispose** method of the **SoftwareBitmap** or **Direct3DSurface** directly for the objects to be immediately disposed. Otherwise, the garbage collector will eventually free the memory for these objects, but you can't know when this will occur, and if the number of allocated bitmaps or surfaces exceeds the maximum amount allowed by the system, the flow of new frames will stop.
     * @returns {MediaFrameReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframereader.tryacquirelatestframe
     */
    TryAcquireLatestFrame() {
        if (!this.HasProp("__IMediaFrameReader")) {
            if ((queryResult := this.QueryInterface(IMediaFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameReader := IMediaFrameReader(outPtr)
        }

        return this.__IMediaFrameReader.TryAcquireLatestFrame()
    }

    /**
     * Asynchronously starts the reading of frames from a [MediaFrameSource](mediaframesource.md).
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframereader.startasync
     */
    StartAsync() {
        if (!this.HasProp("__IMediaFrameReader")) {
            if ((queryResult := this.QueryInterface(IMediaFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameReader := IMediaFrameReader(outPtr)
        }

        return this.__IMediaFrameReader.StartAsync()
    }

    /**
     * Asynchronously stops the reading of frames from a [MediaFrameSource](mediaframesource.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframereader.stopasync
     */
    StopAsync() {
        if (!this.HasProp("__IMediaFrameReader")) {
            if ((queryResult := this.QueryInterface(IMediaFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameReader := IMediaFrameReader(outPtr)
        }

        return this.__IMediaFrameReader.StopAsync()
    }

    /**
     * Disposes of the object and associated resources.
     * @remarks
     * The **Close** method is used by Universal Windows app using JavaScript. For apps written using the .NET Framework 4.5 in C# and VB.NET, the **Close** method is exposed as the **Dispose()** method on the [MediaFrameReader](mediaframereader.md) object. For apps written in C++, the **Close** method will be called when using the **delete** keyword on the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframereader.close
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
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AcquisitionMode(value) {
        if (!this.HasProp("__IMediaFrameReader2")) {
            if ((queryResult := this.QueryInterface(IMediaFrameReader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameReader2 := IMediaFrameReader2(outPtr)
        }

        return this.__IMediaFrameReader2.put_AcquisitionMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AcquisitionMode() {
        if (!this.HasProp("__IMediaFrameReader2")) {
            if ((queryResult := this.QueryInterface(IMediaFrameReader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameReader2 := IMediaFrameReader2(outPtr)
        }

        return this.__IMediaFrameReader2.get_AcquisitionMode()
    }

;@endregion Instance Methods
}
