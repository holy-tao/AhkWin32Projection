#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAdaptiveMediaSourceDownloadStatistics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a set of download statistics associated with the [AdaptiveMediaSource.DownloadFailed](adaptivemediasource_downloadfailed.md) and [AdaptiveMediaSource.DownloadCompleted](adaptivemediasource_downloadcompleted.md) events.
 * @remarks
 * These values are provided to enable telemetry collection and are not intended to be used to adjust app behavior at runtime.
 * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadstatistics
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class AdaptiveMediaSourceDownloadStatistics extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAdaptiveMediaSourceDownloadStatistics

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAdaptiveMediaSourceDownloadStatistics.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the count of bytes that have been received at the time of the event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadstatistics.contentbytesreceivedcount
     * @type {Integer} 
     */
    ContentBytesReceivedCount {
        get => this.get_ContentBytesReceivedCount()
    }

    /**
     * Gets the time window between when the system makes the asyncronous http request for the content and when the operation completes, when the http headers have been received.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadstatistics.timetoheadersreceived
     * @type {IReference<TimeSpan>} 
     */
    TimeToHeadersReceived {
        get => this.get_TimeToHeadersReceived()
    }

    /**
     * Gets the time window between when the system makes the asyncronous http request for the content and when the first block of data has been read from the http stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadstatistics.timetofirstbytereceived
     * @type {IReference<TimeSpan>} 
     */
    TimeToFirstByteReceived {
        get => this.get_TimeToFirstByteReceived()
    }

    /**
     * Gets the time window between when the system makes the asyncronous http request for the content and when the last block of data has been read from the http stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadstatistics.timetolastbytereceived
     * @type {IReference<TimeSpan>} 
     */
    TimeToLastByteReceived {
        get => this.get_TimeToLastByteReceived()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ContentBytesReceivedCount() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadStatistics")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadStatistics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadStatistics := IAdaptiveMediaSourceDownloadStatistics(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadStatistics.get_ContentBytesReceivedCount()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_TimeToHeadersReceived() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadStatistics")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadStatistics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadStatistics := IAdaptiveMediaSourceDownloadStatistics(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadStatistics.get_TimeToHeadersReceived()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_TimeToFirstByteReceived() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadStatistics")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadStatistics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadStatistics := IAdaptiveMediaSourceDownloadStatistics(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadStatistics.get_TimeToFirstByteReceived()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_TimeToLastByteReceived() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadStatistics")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadStatistics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadStatistics := IAdaptiveMediaSourceDownloadStatistics(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadStatistics.get_TimeToLastByteReceived()
    }

;@endregion Instance Methods
}
