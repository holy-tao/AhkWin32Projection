#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITimedMetadataTrackFailedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [TimedMetadataTrack.TrackFailed](timedmetadatatrack_trackfailed.md) event.
 * @remarks
 * Get an instance of this class by handling the [TimedMetadataTrack.TrackFailed](timedmetadatatrack_trackfailed.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatatrackfailedeventargs
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedMetadataTrackFailedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITimedMetadataTrackFailedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITimedMetadataTrackFailedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an object representing the error that occurred with the timed metadata track.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatatrackfailedeventargs.error
     * @type {TimedMetadataTrackError} 
     */
    Error {
        get => this.get_Error()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimedMetadataTrackError} 
     */
    get_Error() {
        if (!this.HasProp("__ITimedMetadataTrackFailedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITimedMetadataTrackFailedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedMetadataTrackFailedEventArgs := ITimedMetadataTrackFailedEventArgs(outPtr)
        }

        return this.__ITimedMetadataTrackFailedEventArgs.get_Error()
    }

;@endregion Instance Methods
}
