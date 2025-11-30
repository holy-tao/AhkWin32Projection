#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSEVENT_CONNECTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_CONNECTION_POSITIONUPDATE => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_CONNECTION_DATADISCONTINUITY => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_CONNECTION_TIMEDISCONTINUITY => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_CONNECTION_PRIORITY => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_CONNECTION_ENDOFSTREAM => 4
}
