#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITimedMetadataTrackError.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about an error that occurred with a timed metadata track.
 * @remarks
 * Get an instance of this class by accessing the [TimedMetadataTrackFailedEventArgs.Error](timedmetadatatrackfailedeventargs_error.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatatrackerror
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedMetadataTrackError extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITimedMetadataTrackError

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITimedMetadataTrackError.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the error code associated with the timed metadata track error.
     * @remarks
     * This value provides high-level information about the error that occurred with the timed metadata track.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatatrackerror.errorcode
     * @type {Integer} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
    }

    /**
     * Gets the extended error code for the [TimedMetadataTrackError](timedmetadatatrackerror.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatatrackerror.extendederror
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
    get_ErrorCode() {
        if (!this.HasProp("__ITimedMetadataTrackError")) {
            if ((queryResult := this.QueryInterface(ITimedMetadataTrackError.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedMetadataTrackError := ITimedMetadataTrackError(outPtr)
        }

        return this.__ITimedMetadataTrackError.get_ErrorCode()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__ITimedMetadataTrackError")) {
            if ((queryResult := this.QueryInterface(ITimedMetadataTrackError.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedMetadataTrackError := ITimedMetadataTrackError(outPtr)
        }

        return this.__ITimedMetadataTrackError.get_ExtendedError()
    }

;@endregion Instance Methods
}
