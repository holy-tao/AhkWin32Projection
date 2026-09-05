#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class OPM_HDCP_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: OPM_HDCP_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Native name: OPM_HDCP_FLAG_REPEATER
     * @type {Integer (Int32)}
     */
    static FLAG_REPEATER => 1
}
