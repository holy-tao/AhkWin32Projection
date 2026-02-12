#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVideoTrackOpenFailedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [OpenFailed](videotrack_openfailed.md) event of a [VideoTrack](videotrack.md).
 * @remarks
 * Get an instance of this class by handling the [OpenFailed](videotrack_openfailed.md) event of a [VideoTrack](videotrack.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.videotrackopenfailedeventargs
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class VideoTrackOpenFailedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVideoTrackOpenFailedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVideoTrackOpenFailedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the extended error code for an error that occurs when opening a [VideoTrack](videotrack.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.videotrackopenfailedeventargs.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IVideoTrackOpenFailedEventArgs")) {
            if ((queryResult := this.QueryInterface(IVideoTrackOpenFailedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTrackOpenFailedEventArgs := IVideoTrackOpenFailedEventArgs(outPtr)
        }

        return this.__IVideoTrackOpenFailedEventArgs.get_ExtendedError()
    }

;@endregion Instance Methods
}
