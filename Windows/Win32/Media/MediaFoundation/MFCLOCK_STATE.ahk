#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfclock_state
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFCLOCK_STATE{

    /**
     * @type {Integer (Int32)}
     */
    static MFCLOCK_STATE_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static MFCLOCK_STATE_RUNNING => 1

    /**
     * @type {Integer (Int32)}
     */
    static MFCLOCK_STATE_STOPPED => 2

    /**
     * @type {Integer (Int32)}
     */
    static MFCLOCK_STATE_PAUSED => 3
}
