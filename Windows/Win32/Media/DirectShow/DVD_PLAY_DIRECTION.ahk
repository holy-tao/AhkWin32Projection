#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_PLAY_DIRECTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DVD_DIR_FORWARD => 0

    /**
     * @type {Integer (Int32)}
     */
    static DVD_DIR_BACKWARD => 1
}
