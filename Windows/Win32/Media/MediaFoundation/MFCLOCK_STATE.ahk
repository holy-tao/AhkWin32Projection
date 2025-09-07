#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the state of a clock.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfclock_state
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFCLOCK_STATE{

    /**
     * The clock is invalid. A clock might be invalid for several reasons. Some clocks return this state before the first start. This state can also occur if the underlying device is lost.
     * @type {Integer (Int32)}
     */
    static MFCLOCK_STATE_INVALID => 0

    /**
     * The clock is running. While the clock is running, the time advances at the clock's frequency and current rate.
     * @type {Integer (Int32)}
     */
    static MFCLOCK_STATE_RUNNING => 1

    /**
     * The clock is stopped. While stopped, the clock reports a time of 0.
     * @type {Integer (Int32)}
     */
    static MFCLOCK_STATE_STOPPED => 2

    /**
     * The clock is paused. While paused, the clock reports the time it was paused.
     * @type {Integer (Int32)}
     */
    static MFCLOCK_STATE_PAUSED => 3
}
