#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of character encoding for a stream.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.unicodeencoding
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class UnicodeEncoding extends Win32Enum{

    /**
     * The encoding is UTF-8.
     * @type {Integer (Int32)}
     */
    static Utf8 => 0

    /**
     * The encoding is UTF-16, with the least significant byte first in the two eight-bit bytes.
     * @type {Integer (Int32)}
     */
    static Utf16LE => 1

    /**
     * The encoding is UTF-16, with the most significant byte first in the two eight-bit bytes.
     * @type {Integer (Int32)}
     */
    static Utf16BE => 2
}
