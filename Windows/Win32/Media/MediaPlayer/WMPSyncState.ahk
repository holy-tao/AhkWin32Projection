#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WMPSyncState enumeration type defines the possible operational states of Windows Media Player as it synchronizes digital media to a device. To use this enumeration you must create a remoted instance of the Windows Media Player 10 or later control.
 * @remarks
 * Windows Media Player 10 Mobile: This enumeration is not supported.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/ne-wmp-wmpsyncstate
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class WMPSyncState{

    /**
     * Synchronization state is unknown.
     * @type {Integer (Int32)}
     */
    static wmpssUnknown => 0

    /**
     * Windows Media Player is synchronizing the device.
     * @type {Integer (Int32)}
     */
    static wmpssSynchronizing => 1

    /**
     * Synchronization has stopped.
     * @type {Integer (Int32)}
     */
    static wmpssStopped => 2

    /**
     * An estimation of synchronization size is in progress. Requires Windows Media Player 12.
     * @type {Integer (Int32)}
     */
    static wmpssEstimating => 3

    /**
     * Last enumerated value. Not a valid state.
     * @type {Integer (Int32)}
     */
    static wmpssLast => 4
}
