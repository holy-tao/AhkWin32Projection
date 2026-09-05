#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_AMVP_SELECTFORMATBY extends Win32Enum {

    /**
     * Native name: KS_AMVP_DO_NOT_CARE
     * @type {Integer (Int32)}
     */
    static DO_NOT_CARE => 0

    /**
     * Native name: KS_AMVP_BEST_BANDWIDTH
     * @type {Integer (Int32)}
     */
    static BEST_BANDWIDTH => 1

    /**
     * Native name: KS_AMVP_INPUT_SAME_AS_OUTPUT
     * @type {Integer (Int32)}
     */
    static INPUT_SAME_AS_OUTPUT => 2
}
