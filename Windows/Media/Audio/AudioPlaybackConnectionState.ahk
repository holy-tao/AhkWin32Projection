#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the connection state of an [AudioPlaybackConnection](audioplaybackconnection.md).
 * @remarks
 * Open a connection by calling [Open](audioplaybackconnection_open_389234318.md) or [OpenAsync](audioplaybackconnection_openasync_171309613.md).
 * 
 * Get the current state of a connection by checking the [State](audioplaybackconnection_state.md) property. Receive notifiations when the connection state changes by implementing a handler for the [StateChanged](audioplaybackconnection_statechanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioplaybackconnectionstate
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioPlaybackConnectionState extends Win32Enum{

    /**
     * The connection is closed.
     * @type {Integer (Int32)}
     */
    static Closed => 0

    /**
     * The connection is open.
     * @type {Integer (Int32)}
     */
    static Opened => 1
}
