#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class PasswordEncodingType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PasswordEncodingUTF8 => 0

    /**
     * @type {Integer (Int32)}
     */
    static PasswordEncodingUTF16LE => 1

    /**
     * @type {Integer (Int32)}
     */
    static PasswordEncodingUTF16BE => 2
}
