#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAdaptiveMediaSourceDownloadRequestedEventArgs.ahk
#Include .\IAdaptiveMediaSourceDownloadRequestedEventArgs2.ahk
#Include .\IAdaptiveMediaSourceDownloadRequestedEventArgs3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [DownloadRequested](adaptivemediasource_downloadrequested.md) event.
 * @remarks
 * Obtain an instance of this class by implementing a handler for the [DownloadRequested](adaptivemediasource_downloadrequested.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadrequestedeventargs
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class AdaptiveMediaSourceDownloadRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAdaptiveMediaSourceDownloadRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAdaptiveMediaSourceDownloadRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the resource type of the media download request.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadrequestedeventargs.resourcetype
     * @type {Integer} 
     */
    ResourceType {
        get => this.get_ResourceType()
    }

    /**
     * Gets the resource URI of the media download request.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadrequestedeventargs.resourceuri
     * @type {Uri} 
     */
    ResourceUri {
        get => this.get_ResourceUri()
    }

    /**
     * Gets the byte range offset of the media download request.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadrequestedeventargs.resourcebyterangeoffset
     * @type {IReference<Integer>} 
     */
    ResourceByteRangeOffset {
        get => this.get_ResourceByteRangeOffset()
    }

    /**
     * Gets the byte range length of the media download request.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadrequestedeventargs.resourcebyterangelength
     * @type {IReference<Integer>} 
     */
    ResourceByteRangeLength {
        get => this.get_ResourceByteRangeLength()
    }

    /**
     * Gets an [AdaptiveMediaSourceDownloadResult](adaptivemediasourcedownloadresult.md) object representing the result of the media download request.
     * @remarks
     * Apps that manually perform the download of resources can set the properties of the returned [AdaptiveMediaSourceDownloadResult](adaptivemediasourcedownloadresult.md) object to provide the stream and content type of the downloaded resource to the [AdaptiveMediaSource](adaptivemediasource.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadrequestedeventargs.result
     * @type {AdaptiveMediaSourceDownloadResult} 
     */
    Result {
        get => this.get_Result()
    }

    /**
     * Gets a locally-unique identifier for the web request associated with the event.
     * @remarks
     * This value can be used to correlate the web request associated with this event to other events, including [DownloadFailed](adaptivemediasource_downloadfailed.md), [DownloadCompleted](adaptivemediasource_downloadcompleted.md), and [DiagnosticAvailable](adaptivemediasourcediagnostics_diagnosticavailable.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadrequestedeventargs.requestid
     * @type {Integer} 
     */
    RequestId {
        get => this.get_RequestId()
    }

    /**
     * Gets a time span representing the position within the timeline of the media segment to which the event applies.
     * @remarks
     * Because this event occurs when content is buffering, the position of the event in the timeline may be up to several minutes ahead of the current playback position.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadrequestedeventargs.position
     * @type {IReference<TimeSpan>} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets a [TimeSpan](../windows.foundation/timespan.md) representing the duration of the resource associated with the event.
     * @remarks
     * This value only applies to content with a [ResourceType](adaptivemediasourcedownloadrequestedeventargs_resourcetype.md) of **MediaSegment** and is optional. The property will be set if the value is found in the DASH manifest.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadrequestedeventargs.resourceduration
     * @type {IReference<TimeSpan>} 
     */
    ResourceDuration {
        get => this.get_ResourceDuration()
    }

    /**
     * Gets a string representing the content type associated with the event.
     * @remarks
     * This value is optional. The property will be set if the value is found in the DASH manifest. For content with a [ResourceType](adaptivemediasourcedownloadrequestedeventargs_resourcetype.md) of **MediaSegment**, the property value is set using the DASH manifest’s *AdaptationSet@mimeType* attribute.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadrequestedeventargs.resourcecontenttype
     * @type {HSTRING} 
     */
    ResourceContentType {
        get => this.get_ResourceContentType()
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
    get_ResourceType() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadRequestedEventArgs := IAdaptiveMediaSourceDownloadRequestedEventArgs(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadRequestedEventArgs.get_ResourceType()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ResourceUri() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadRequestedEventArgs := IAdaptiveMediaSourceDownloadRequestedEventArgs(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadRequestedEventArgs.get_ResourceUri()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ResourceByteRangeOffset() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadRequestedEventArgs := IAdaptiveMediaSourceDownloadRequestedEventArgs(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadRequestedEventArgs.get_ResourceByteRangeOffset()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ResourceByteRangeLength() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadRequestedEventArgs := IAdaptiveMediaSourceDownloadRequestedEventArgs(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadRequestedEventArgs.get_ResourceByteRangeLength()
    }

    /**
     * 
     * @returns {AdaptiveMediaSourceDownloadResult} 
     */
    get_Result() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadRequestedEventArgs := IAdaptiveMediaSourceDownloadRequestedEventArgs(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadRequestedEventArgs.get_Result()
    }

    /**
     * Gets a deferral that can be used to defer the completion of the [DownloadRequested](adaptivemediasource_downloadrequested.md) event so that the app can asynchronously download media content.
     * @returns {AdaptiveMediaSourceDownloadRequestedDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadrequestedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadRequestedEventArgs := IAdaptiveMediaSourceDownloadRequestedEventArgs(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadRequestedEventArgs.GetDeferral()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequestId() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadRequestedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadRequestedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadRequestedEventArgs2 := IAdaptiveMediaSourceDownloadRequestedEventArgs2(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadRequestedEventArgs2.get_RequestId()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Position() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadRequestedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadRequestedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadRequestedEventArgs2 := IAdaptiveMediaSourceDownloadRequestedEventArgs2(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadRequestedEventArgs2.get_Position()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_ResourceDuration() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadRequestedEventArgs3")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadRequestedEventArgs3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadRequestedEventArgs3 := IAdaptiveMediaSourceDownloadRequestedEventArgs3(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadRequestedEventArgs3.get_ResourceDuration()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResourceContentType() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadRequestedEventArgs3")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadRequestedEventArgs3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadRequestedEventArgs3 := IAdaptiveMediaSourceDownloadRequestedEventArgs3(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadRequestedEventArgs3.get_ResourceContentType()
    }

;@endregion Instance Methods
}
