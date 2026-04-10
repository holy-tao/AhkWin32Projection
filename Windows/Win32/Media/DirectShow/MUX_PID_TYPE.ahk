#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class MUX_PID_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static PID_OTHER => -1

    /**
     * @type {Integer (Int32)}
     */
    static PID_ELEMENTARY_STREAM => 0

    /**
     * @type {Integer (Int32)}
     */
    static PID_MPEG2_SECTION_PSI_SI => 1
}
