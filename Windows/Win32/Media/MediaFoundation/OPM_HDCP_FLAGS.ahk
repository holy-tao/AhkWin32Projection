#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class OPM_HDCP_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static OPM_HDCP_FLAG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static OPM_HDCP_FLAG_REPEATER => 1
}
