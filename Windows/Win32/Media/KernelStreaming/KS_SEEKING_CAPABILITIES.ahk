#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_SEEKING_CAPABILITIES{

    /**
     * @type {Integer (Int32)}
     */
    static KS_SEEKING_CanSeekAbsolute => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_SEEKING_CanSeekForwards => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_SEEKING_CanSeekBackwards => 4

    /**
     * @type {Integer (Int32)}
     */
    static KS_SEEKING_CanGetCurrentPos => 8

    /**
     * @type {Integer (Int32)}
     */
    static KS_SEEKING_CanGetStopPos => 16

    /**
     * @type {Integer (Int32)}
     */
    static KS_SEEKING_CanGetDuration => 32

    /**
     * @type {Integer (Int32)}
     */
    static KS_SEEKING_CanPlayBackwards => 64
}
