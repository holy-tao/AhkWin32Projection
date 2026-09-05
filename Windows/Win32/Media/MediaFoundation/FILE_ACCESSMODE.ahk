#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class FILE_ACCESSMODE extends Win32Enum {

    /**
     * Native name: ACCESSMODE_READ
     * @type {Integer (Int32)}
     */
    static READ => 1

    /**
     * Native name: ACCESSMODE_WRITE
     * @type {Integer (Int32)}
     */
    static WRITE => 2

    /**
     * Native name: ACCESSMODE_READWRITE
     * @type {Integer (Int32)}
     */
    static READWRITE => 3

    /**
     * Native name: ACCESSMODE_WRITE_EXCLUSIVE
     * @type {Integer (Int32)}
     */
    static WRITE_EXCLUSIVE => 4
}
