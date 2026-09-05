#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class DVD_PLAY_DIRECTION extends Win32Enum {

    /**
     * Native name: DVD_DIR_FORWARD
     * @type {Integer (Int32)}
     */
    static DIR_FORWARD => 0

    /**
     * Native name: DVD_DIR_BACKWARD
     * @type {Integer (Int32)}
     */
    static DIR_BACKWARD => 1
}
