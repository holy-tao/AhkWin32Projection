#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSSTATE extends Win32Enum {

    /**
     * Native name: KSSTATE_STOP
     * @type {Integer (Int32)}
     */
    static STOP => 0

    /**
     * Native name: KSSTATE_ACQUIRE
     * @type {Integer (Int32)}
     */
    static ACQUIRE => 1

    /**
     * Native name: KSSTATE_PAUSE
     * @type {Integer (Int32)}
     */
    static PAUSE => 2

    /**
     * Native name: KSSTATE_RUN
     * @type {Integer (Int32)}
     */
    static RUN => 3
}
