#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_HDCP_STATUS extends Win32Enum {

    /**
     * Native name: MF_HDCP_STATUS_ON
     * @type {Integer (Int32)}
     */
    static ON => 0

    /**
     * Native name: MF_HDCP_STATUS_OFF
     * @type {Integer (Int32)}
     */
    static OFF => 1

    /**
     * Native name: MF_HDCP_STATUS_ON_WITH_TYPE_ENFORCEMENT
     * @type {Integer (Int32)}
     */
    static ON_WITH_TYPE_ENFORCEMENT => 2
}
