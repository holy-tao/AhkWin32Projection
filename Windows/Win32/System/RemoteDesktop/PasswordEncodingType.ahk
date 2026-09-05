#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class PasswordEncodingType extends Win32Enum {

    /**
     * Native name: PasswordEncodingUTF8
     * @type {Integer (Int32)}
     */
    static EncodingUTF8 => 0

    /**
     * Native name: PasswordEncodingUTF16LE
     * @type {Integer (Int32)}
     */
    static EncodingUTF16LE => 1

    /**
     * Native name: PasswordEncodingUTF16BE
     * @type {Integer (Int32)}
     */
    static EncodingUTF16BE => 2
}
