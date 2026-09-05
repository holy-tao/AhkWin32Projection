#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class TELEPHONY_CALLCONTROLOP extends Win32Enum {

    /**
     * Native name: TELEPHONY_CALLCONTROLOP_DISABLE
     * @type {Integer (Int32)}
     */
    static DISABLE => 0

    /**
     * Native name: TELEPHONY_CALLCONTROLOP_ENABLE
     * @type {Integer (Int32)}
     */
    static ENABLE => 1
}
