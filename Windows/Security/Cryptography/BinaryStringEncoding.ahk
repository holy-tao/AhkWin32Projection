#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Contains encoding formats that can be used in the [ConvertStringToBinary](cryptographicbuffer_convertstringtobinary_1526134090.md) and [ConvertBinaryToString](cryptographicbuffer_convertbinarytostring_2099042169.md) methods.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.binarystringencoding
 * @namespace Windows.Security.Cryptography
 * @version WindowsRuntime 1.4
 */
class BinaryStringEncoding extends Win32Enum{

    /**
     * Eight bit Unicode Transformation Format. The process encodes each Unicode code point into one to four 8-bit bytes. Code points represented by lower numerical values are encoded using fewer bytes. In particular, the first 128 characters correspond exactly to the ASCII character set and are encoded by using a single octet.
     * @type {Integer (Int32)}
     */
    static Utf8 => 0

    /**
     * Sixteen bit Unicode Transformation Format in little-endian byte order. The encoding process creates a variable length result of one or two 8-bit bytes per Unicode code point.
     * @type {Integer (Int32)}
     */
    static Utf16LE => 1

    /**
     * Sixteen bit Unicode Transformation Format in big-endian byte order.
     * @type {Integer (Int32)}
     */
    static Utf16BE => 2
}
