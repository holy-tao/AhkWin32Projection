#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBufferMediaFrame.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a frame from a [MediaFrameSource](mediaframesource.md) that provides data in an [IBuffer](../windows.storage.streams/ibuffer.md).
 * @remarks
 * Get an instance of this class by accessing the BufferMediaFrame property of a [MediaFrameReference](mediaframereference.md) object that was obtained from a media frame source. The **BufferMediaFrame** property of a **MediaFrameReference** will always be non-null. This is not true for other frame types, such as [VideoMediaFrame](videomediaframe.md), which will be null if the buffer doesn't contain 2D image data or contains data in an unknown format.
 * 
 * A **BufferMediaFrame** represents the 1D buffer. If the underlying sample returned by the pipeline contains non-consecutive data, the system uses [IMFMediaBuffer.Lock](/windows/desktop/api/mfobjects/nf-mfobjects-imfmediabuffer-lock) to copy the 2D buffer into the 1D buffer. For this reason, it is recommended that you use BufferMediaFrame for arbitrary buffers, such as skeleton or body tracking data, but that you use [VideoMediaFrame](videomediaframe.md) for 2D buffers to avoid extra copy operations.
 * 
 * 
 * 
 * For how-to guidance on using [MediaFrameSource](mediaframesource.md) to capture frames, see [Process media frames with MediaFrameReader](/windows/uwp/audio-video-camera/process-media-frames-with-mediaframereader).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.buffermediaframe
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class BufferMediaFrame extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBufferMediaFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBufferMediaFrame.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [MediaFrameReference](mediaframereference.md) wrapper object associated with the [BufferMediaFrame](buffermediaframe.md), which provides access to format information and other properties of the media frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.buffermediaframe.framereference
     * @type {MediaFrameReference} 
     */
    FrameReference {
        get => this.get_FrameReference()
    }

    /**
     * Gets the buffer that contains the data for the [BufferMediaFrame](buffermediaframe.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.buffermediaframe.buffer
     * @type {IBuffer} 
     */
    Buffer {
        get => this.get_Buffer()
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
        if (!this.HasProp("__IBufferMediaFrame")) {
            if ((queryResult := this.QueryInterface(IBufferMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBufferMediaFrame := IBufferMediaFrame(outPtr)
        }

        return this.__IBufferMediaFrame.get_FrameReference()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Buffer() {
        if (!this.HasProp("__IBufferMediaFrame")) {
            if ((queryResult := this.QueryInterface(IBufferMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBufferMediaFrame := IBufferMediaFrame(outPtr)
        }

        return this.__IBufferMediaFrame.get_Buffer()
    }

;@endregion Instance Methods
}
