#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastPreviewStreamVideoHeader.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents metadata about an app broadcast preview stream video frame.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpreviewstreamvideoheader
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastPreviewStreamVideoHeader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastPreviewStreamVideoHeader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastPreviewStreamVideoHeader.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the absolute time stamp for the app broadcast preview stream video frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpreviewstreamvideoheader.absolutetimestamp
     * @type {DateTime} 
     */
    AbsoluteTimestamp {
        get => this.get_AbsoluteTimestamp()
    }

    /**
     * Gets the relative time stamp for the app broadcast preview stream video frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpreviewstreamvideoheader.relativetimestamp
     * @type {TimeSpan} 
     */
    RelativeTimestamp {
        get => this.get_RelativeTimestamp()
    }

    /**
     * Gets the duration for the app broadcast preview stream video frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpreviewstreamvideoheader.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * Gets the frame ID for the app broadcast preview stream video frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpreviewstreamvideoheader.frameid
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
        if (!this.HasProp("__IAppBroadcastPreviewStreamVideoHeader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPreviewStreamVideoHeader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPreviewStreamVideoHeader := IAppBroadcastPreviewStreamVideoHeader(outPtr)
        }

        return this.__IAppBroadcastPreviewStreamVideoHeader.get_AbsoluteTimestamp()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_RelativeTimestamp() {
        if (!this.HasProp("__IAppBroadcastPreviewStreamVideoHeader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPreviewStreamVideoHeader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPreviewStreamVideoHeader := IAppBroadcastPreviewStreamVideoHeader(outPtr)
        }

        return this.__IAppBroadcastPreviewStreamVideoHeader.get_RelativeTimestamp()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        if (!this.HasProp("__IAppBroadcastPreviewStreamVideoHeader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPreviewStreamVideoHeader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPreviewStreamVideoHeader := IAppBroadcastPreviewStreamVideoHeader(outPtr)
        }

        return this.__IAppBroadcastPreviewStreamVideoHeader.get_Duration()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FrameId() {
        if (!this.HasProp("__IAppBroadcastPreviewStreamVideoHeader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPreviewStreamVideoHeader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPreviewStreamVideoHeader := IAppBroadcastPreviewStreamVideoHeader(outPtr)
        }

        return this.__IAppBroadcastPreviewStreamVideoHeader.get_FrameId()
    }

;@endregion Instance Methods
}
