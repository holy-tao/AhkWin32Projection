#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_MPEG2Level extends Win32Enum {

    /**
     * Native name: KS_MPEG2Level_Low
     * @type {Integer (Int32)}
     */
    static Low => 0

    /**
     * Native name: KS_MPEG2Level_Main
     * @type {Integer (Int32)}
     */
    static Main => 1

    /**
     * Native name: KS_MPEG2Level_High1440
     * @type {Integer (Int32)}
     */
    static High1440 => 2

    /**
     * Native name: KS_MPEG2Level_High
     * @type {Integer (Int32)}
     */
    static High => 3
}
