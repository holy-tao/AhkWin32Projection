#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITimedTextSourceResolveResultEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [TimedTextSource.Resolved](timedtextsource_resolved.md) event.
 * @remarks
 * Get an instance of this class by handling the [TimedTextSource.Resolved](timedtextsource_resolved.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextsourceresolveresulteventargs
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedTextSourceResolveResultEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITimedTextSourceResolveResultEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITimedTextSourceResolveResultEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an object representing the asynchronous error that occurred when the [TimedTextSource](timedtextsource.md) was resolved.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextsourceresolveresulteventargs.error
     * @type {TimedMetadataTrackError} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * Gets the list of [TimedMetadataTrack](timedmetadatatrack.md) objects resulting from resolving the [TimedTextSource](timedtextsource.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextsourceresolveresulteventargs.tracks
     * @type {IVectorView<TimedMetadataTrack>} 
     */
    Tracks {
        get => this.get_Tracks()
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
        if (!this.HasProp("__ITimedTextSourceResolveResultEventArgs")) {
            if ((queryResult := this.QueryInterface(ITimedTextSourceResolveResultEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextSourceResolveResultEventArgs := ITimedTextSourceResolveResultEventArgs(outPtr)
        }

        return this.__ITimedTextSourceResolveResultEventArgs.get_Error()
    }

    /**
     * 
     * @returns {IVectorView<TimedMetadataTrack>} 
     */
    get_Tracks() {
        if (!this.HasProp("__ITimedTextSourceResolveResultEventArgs")) {
            if ((queryResult := this.QueryInterface(ITimedTextSourceResolveResultEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextSourceResolveResultEventArgs := ITimedTextSourceResolveResultEventArgs(outPtr)
        }

        return this.__ITimedTextSourceResolveResultEventArgs.get_Tracks()
    }

;@endregion Instance Methods
}
