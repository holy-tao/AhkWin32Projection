#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMultiSourceMediaFrameReader.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include .\IMultiSourceMediaFrameReader2.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\MultiSourceMediaFrameReader.ahk
#Include .\MultiSourceMediaFrameArrivedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides access to time-correlated frames from multiple [MediaFrameSource](mediaframesource.md) and provides notifications when new frames arrive. This is useful if you need to process frames from different sources, such as a depth camera and an rbg camera, and you need to make sure that the frames from each source were captured close to each other in time.
 * @remarks
 * Get an instance of this class by calling [CreateMultiSourceFrameReaderAsync](../windows.media.capture/mediacapture_createmultisourceframereaderasync_1316837028.md) on a [MediaCapture](../windows.media.capture/mediacapture.md) object that has been initialized to use the desired media frame source.
 * 
 * To read frames from one or more [MediaFrameSource](mediaframesource.md) objects without time correlation between different sources, you can use [MediaFrameReader](../mediaframereader.md).
 * 
 * For how-to guidance on using [MediaFrameSource](mediaframesource.md) to capture frames, see [Process media frames with MediaFrameReader](/windows/uwp/audio-video-camera/process-media-frames-with-mediaframereader).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.multisourcemediaframereader
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class MultiSourceMediaFrameReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMultiSourceMediaFrameReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMultiSourceMediaFrameReader.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Specifies the way that the system should manage frames acquired from a **MultiSourceMediaFrameReader** when a new frame arrives before the app has finished processing the previous frame.
     * @remarks
     * If this property is set to [Realtime](/uwp/api/windows.media.capture.frames.mediaframereaderacquisitionmode), frames that arrive while the app's [FrameArrived](/uwp/api/windows.media.capture.frames.multisourcemediaframereader.FrameArrived) event handler is executing are dropped. This mode works well for scenarios where processing the most current frame is prioritized, such as real-time computer vision applications.
     * 
     * If this property is set to [Buffered](/uwp/api/windows.media.capture.frames.mediaframereaderacquisitionmode),  frames that arrive while the app's **FrameArrived** event handler is executing are buffered in memory by the system. The **FrameArrived** event is raised for each buffered frame when the event handler for the previous frame has completed. This mode is intended for apps for which the sequence of frames is critical and for which dropped frames will break the scenario. Note that once the system's memory limit for buffered frames has been reached, no more frames will be acquired until the app processes buffered frames, freeing memory for the acquisition of additional frames.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.multisourcemediaframereader.acquisitionmode
     * @type {Integer} 
     */
    AcquisitionMode {
        get => this.get_AcquisitionMode()
        set => this.put_AcquisitionMode(value)
    }

    /**
     * Occurs when a new frame arrives from all of the media frame sources associated with the [MultiSourceMediaFrameReader](multisourcemediaframereader.md).
     * @remarks
     * In the handler for the **FrameArrived** event, call [TryAcquireLatestFrame](mediaframereader_tryacquirelatestframe_612769713.md) on the [MultiSourceMediaFrameReference](./multisourcemediaframereference.md) passed in as the sender parameter to the event handler to get a [MultiSourceMediaFrameReference](multisourcemediaframereference.md) representing the latest set of correlated frames from the media frame sources for which the reader was created. Then, get the time-correlated media frame from a particular media frame source by calling [TryGetFrameReferenceBySourceId](./multisourcemediaframereference_trygetframereferencebysourceid_1428642806.md) and passing in the value of the [MediaFrameSourceInfo.Id](./mediaframesourceinfo_id.md) property for the desired media frame source.
     * 
     * Note that this event is only raised when a new frame is available from all of the media frame sources associated with the [MultiSourceMediaFrameReader](multisourcemediaframereader.md). For example, if one of the sources produces frames at twice the rate of another, half of the frames from the faster source will be dropped and this event will only be raised when the slower frame source has a new frame available.  For this reason, it's a good idea to set up an event and signal it each time this event is raised. In a separate thread, you can check to see if the event has been signaled within a specified time window, 5 seconds for example. If the event has not been signaled with the time window, your app can deduce that one of the frame sources is no longer generating frames and that the reader should be stopped. 
     * 
     * For how-to guidance on working with time-correlated media frames, see [Process media frames with MediaFrameReader](/windows/uwp/audio-video-camera/process-media-frames-with-mediaframereader).
     * @type {TypedEventHandler<MultiSourceMediaFrameReader, MultiSourceMediaFrameArrivedEventArgs>}
    */
    OnFrameArrived {
        get {
            if(!this.HasProp("__OnFrameArrived")){
                this.__OnFrameArrived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{82b1ad4d-9887-56f4-9a9e-3ab18b02198c}"),
                    MultiSourceMediaFrameReader,
                    MultiSourceMediaFrameArrivedEventArgs
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
     * @param {TypedEventHandler<MultiSourceMediaFrameReader, MultiSourceMediaFrameArrivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameArrived(handler) {
        if (!this.HasProp("__IMultiSourceMediaFrameReader")) {
            if ((queryResult := this.QueryInterface(IMultiSourceMediaFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMultiSourceMediaFrameReader := IMultiSourceMediaFrameReader(outPtr)
        }

        return this.__IMultiSourceMediaFrameReader.add_FrameArrived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FrameArrived(token) {
        if (!this.HasProp("__IMultiSourceMediaFrameReader")) {
            if ((queryResult := this.QueryInterface(IMultiSourceMediaFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMultiSourceMediaFrameReader := IMultiSourceMediaFrameReader(outPtr)
        }

        return this.__IMultiSourceMediaFrameReader.remove_FrameArrived(token)
    }

    /**
     * Attempts to obtain a [MultiSourceMediaFrameReference](multisourcemediaframereference.md) object which provides access to the latest time-correlated frames from one or more [MediaFrameSource](mediaframesource.md) objects.
     * @remarks
     * After getting an instance of [MultiSourceMediaFrameReference](multisourcemediaframereference.md), get the time-correlated media frame from a particular media frame source by calling [MultiSourceMediaFrameReference.TryGetFrameReferenceBySourceId](./multisourcemediaframereference_trygetframereferencebysourceid_1428642806.md) and passing in the value of the [MediaFrameSourceInfo.Id](./mediaframesourceinfo_id.md) property for the desired media frame source.
     * 
     * 
     * Each [MultiSourceMediaFrameReader](multisourcemediaframereader.md) maintains a circular buffer of [MediaFrameReference](mediaframereference.md) objects obtained from **TryAcquireLatestFrame**. After all of the **MediaFrameReference** objects in the buffer have been used, subsequent calls to **TryAcquireLatestFrame** will cause the system to call [Close](mediaframereference_close_811482585.md) (or **Dispose** in C#) on the oldest buffer object in order to reuse it. Once the object has been disposed, you can no longer use it to access the frame data. For this reason, you should not store the **MediaFrameReference** object longer than you actually need to process the frame. If your app scenario requires you to keep a reference to the data for longer, you should use one of the APIs provided to get the underlying data. These methods include:
     * 
     * 
     * + [BufferMediaFrame.Buffer](buffermediaframe_buffer.md)
     * + [VideoMediaFrame.SoftwareBitmap](videomediaframe_softwarebitmap.md)
     * + [VideoMediaFrame.GetVideoFrame](videomediaframe_getvideoframe_824740069.md)
     * + [VideoMediaFrame.CameraIntrinsics](videomediaframe_cameraintrinsics.md)
     * It is the responsibility of the app to call [Close](mediaframereference_close_811482585.md) (or **Dispose**) on the objects returned by these APIs when they are no longer being used.
     * 
     * > [!IMPORTANT]
     * > If you access the [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md) or [Direct3DSurface](../windows.graphics.directx.direct3d11/idirect3dsurface.md) objects provided by the [VideoMediaFrame](mediaframereference_videomediaframe.md) property of a [MediaFrameReference](mediaframereference.md), the system creates a strong reference to these objects, which means that they will not be disposed when you call [Dispose](mediaframereference_close_811482585.md) on the containing **MediaFrameReference**. You must explicitly call the **Dispose** method of the **SoftwareBitmap** or **Direct3DSurface** directly for the objects to be immediately disposed. Otherwise, the garbage collector will eventually free the memory for these objects, but you can't know when this will occur, and if the number of allocated bitmaps or surfaces exceeds the maximum amount allowed by the system, the flow of new frames will stop.
     * @returns {MultiSourceMediaFrameReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.multisourcemediaframereader.tryacquirelatestframe
     */
    TryAcquireLatestFrame() {
        if (!this.HasProp("__IMultiSourceMediaFrameReader")) {
            if ((queryResult := this.QueryInterface(IMultiSourceMediaFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMultiSourceMediaFrameReader := IMultiSourceMediaFrameReader(outPtr)
        }

        return this.__IMultiSourceMediaFrameReader.TryAcquireLatestFrame()
    }

    /**
     * Asynchronously starts the reading of time-corellated frames from one or more [MediaFrameSource](mediaframesource.md) objects.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.multisourcemediaframereader.startasync
     */
    StartAsync() {
        if (!this.HasProp("__IMultiSourceMediaFrameReader")) {
            if ((queryResult := this.QueryInterface(IMultiSourceMediaFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMultiSourceMediaFrameReader := IMultiSourceMediaFrameReader(outPtr)
        }

        return this.__IMultiSourceMediaFrameReader.StartAsync()
    }

    /**
     * Asynchronously stops the reading of time-corellated frames from one or more [MediaFrameSource](mediaframesource.md) objects.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.multisourcemediaframereader.stopasync
     */
    StopAsync() {
        if (!this.HasProp("__IMultiSourceMediaFrameReader")) {
            if ((queryResult := this.QueryInterface(IMultiSourceMediaFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMultiSourceMediaFrameReader := IMultiSourceMediaFrameReader(outPtr)
        }

        return this.__IMultiSourceMediaFrameReader.StopAsync()
    }

    /**
     * Disposes of the object and associated resources.
     * @remarks
     * The **Close** method is used by Universal Windows app using JavaScript. For apps written using the .NET Framework 4.5 in C# and VB.NET, the **Close** method is exposed as the **Dispose()** method on the [MediaFrameReference](mediaframereference.md) object. For apps written in C++, the **Close** method will be called when using the **delete** keyword on the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.multisourcemediaframereader.close
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
        if (!this.HasProp("__IMultiSourceMediaFrameReader2")) {
            if ((queryResult := this.QueryInterface(IMultiSourceMediaFrameReader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMultiSourceMediaFrameReader2 := IMultiSourceMediaFrameReader2(outPtr)
        }

        return this.__IMultiSourceMediaFrameReader2.put_AcquisitionMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AcquisitionMode() {
        if (!this.HasProp("__IMultiSourceMediaFrameReader2")) {
            if ((queryResult := this.QueryInterface(IMultiSourceMediaFrameReader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMultiSourceMediaFrameReader2 := IMultiSourceMediaFrameReader2(outPtr)
        }

        return this.__IMultiSourceMediaFrameReader2.get_AcquisitionMode()
    }

;@endregion Instance Methods
}
