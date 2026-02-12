#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaCueEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [TimedMetadataTrack.CueEntered](timedmetadatatrack_cueentered.md) and [TimedMetadataTrack.CueExited](timedmetadatatrack_cueexited.md) events.
 * @remarks
 * Get an instance of this class by handling the [TimedMetadataTrack.CueEntered](timedmetadatatrack_cueentered.md) or [TimedMetadataTrack.CueExited](timedmetadatatrack_cueexited.md) events.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediacueeventargs
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaCueEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaCueEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaCueEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the cue that triggered the event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediacueeventargs.cue
     * @type {IMediaCue} 
     */
    Cue {
        get => this.get_Cue()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IMediaCue} 
     */
    get_Cue() {
        if (!this.HasProp("__IMediaCueEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaCueEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCueEventArgs := IMediaCueEventArgs(outPtr)
        }

        return this.__IMediaCueEventArgs.get_Cue()
    }

;@endregion Instance Methods
}
