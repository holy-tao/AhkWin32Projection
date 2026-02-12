#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioTrackOpenFailedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [OpenFailed](audiotrack_openfailed.md) event of an [AudioTrack](audiotrack.md).
 * @remarks
 * Get an instance of this class by handling the [OpenFailed](audiotrack_openfailed.md) event of an [AudioTrack](audiotrack.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiotrackopenfailedeventargs
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class AudioTrackOpenFailedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioTrackOpenFailedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioTrackOpenFailedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the extended error code for an error that occurs when opening an [AudioTrack](audiotrack.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiotrackopenfailedeventargs.extendederror
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
        if (!this.HasProp("__IAudioTrackOpenFailedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAudioTrackOpenFailedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioTrackOpenFailedEventArgs := IAudioTrackOpenFailedEventArgs(outPtr)
        }

        return this.__IAudioTrackOpenFailedEventArgs.get_ExtendedError()
    }

;@endregion Instance Methods
}
