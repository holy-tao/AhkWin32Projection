#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_MPEG2VID extends Win32Enum {

    /**
     * Native name: KSPROPERTY_MPEG2VID_MODES
     * @type {Integer (Int32)}
     */
    static MODES => 0

    /**
     * Native name: KSPROPERTY_MPEG2VID_CUR_MODE
     * @type {Integer (Int32)}
     */
    static CUR_MODE => 1

    /**
     * Native name: KSPROPERTY_MPEG2VID_4_3_RECT
     * @type {Integer (Int32)}
     */
    static 4_3_RECT => 2

    /**
     * Native name: KSPROPERTY_MPEG2VID_16_9_RECT
     * @type {Integer (Int32)}
     */
    static 16_9_RECT => 3

    /**
     * Native name: KSPROPERTY_MPEG2VID_16_9_PANSCAN
     * @type {Integer (Int32)}
     */
    static 16_9_PANSCAN => 4
}
