#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_MSE_APPEND_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MF_MSE_APPEND_MODE_SEGMENTS => 0

    /**
     * @type {Integer (Int32)}
     */
    static MF_MSE_APPEND_MODE_SEQUENCE => 1
}
