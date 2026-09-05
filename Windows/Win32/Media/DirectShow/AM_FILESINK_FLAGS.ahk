#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class AM_FILESINK_FLAGS extends Win32Enum {

    /**
     * Native name: AM_FILE_OVERWRITE
     * @type {Integer (Int32)}
     */
    static FILE_OVERWRITE => 1
}
