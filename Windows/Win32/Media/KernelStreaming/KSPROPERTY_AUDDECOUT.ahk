#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_AUDDECOUT extends Win32Enum {

    /**
     * Native name: KSPROPERTY_AUDDECOUT_MODES
     * @type {Integer (Int32)}
     */
    static MODES => 0

    /**
     * Native name: KSPROPERTY_AUDDECOUT_CUR_MODE
     * @type {Integer (Int32)}
     */
    static CUR_MODE => 1
}
