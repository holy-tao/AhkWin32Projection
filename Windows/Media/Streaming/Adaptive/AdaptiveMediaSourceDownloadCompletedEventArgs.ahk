#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAdaptiveMediaSourceDownloadCompletedEventArgs.ahk
#Include .\IAdaptiveMediaSourceDownloadCompletedEventArgs2.ahk
#Include .\IAdaptiveMediaSourceDownloadCompletedEventArgs3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [DownloadCompleted](adaptivemediasource_downloadcompleted.md) event.
 * @remarks
 * Obtain an instance of this class by implementing a handler for the [DownloadCompleted](adaptivemediasource_downloadcompleted.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadcompletedeventargs
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class AdaptiveMediaSourceDownloadCompletedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAdaptiveMediaSourceDownloadCompletedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAdaptiveMediaSourceDownloadCompletedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the resource type of the completed media download request.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadcompletedeventargs.resourcetype
     * @type {Integer} 
     */
    ResourceType {
        get => this.get_ResourceType()
    }

    /**
     * Gets the resource URI of the completed media download request.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadcompletedeventargs.resourceuri
     * @type {Uri} 
     */
    ResourceUri {
        get => this.get_ResourceUri()
    }

    /**
     * Gets the byte range offset of the completed media download request.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadcompletedeventargs.resourcebyterangeoffset
     * @type {IReference<Integer>} 
     */
    ResourceByteRangeOffset {
        get => this.get_ResourceByteRangeOffset()
    }

    /**
     * Gets the byte range length of the completed media download request.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadcompletedeventargs.resourcebyterangelength
     * @type {IReference<Integer>} 
     */
    ResourceByteRangeLength {
        get => this.get_ResourceByteRangeLength()
    }

    /**
     * Gets the http response message, if any, returned from the completed media download request.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadcompletedeventargs.httpresponsemessage
     * @type {HttpResponseMessage} 
     */
    HttpResponseMessage {
        get => this.get_HttpResponseMessage()
    }

    /**
     * Gets a locally-unique identifier for the web request associated with the event.
     * @remarks
     * This value can be used to correlate the web request associated with this event to other events, including [DownloadRequested](adaptivemediasource_downloadrequested.md), [DownloadFailed](adaptivemediasource_downloadfailed.md), and [DiagnosticAvailable](adaptivemediasourcediagnostics_diagnosticavailable.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadcompletedeventargs.requestid
     * @type {Integer} 
     */
    RequestId {
        get => this.get_RequestId()
    }

    /**
     * Gets an object that provides download statistics associated with the event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadcompletedeventargs.statistics
     * @type {AdaptiveMediaSourceDownloadStatistics} 
     */
    Statistics {
        get => this.get_Statistics()
    }

    /**
     * Gets a time span representing the position within the timeline of the media segment to which the event applies.
     * @remarks
     * Because this event occurs when content is buffering, the position of the event in the timeline may be up to several minutes ahead of the current playback position.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadcompletedeventargs.position
     * @type {IReference<TimeSpan>} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets a [TimeSpan](../windows.foundation/timespan.md) representing the duration of the resource associated with the event.
     * @remarks
     * This value only applies to content with a [ResourceType](adaptivemediasourcedownloadcompletedeventargs_resourcetype.md) of **MediaSegment** and is optional. The property will be set if the value is found in the DASH manifest.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadcompletedeventargs.resourceduration
     * @type {IReference<TimeSpan>} 
     */
    ResourceDuration {
        get => this.get_ResourceDuration()
    }

    /**
     * Gets a string representing the content type associated with the event.
     * @remarks
     * This value is optional. The property will be set if the value is found in the DASH manifest. For content with a [ResourceType](adaptivemediasourcedownloadcompletedeventargs_resourcetype.md) of **MediaSegment**, the property value is set using the DASH manifest’s *AdaptationSet@mimeType* attribute.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadcompletedeventargs.resourcecontenttype
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
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadCompletedEventArgs := IAdaptiveMediaSourceDownloadCompletedEventArgs(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadCompletedEventArgs.get_ResourceType()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ResourceUri() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadCompletedEventArgs := IAdaptiveMediaSourceDownloadCompletedEventArgs(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadCompletedEventArgs.get_ResourceUri()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ResourceByteRangeOffset() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadCompletedEventArgs := IAdaptiveMediaSourceDownloadCompletedEventArgs(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadCompletedEventArgs.get_ResourceByteRangeOffset()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ResourceByteRangeLength() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadCompletedEventArgs := IAdaptiveMediaSourceDownloadCompletedEventArgs(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadCompletedEventArgs.get_ResourceByteRangeLength()
    }

    /**
     * 
     * @returns {HttpResponseMessage} 
     */
    get_HttpResponseMessage() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadCompletedEventArgs := IAdaptiveMediaSourceDownloadCompletedEventArgs(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadCompletedEventArgs.get_HttpResponseMessage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequestId() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadCompletedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadCompletedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadCompletedEventArgs2 := IAdaptiveMediaSourceDownloadCompletedEventArgs2(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadCompletedEventArgs2.get_RequestId()
    }

    /**
     * 
     * @returns {AdaptiveMediaSourceDownloadStatistics} 
     */
    get_Statistics() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadCompletedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadCompletedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadCompletedEventArgs2 := IAdaptiveMediaSourceDownloadCompletedEventArgs2(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadCompletedEventArgs2.get_Statistics()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Position() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadCompletedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadCompletedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadCompletedEventArgs2 := IAdaptiveMediaSourceDownloadCompletedEventArgs2(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadCompletedEventArgs2.get_Position()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_ResourceDuration() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadCompletedEventArgs3")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadCompletedEventArgs3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadCompletedEventArgs3 := IAdaptiveMediaSourceDownloadCompletedEventArgs3(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadCompletedEventArgs3.get_ResourceDuration()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResourceContentType() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadCompletedEventArgs3")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadCompletedEventArgs3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadCompletedEventArgs3 := IAdaptiveMediaSourceDownloadCompletedEventArgs3(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadCompletedEventArgs3.get_ResourceContentType()
    }

;@endregion Instance Methods
}
