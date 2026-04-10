#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class FILE_ACCESSMODE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static ACCESSMODE_READ => 1

    /**
     * @type {Integer (Int32)}
     */
    static ACCESSMODE_WRITE => 2

    /**
     * @type {Integer (Int32)}
     */
    static ACCESSMODE_READWRITE => 3

    /**
     * @type {Integer (Int32)}
     */
    static ACCESSMODE_WRITE_EXCLUSIVE => 4
}
