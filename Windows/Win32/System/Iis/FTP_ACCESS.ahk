#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Iis
 */
class FTP_ACCESS extends Win32Enum {

    /**
     * Native name: FTP_ACCESS_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: FTP_ACCESS_READ
     * @type {Integer (Int32)}
     */
    static READ => 1

    /**
     * Native name: FTP_ACCESS_WRITE
     * @type {Integer (Int32)}
     */
    static WRITE => 2

    /**
     * Native name: FTP_ACCESS_READ_WRITE
     * @type {Integer (Int32)}
     */
    static READ_WRITE => 3
}
