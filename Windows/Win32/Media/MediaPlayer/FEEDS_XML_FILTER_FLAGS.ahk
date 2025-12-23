#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class FEEDS_XML_FILTER_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FXFF_ALL => 0

    /**
     * @type {Integer (Int32)}
     */
    static FXFF_UNREAD => 1

    /**
     * @type {Integer (Int32)}
     */
    static FXFF_READ => 2
}
