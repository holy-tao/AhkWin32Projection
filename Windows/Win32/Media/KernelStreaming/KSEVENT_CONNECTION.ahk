#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSEVENT_CONNECTION extends Win32Enum {

    /**
     * Native name: KSEVENT_CONNECTION_POSITIONUPDATE
     * @type {Integer (Int32)}
     */
    static POSITIONUPDATE => 0

    /**
     * Native name: KSEVENT_CONNECTION_DATADISCONTINUITY
     * @type {Integer (Int32)}
     */
    static DATADISCONTINUITY => 1

    /**
     * Native name: KSEVENT_CONNECTION_TIMEDISCONTINUITY
     * @type {Integer (Int32)}
     */
    static TIMEDISCONTINUITY => 2

    /**
     * Native name: KSEVENT_CONNECTION_PRIORITY
     * @type {Integer (Int32)}
     */
    static PRIORITY => 3

    /**
     * Native name: KSEVENT_CONNECTION_ENDOFSTREAM
     * @type {Integer (Int32)}
     */
    static ENDOFSTREAM => 4
}
