#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaFrameArrivedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [MediaFrameReader.FrameArrived](mediaframereader_framearrived.md) event.
 * @remarks
 * Get an instance of this class by handling the [MediaFrameReader.FrameArrived](mediaframereader_framearrived.md) event. In the event handler, cast the sender as a [MediaFrameReader](mediaframereader.md) and call [TryAcquireLatestFrame](mediaframereader_tryacquirelatestframe_612769713.md) to get a [MediaFrameReference](mediaframereference.md) representing the latest frame from the frame source, if one is available.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframearrivedeventargs
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class MediaFrameArrivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaFrameArrivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaFrameArrivedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
