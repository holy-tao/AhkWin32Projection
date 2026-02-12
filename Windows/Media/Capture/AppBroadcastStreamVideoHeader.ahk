#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastStreamVideoHeader.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides metadata about a broadcast video frame.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * Get an instance of this class by accessing the [VideoHeader](appbroadcaststreamvideoframe_videoheader.md) property of an [AppBroadcastStreamVideoFrame](appbroadcaststreamvideoframe.md) object obtained from a call to [AppBroadcastStreamReader.TryGetNextVideoFrame](appbroadcaststreamreader_trygetnextvideoframe_1410796427.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamvideoheader
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastStreamVideoHeader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastStreamVideoHeader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastStreamVideoHeader.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a time stamp indicating the system time at which the video frame was captured.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamvideoheader.absolutetimestamp
     * @type {DateTime} 
     */
    AbsoluteTimestamp {
        get => this.get_AbsoluteTimestamp()
    }

    /**
     * Gets a time stamp indicating the relative time within the video stream at which the video frame was captured.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamvideoheader.relativetimestamp
     * @type {TimeSpan} 
     */
    RelativeTimestamp {
        get => this.get_RelativeTimestamp()
    }

    /**
     * Gets a value indicating the duration of the video frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamvideoheader.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * Gets a value indicating whether the video frame is a key frame within the broadcast video stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamvideoheader.iskeyframe
     * @type {Boolean} 
     */
    IsKeyFrame {
        get => this.get_IsKeyFrame()
    }

    /**
     * Gets a value indicating whether the video frame contains a discontinuity in the video stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamvideoheader.hasdiscontinuity
     * @type {Boolean} 
     */
    HasDiscontinuity {
        get => this.get_HasDiscontinuity()
    }

    /**
     * Gets a value that identifies the video frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamvideoheader.frameid
     * @type {Integer} 
     */
    FrameId {
        get => this.get_FrameId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_AbsoluteTimestamp() {
        if (!this.HasProp("__IAppBroadcastStreamVideoHeader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamVideoHeader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamVideoHeader := IAppBroadcastStreamVideoHeader(outPtr)
        }

        return this.__IAppBroadcastStreamVideoHeader.get_AbsoluteTimestamp()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_RelativeTimestamp() {
        if (!this.HasProp("__IAppBroadcastStreamVideoHeader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamVideoHeader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamVideoHeader := IAppBroadcastStreamVideoHeader(outPtr)
        }

        return this.__IAppBroadcastStreamVideoHeader.get_RelativeTimestamp()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        if (!this.HasProp("__IAppBroadcastStreamVideoHeader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamVideoHeader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamVideoHeader := IAppBroadcastStreamVideoHeader(outPtr)
        }

        return this.__IAppBroadcastStreamVideoHeader.get_Duration()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsKeyFrame() {
        if (!this.HasProp("__IAppBroadcastStreamVideoHeader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamVideoHeader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamVideoHeader := IAppBroadcastStreamVideoHeader(outPtr)
        }

        return this.__IAppBroadcastStreamVideoHeader.get_IsKeyFrame()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasDiscontinuity() {
        if (!this.HasProp("__IAppBroadcastStreamVideoHeader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamVideoHeader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamVideoHeader := IAppBroadcastStreamVideoHeader(outPtr)
        }

        return this.__IAppBroadcastStreamVideoHeader.get_HasDiscontinuity()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FrameId() {
        if (!this.HasProp("__IAppBroadcastStreamVideoHeader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamVideoHeader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamVideoHeader := IAppBroadcastStreamVideoHeader(outPtr)
        }

        return this.__IAppBroadcastStreamVideoHeader.get_FrameId()
    }

;@endregion Instance Methods
}
