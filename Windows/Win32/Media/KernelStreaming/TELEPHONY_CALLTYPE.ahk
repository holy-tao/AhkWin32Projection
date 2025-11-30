#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class TELEPHONY_CALLTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TELEPHONY_CALLTYPE_CIRCUITSWITCHED => 0

    /**
     * @type {Integer (Int32)}
     */
    static TELEPHONY_CALLTYPE_PACKETSWITCHED_LTE => 1

    /**
     * @type {Integer (Int32)}
     */
    static TELEPHONY_CALLTYPE_PACKETSWITCHED_WLAN => 2
}
