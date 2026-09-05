#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_SEEKING_CAPABILITIES extends Win32Enum {

    /**
     * Native name: KS_SEEKING_CanSeekAbsolute
     * @type {Integer (Int32)}
     */
    static CanSeekAbsolute => 1

    /**
     * Native name: KS_SEEKING_CanSeekForwards
     * @type {Integer (Int32)}
     */
    static CanSeekForwards => 2

    /**
     * Native name: KS_SEEKING_CanSeekBackwards
     * @type {Integer (Int32)}
     */
    static CanSeekBackwards => 4

    /**
     * Native name: KS_SEEKING_CanGetCurrentPos
     * @type {Integer (Int32)}
     */
    static CanGetCurrentPos => 8

    /**
     * Native name: KS_SEEKING_CanGetStopPos
     * @type {Integer (Int32)}
     */
    static CanGetStopPos => 16

    /**
     * Native name: KS_SEEKING_CanGetDuration
     * @type {Integer (Int32)}
     */
    static CanGetDuration => 32

    /**
     * Native name: KS_SEEKING_CanPlayBackwards
     * @type {Integer (Int32)}
     */
    static CanPlayBackwards => 64
}
