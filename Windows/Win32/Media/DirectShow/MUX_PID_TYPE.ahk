#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class MUX_PID_TYPE extends Win32Enum {

    /**
     * Native name: PID_OTHER
     * @type {Integer (Int32)}
     */
    static OTHER => -1

    /**
     * Native name: PID_ELEMENTARY_STREAM
     * @type {Integer (Int32)}
     */
    static ELEMENTARY_STREAM => 0

    /**
     * Native name: PID_MPEG2_SECTION_PSI_SI
     * @type {Integer (Int32)}
     */
    static MPEG2_SECTION_PSI_SI => 1
}
