#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAdaptiveMediaSourceDiagnosticAvailableEventArgs.ahk
#Include .\IAdaptiveMediaSourceDiagnosticAvailableEventArgs2.ahk
#Include .\IAdaptiveMediaSourceDiagnosticAvailableEventArgs3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [DiagnosticAvailable](adaptivemediasourcediagnostics_diagnosticavailable.md) event which is raised when diagnostic information for the adaptive media source becomes available.
 * @remarks
 * The information provided by this event is not intended to be used to modify runtime behavior, but is instead provided for telemetry collection.
 * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcediagnosticavailableeventargs
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class AdaptiveMediaSourceDiagnosticAvailableEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAdaptiveMediaSourceDiagnosticAvailableEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAdaptiveMediaSourceDiagnosticAvailableEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating the type of diagnostic that is associated with the event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcediagnosticavailableeventargs.diagnostictype
     * @type {Integer} 
     */
    DiagnosticType {
        get => this.get_DiagnosticType()
    }

    /**
     * Gets a locally-unique identifier for the web request associated with the event.
     * @remarks
     * This value can be used to correlate the web request associated with this event to other events, including [DownloadRequested](adaptivemediasource_downloadrequested.md), [DownloadCompleted](adaptivemediasource_downloadcompleted.md), and  [DownloadFailed](adaptivemediasource_downloadfailed.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcediagnosticavailableeventargs.requestid
     * @type {IReference<Integer>} 
     */
    RequestId {
        get => this.get_RequestId()
    }

    /**
     * Gets the presentation playback position associated with the event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcediagnosticavailableeventargs.position
     * @type {IReference<TimeSpan>} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets the segment ID of the media segment to which the diagnostic information applies.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcediagnosticavailableeventargs.segmentid
     * @type {IReference<Integer>} 
     */
    SegmentId {
        get => this.get_SegmentId()
    }

    /**
     * Gets the resource type of the web request to which the diagnostic information applies.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcediagnosticavailableeventargs.resourcetype
     * @type {IReference<Integer>} 
     */
    ResourceType {
        get => this.get_ResourceType()
    }

    /**
     * Gets the resource URI of the web request to which the diagnostic information applies.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcediagnosticavailableeventargs.resourceuri
     * @type {Uri} 
     */
    ResourceUri {
        get => this.get_ResourceUri()
    }

    /**
     * Gets the resource byte range offset of the web request to which the diagnostic information applies.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcediagnosticavailableeventargs.resourcebyterangeoffset
     * @type {IReference<Integer>} 
     */
    ResourceByteRangeOffset {
        get => this.get_ResourceByteRangeOffset()
    }

    /**
     * Gets the resource byte range length of the web request to which the diagnostic information applies.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcediagnosticavailableeventargs.resourcebyterangelength
     * @type {IReference<Integer>} 
     */
    ResourceByteRangeLength {
        get => this.get_ResourceByteRangeLength()
    }

    /**
     * Gets the bitrate of the web request to which the diagnostic information applies.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcediagnosticavailableeventargs.bitrate
     * @type {IReference<Integer>} 
     */
    Bitrate {
        get => this.get_Bitrate()
    }

    /**
     * Gets the extended error code associated with the event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcediagnosticavailableeventargs.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * Gets a [TimeSpan](../windows.foundation/timespan.md) representing the duration of the resource associated with the event.
     * @remarks
     * This value only applies to content with a [ResourceType](adaptivemediasourcediagnosticavailableeventargs_resourcetype.md) of **MediaSegment** and is optional. The property will be set if the value is found in the DASH manifest.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcediagnosticavailableeventargs.resourceduration
     * @type {IReference<TimeSpan>} 
     */
    ResourceDuration {
        get => this.get_ResourceDuration()
    }

    /**
     * Gets a string representing the content type associated with the event.
     * @remarks
     * This value is optional. The property will be set if the value is found in the DASH manifest. For content with a [ResourceType](adaptivemediasourcediagnosticavailableeventargs_resourcetype.md) of **MediaSegment**, the property value is set using the DASH manifest’s *AdaptationSet@mimeType* attribute.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcediagnosticavailableeventargs.resourcecontenttype
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
    get_DiagnosticType() {
        if (!this.HasProp("__IAdaptiveMediaSourceDiagnosticAvailableEventArgs")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDiagnosticAvailableEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDiagnosticAvailableEventArgs := IAdaptiveMediaSourceDiagnosticAvailableEventArgs(outPtr)
        }

        return this.__IAdaptiveMediaSourceDiagnosticAvailableEventArgs.get_DiagnosticType()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_RequestId() {
        if (!this.HasProp("__IAdaptiveMediaSourceDiagnosticAvailableEventArgs")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDiagnosticAvailableEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDiagnosticAvailableEventArgs := IAdaptiveMediaSourceDiagnosticAvailableEventArgs(outPtr)
        }

        return this.__IAdaptiveMediaSourceDiagnosticAvailableEventArgs.get_RequestId()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Position() {
        if (!this.HasProp("__IAdaptiveMediaSourceDiagnosticAvailableEventArgs")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDiagnosticAvailableEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDiagnosticAvailableEventArgs := IAdaptiveMediaSourceDiagnosticAvailableEventArgs(outPtr)
        }

        return this.__IAdaptiveMediaSourceDiagnosticAvailableEventArgs.get_Position()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_SegmentId() {
        if (!this.HasProp("__IAdaptiveMediaSourceDiagnosticAvailableEventArgs")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDiagnosticAvailableEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDiagnosticAvailableEventArgs := IAdaptiveMediaSourceDiagnosticAvailableEventArgs(outPtr)
        }

        return this.__IAdaptiveMediaSourceDiagnosticAvailableEventArgs.get_SegmentId()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ResourceType() {
        if (!this.HasProp("__IAdaptiveMediaSourceDiagnosticAvailableEventArgs")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDiagnosticAvailableEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDiagnosticAvailableEventArgs := IAdaptiveMediaSourceDiagnosticAvailableEventArgs(outPtr)
        }

        return this.__IAdaptiveMediaSourceDiagnosticAvailableEventArgs.get_ResourceType()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ResourceUri() {
        if (!this.HasProp("__IAdaptiveMediaSourceDiagnosticAvailableEventArgs")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDiagnosticAvailableEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDiagnosticAvailableEventArgs := IAdaptiveMediaSourceDiagnosticAvailableEventArgs(outPtr)
        }

        return this.__IAdaptiveMediaSourceDiagnosticAvailableEventArgs.get_ResourceUri()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ResourceByteRangeOffset() {
        if (!this.HasProp("__IAdaptiveMediaSourceDiagnosticAvailableEventArgs")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDiagnosticAvailableEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDiagnosticAvailableEventArgs := IAdaptiveMediaSourceDiagnosticAvailableEventArgs(outPtr)
        }

        return this.__IAdaptiveMediaSourceDiagnosticAvailableEventArgs.get_ResourceByteRangeOffset()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ResourceByteRangeLength() {
        if (!this.HasProp("__IAdaptiveMediaSourceDiagnosticAvailableEventArgs")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDiagnosticAvailableEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDiagnosticAvailableEventArgs := IAdaptiveMediaSourceDiagnosticAvailableEventArgs(outPtr)
        }

        return this.__IAdaptiveMediaSourceDiagnosticAvailableEventArgs.get_ResourceByteRangeLength()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Bitrate() {
        if (!this.HasProp("__IAdaptiveMediaSourceDiagnosticAvailableEventArgs")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDiagnosticAvailableEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDiagnosticAvailableEventArgs := IAdaptiveMediaSourceDiagnosticAvailableEventArgs(outPtr)
        }

        return this.__IAdaptiveMediaSourceDiagnosticAvailableEventArgs.get_Bitrate()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IAdaptiveMediaSourceDiagnosticAvailableEventArgs2")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDiagnosticAvailableEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDiagnosticAvailableEventArgs2 := IAdaptiveMediaSourceDiagnosticAvailableEventArgs2(outPtr)
        }

        return this.__IAdaptiveMediaSourceDiagnosticAvailableEventArgs2.get_ExtendedError()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_ResourceDuration() {
        if (!this.HasProp("__IAdaptiveMediaSourceDiagnosticAvailableEventArgs3")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDiagnosticAvailableEventArgs3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDiagnosticAvailableEventArgs3 := IAdaptiveMediaSourceDiagnosticAvailableEventArgs3(outPtr)
        }

        return this.__IAdaptiveMediaSourceDiagnosticAvailableEventArgs3.get_ResourceDuration()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResourceContentType() {
        if (!this.HasProp("__IAdaptiveMediaSourceDiagnosticAvailableEventArgs3")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDiagnosticAvailableEventArgs3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDiagnosticAvailableEventArgs3 := IAdaptiveMediaSourceDiagnosticAvailableEventArgs3(outPtr)
        }

        return this.__IAdaptiveMediaSourceDiagnosticAvailableEventArgs3.get_ResourceContentType()
    }

;@endregion Instance Methods
}
