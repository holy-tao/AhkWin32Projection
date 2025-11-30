#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_MPEG2Level extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KS_MPEG2Level_Low => 0

    /**
     * @type {Integer (Int32)}
     */
    static KS_MPEG2Level_Main => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_MPEG2Level_High1440 => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_MPEG2Level_High => 3
}
