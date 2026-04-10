#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Iis
 */
class FTP_ACCESS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static FTP_ACCESS_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static FTP_ACCESS_READ => 1

    /**
     * @type {Integer (Int32)}
     */
    static FTP_ACCESS_WRITE => 2

    /**
     * @type {Integer (Int32)}
     */
    static FTP_ACCESS_READ_WRITE => 3
}
