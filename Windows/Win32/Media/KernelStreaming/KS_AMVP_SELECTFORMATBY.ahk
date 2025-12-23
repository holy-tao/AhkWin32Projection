#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_AMVP_SELECTFORMATBY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KS_AMVP_DO_NOT_CARE => 0

    /**
     * @type {Integer (Int32)}
     */
    static KS_AMVP_BEST_BANDWIDTH => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_AMVP_INPUT_SAME_AS_OUTPUT => 2
}
