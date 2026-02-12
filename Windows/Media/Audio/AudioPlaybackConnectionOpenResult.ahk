#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioPlaybackConnectionOpenResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * The value returned from a call to [Open](audioplaybackconnection_open_389234318.md) or [OpenAsync](audioplaybackconnection_openasync_171309613.md) that indicates whether the call was successful and, if not, provides an extended error code.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioplaybackconnectionopenresult
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioPlaybackConnectionOpenResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioPlaybackConnectionOpenResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioPlaybackConnectionOpenResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether the call to call to [Open](audioplaybackconnection_open_389234318.md) or [OpenAsync](audioplaybackconnection_openasync_171309613.md) was successful.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioplaybackconnectionopenresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the extended error code returned from a call to [Open](audioplaybackconnection_open_389234318.md) or [OpenAsync](audioplaybackconnection_openasync_171309613.md).
     * @remarks
     * The [Status](audioplaybackconnectionopenresult_status.md) property indicates whether the call was successful.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioplaybackconnectionopenresult.extendederror
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
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IAudioPlaybackConnectionOpenResult")) {
            if ((queryResult := this.QueryInterface(IAudioPlaybackConnectionOpenResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioPlaybackConnectionOpenResult := IAudioPlaybackConnectionOpenResult(outPtr)
        }

        return this.__IAudioPlaybackConnectionOpenResult.get_Status()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IAudioPlaybackConnectionOpenResult")) {
            if ((queryResult := this.QueryInterface(IAudioPlaybackConnectionOpenResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioPlaybackConnectionOpenResult := IAudioPlaybackConnectionOpenResult(outPtr)
        }

        return this.__IAudioPlaybackConnectionOpenResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
