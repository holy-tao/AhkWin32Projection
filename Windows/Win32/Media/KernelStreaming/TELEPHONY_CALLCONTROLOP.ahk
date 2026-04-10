#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class TELEPHONY_CALLCONTROLOP extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static TELEPHONY_CALLCONTROLOP_DISABLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static TELEPHONY_CALLCONTROLOP_ENABLE => 1
}
