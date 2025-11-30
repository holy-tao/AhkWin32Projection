#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_HDCP_STATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MF_HDCP_STATUS_ON => 0

    /**
     * @type {Integer (Int32)}
     */
    static MF_HDCP_STATUS_OFF => 1

    /**
     * @type {Integer (Int32)}
     */
    static MF_HDCP_STATUS_ON_WITH_TYPE_ENFORCEMENT => 2
}
