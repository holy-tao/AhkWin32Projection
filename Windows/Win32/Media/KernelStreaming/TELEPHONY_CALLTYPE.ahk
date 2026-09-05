#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class TELEPHONY_CALLTYPE extends Win32Enum {

    /**
     * Native name: TELEPHONY_CALLTYPE_CIRCUITSWITCHED
     * @type {Integer (Int32)}
     */
    static CIRCUITSWITCHED => 0

    /**
     * Native name: TELEPHONY_CALLTYPE_PACKETSWITCHED_LTE
     * @type {Integer (Int32)}
     */
    static PACKETSWITCHED_LTE => 1

    /**
     * Native name: TELEPHONY_CALLTYPE_PACKETSWITCHED_WLAN
     * @type {Integer (Int32)}
     */
    static PACKETSWITCHED_WLAN => 2
}
