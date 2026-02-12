#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAdaptiveMediaSourceCorrelatedTimes.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents time stamps that are correlated between the playback position of the media player with time stamps embedded in the media stream or included in the manifest file.
 * @remarks
 * Get an instance of this class by calling [AdaptiveMediaSource.GetCorrelatedTimes](adaptivemediasource_getcorrelatedtimes_1896702992.md). Depending on the current state of the system and the media, any of these three values may be null at any given time.
 * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcecorrelatedtimes
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class AdaptiveMediaSourceCorrelatedTimes extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAdaptiveMediaSourceCorrelatedTimes

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAdaptiveMediaSourceCorrelatedTimes.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a timespan representing the current playback position of the media player that is playing the content.
     * @remarks
     * The position value is a snapshot made when [AdaptiveMediaSource.GetCorrelatedTimes](adaptivemediasource_getcorrelatedtimes_1896702992.md) is called. So if the presentation clock is advancing, the value of this property may be slightly offset from the current presentation time.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcecorrelatedtimes.position
     * @type {IReference<TimeSpan>} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets a timespan representing the presentation timestamp embedded in the streaming media.
     * @remarks
     * This property will be null before the system has begun downloading media segments.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcecorrelatedtimes.presentationtimestamp
     * @type {IReference<TimeSpan>} 
     */
    PresentationTimeStamp {
        get => this.get_PresentationTimeStamp()
    }

    /**
     * Gets a [DateTime](/uwp/api/windows.foundation.datetime) structure representing a time specified in the manifest file for the streaming media.
     * @remarks
     * For Http Live Streaming (HLS), this value is only present if the playlist contains the EXT-X-PROGRAM-DATE-TIME tags.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcecorrelatedtimes.programdatetime
     * @type {IReference<DateTime>} 
     */
    ProgramDateTime {
        get => this.get_ProgramDateTime()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Position() {
        if (!this.HasProp("__IAdaptiveMediaSourceCorrelatedTimes")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceCorrelatedTimes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceCorrelatedTimes := IAdaptiveMediaSourceCorrelatedTimes(outPtr)
        }

        return this.__IAdaptiveMediaSourceCorrelatedTimes.get_Position()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_PresentationTimeStamp() {
        if (!this.HasProp("__IAdaptiveMediaSourceCorrelatedTimes")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceCorrelatedTimes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceCorrelatedTimes := IAdaptiveMediaSourceCorrelatedTimes(outPtr)
        }

        return this.__IAdaptiveMediaSourceCorrelatedTimes.get_PresentationTimeStamp()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ProgramDateTime() {
        if (!this.HasProp("__IAdaptiveMediaSourceCorrelatedTimes")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceCorrelatedTimes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceCorrelatedTimes := IAdaptiveMediaSourceCorrelatedTimes(outPtr)
        }

        return this.__IAdaptiveMediaSourceCorrelatedTimes.get_ProgramDateTime()
    }

;@endregion Instance Methods
}
