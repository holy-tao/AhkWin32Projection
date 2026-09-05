#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class TELEPHONY_CALLSTATE extends Win32Enum {

    /**
     * Native name: TELEPHONY_CALLSTATE_DISABLED
     * @type {Integer (Int32)}
     */
    static DISABLED => 0

    /**
     * Native name: TELEPHONY_CALLSTATE_ENABLED
     * @type {Integer (Int32)}
     */
    static ENABLED => 1

    /**
     * Native name: TELEPHONY_CALLSTATE_HOLD
     * @type {Integer (Int32)}
     */
    static HOLD => 2

    /**
     * Native name: TELEPHONY_CALLSTATE_PROVIDERTRANSITION
     * @type {Integer (Int32)}
     */
    static PROVIDERTRANSITION => 3
}
