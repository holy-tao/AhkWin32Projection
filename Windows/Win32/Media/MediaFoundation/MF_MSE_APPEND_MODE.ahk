#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_MSE_APPEND_MODE extends Win32Enum {

    /**
     * Native name: MF_MSE_APPEND_MODE_SEGMENTS
     * @type {Integer (Int32)}
     */
    static SEGMENTS => 0

    /**
     * Native name: MF_MSE_APPEND_MODE_SEQUENCE
     * @type {Integer (Int32)}
     */
    static SEQUENCE => 1
}
