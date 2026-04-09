#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class TA_TIMINGFUNCTION_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static TTFT_UNDEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static TTFT_CUBIC_BEZIER => 1
}
