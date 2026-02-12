#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the result status of a call to  [Open](audioplaybackconnection_open_389234318.md) or [OpenAsync](audioplaybackconnection_openasync_171309613.md)
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioplaybackconnectionopenresultstatus
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioPlaybackConnectionOpenResultStatus extends Win32Enum{

    /**
     * The open request was successful.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The request timed out.
     * @type {Integer (Int32)}
     */
    static RequestTimedOut => 1

    /**
     * The open operation was denied by the system.
     * @type {Integer (Int32)}
     */
    static DeniedBySystem => 2

    /**
     * The request failed for an unknown reason. Check the [ExtendedError](audioplaybackconnectionopenresult_extendederror.md) property for more information.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 3
}
