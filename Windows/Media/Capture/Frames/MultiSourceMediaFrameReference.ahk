#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMultiSourceMediaFrameReference.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A wrapper class that provides access to time-correlated frames obtained from one or more [MediaFrameSource](mediaframesource.md) objects. Call  [TryGetFrameReferenceBySourceId](multisourcemediaframereference_trygetframereferencebysourceid_1428642806.md) to get the [MediaFrameReference](mediaframereference.md) representing a frame from a particular media frame source.
 * @remarks
 * To get an instance of MultiSourceMediaFrameReference from a media frame source, create a [MultiSourceMediaFrameReader](multisourcemediaframereader.md) by calling [CreateMultiSourceFrameReaderAsync](../windows.media.capture/mediacapture_createmultisourceframereaderasync_1316837028.md) on a [MediaCapture](../windows.media.capture/mediacapture.md) object, passing in the [MediaFrameSource](mediaframesource.md) objects from which you want to read. After starting by calling [StartAsync](multisourcemediaframereader_startasync_1931900819.md), call [TryAcquireLatestFrame](multisourcemediaframereader_tryacquirelatestframe_612769713.md) to get a **MultiSourceMediaFrameReference** which contains the latest correlated frames from the media frame sources.
 * 
 * Get the time-correlated media frame from a particular media frame source by calling [MultiSourceMediaFrameReference.TryGetFrameReferenceBySourceId](./multisourcemediaframereference_trygetframereferencebysourceid_1428642806.md) and passing in the value of the [MediaFrameSourceInfo.Id](./mediaframesourceinfo_id.md) property for the desired media frame source.
 * 
 * Each [MultiSourceMediaFrameReader](multisourcemediaframereader.md) maintains a circular buffer of **MediaFrameReference** objects obtained from [MultiSourceMediaFrameReference.TryGetFrameReferenceBySourceId](./multisourcemediaframereference_trygetframereferencebysourceid_1428642806.md). After all of the **MediaFrameReference** objects in the buffer have been used, subsequent calls to **TryAcquireLatestFrame** will cause the system to call [Close](mediaframereference_close_811482585.md) (or **Dispose** in C#) on the oldest buffer object in order to reuse it. Once the object has been disposed, you can no longer use it to access the frame data. For this reason, you should not store the **MediaFrameReference** object longer than you actually need to process the frame. If your app scenario requires you to keep a reference to the data for longer, you should use one of the APIs provided to get the underlying data. These methods include:
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
 * 
 * For how-to guidance on using [MediaFrameSource](mediaframesource.md) to capture frames, see [Process media frames with MediaFrameReader](/windows/uwp/audio-video-camera/process-media-frames-with-mediaframereader).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.multisourcemediaframereference
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class MultiSourceMediaFrameReference extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMultiSourceMediaFrameReference

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMultiSourceMediaFrameReference.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Attempts to get a time-correlated [MediaFrameReference](mediaframereference.md) for the specified media frame source.
     * @param {HSTRING} sourceId The [Id](mediaframesourceinfo_id.md) property of the [MediaFrameSourceInfo](mediaframesourceinfo.md) object representing the media frame source from which a frame reference should be retreived.
     * @returns {MediaFrameReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.multisourcemediaframereference.trygetframereferencebysourceid
     */
    TryGetFrameReferenceBySourceId(sourceId) {
        if (!this.HasProp("__IMultiSourceMediaFrameReference")) {
            if ((queryResult := this.QueryInterface(IMultiSourceMediaFrameReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMultiSourceMediaFrameReference := IMultiSourceMediaFrameReference(outPtr)
        }

        return this.__IMultiSourceMediaFrameReference.TryGetFrameReferenceBySourceId(sourceId)
    }

    /**
     * Disposes of the object and associated resources.
     * @remarks
     * The **Close** method is used by Universal Windows app using JavaScript. For apps written using the .NET Framework 4.5 in C# and VB.NET, the **Close** method is exposed as the **Dispose()** method on the [MediaFrameReference](mediaframereference.md) object. For apps written in C++, the **Close** method will be called when using the **delete** keyword on the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.multisourcemediaframereference.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
