#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaCapturePauseResult.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the last frame captured and the recorded duration of a media capture operation that has been paused.
 * @remarks
 * Get an instance of this class by calling [PauseRecordWithResultAsync](mediacapture_pauserecordwithresultasync_97197073.md).
 * 
 * For how-to guidance for pausing and resuming while recording video, see [Basic photo, video, and audio capture with MediaCapture in a WinUI 3 app](/windows/apps/develop/camera/basic-photo-capture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturepauseresult
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class MediaCapturePauseResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaCapturePauseResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaCapturePauseResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a [VideoFrame](mediacapture_getpreviewframeasync_440877418.md) representing the last frame captured before the capture operation was paused.
     * @remarks
     * You can display the frame semi-transparently over the capture preview to help the user to align the camera with the last captured frame before they resume capturing.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturepauseresult.lastframe
     * @type {VideoFrame} 
     */
    LastFrame {
        get => this.get_LastFrame()
    }

    /**
     * Gets the duration of the media captured before the capture operation was paused.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturepauseresult.recordduration
     * @type {TimeSpan} 
     */
    RecordDuration {
        get => this.get_RecordDuration()
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
     * @returns {VideoFrame} 
     */
    get_LastFrame() {
        if (!this.HasProp("__IMediaCapturePauseResult")) {
            if ((queryResult := this.QueryInterface(IMediaCapturePauseResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapturePauseResult := IMediaCapturePauseResult(outPtr)
        }

        return this.__IMediaCapturePauseResult.get_LastFrame()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_RecordDuration() {
        if (!this.HasProp("__IMediaCapturePauseResult")) {
            if ((queryResult := this.QueryInterface(IMediaCapturePauseResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapturePauseResult := IMediaCapturePauseResult(outPtr)
        }

        return this.__IMediaCapturePauseResult.get_RecordDuration()
    }

    /**
     * Closes the object and disposes of associated resources.
     * @remarks
     * The **Close** method is used by Universal Windows app using JavaScript. For apps written using the .NET Framework 4.5 in C# and VB.NET, the **Close** method is exposed as the **Dispose()** method on the [MediaCapturePauseResult](mediacapturepauseresult.md) object. For apps written in C++, the **Close** method will be called when using the **delete** keyword on the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturepauseresult.close
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
