#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class OPM_HDCP_STATUS extends Win32Enum {

    /**
     * Native name: OPM_HDCP_STATUS_ON
     * @type {Integer (Int32)}
     */
    static ON => 0

    /**
     * Native name: OPM_HDCP_STATUS_OFF
     * @type {Integer (Int32)}
     */
    static OFF => 1
}
