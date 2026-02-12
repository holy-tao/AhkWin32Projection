#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITimedMetadataPresentationModeChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [MediaPlaybackTimedMetadataTrackList.PresentationModeChanged](mediaplaybacktimedmetadatatracklist_presentationmodechanged.md) event.
 * @remarks
 * Get an instance of this class by handling the [MediaPlaybackTimedMetadataTrackList.PresentationModeChanged](mediaplaybacktimedmetadatatracklist_presentationmodechanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.timedmetadatapresentationmodechangedeventargs
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class TimedMetadataPresentationModeChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITimedMetadataPresentationModeChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITimedMetadataPresentationModeChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [TimedMetadataTrack](timedmetadatatrackpresentationmode.md) associated with the presentation mode change.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.timedmetadatapresentationmodechangedeventargs.track
     * @type {TimedMetadataTrack} 
     */
    Track {
        get => this.get_Track()
    }

    /**
     * Gets the old presentation mode.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.timedmetadatapresentationmodechangedeventargs.oldpresentationmode
     * @type {Integer} 
     */
    OldPresentationMode {
        get => this.get_OldPresentationMode()
    }

    /**
     * Gets the new presentation mode.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.timedmetadatapresentationmodechangedeventargs.newpresentationmode
     * @type {Integer} 
     */
    NewPresentationMode {
        get => this.get_NewPresentationMode()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimedMetadataTrack} 
     */
    get_Track() {
        if (!this.HasProp("__ITimedMetadataPresentationModeChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITimedMetadataPresentationModeChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedMetadataPresentationModeChangedEventArgs := ITimedMetadataPresentationModeChangedEventArgs(outPtr)
        }

        return this.__ITimedMetadataPresentationModeChangedEventArgs.get_Track()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OldPresentationMode() {
        if (!this.HasProp("__ITimedMetadataPresentationModeChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITimedMetadataPresentationModeChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedMetadataPresentationModeChangedEventArgs := ITimedMetadataPresentationModeChangedEventArgs(outPtr)
        }

        return this.__ITimedMetadataPresentationModeChangedEventArgs.get_OldPresentationMode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NewPresentationMode() {
        if (!this.HasProp("__ITimedMetadataPresentationModeChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITimedMetadataPresentationModeChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedMetadataPresentationModeChangedEventArgs := ITimedMetadataPresentationModeChangedEventArgs(outPtr)
        }

        return this.__ITimedMetadataPresentationModeChangedEventArgs.get_NewPresentationMode()
    }

;@endregion Instance Methods
}
