#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the character set of a document.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_charset
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_CHARSET extends Win32Enum{

    /**
     * Specifies that the charset of a document should be determined automatically by inspecting
     *           the BOM (Byte Order Marks) of the document and the xml declaration if present.
     * @type {Integer (Int32)}
     */
    static WS_CHARSET_AUTO => 0

    /**
     * Specifies that the charset of a document is UTF-8.
     * @type {Integer (Int32)}
     */
    static WS_CHARSET_UTF8 => 1

    /**
     * Specifies that the charset of a document is UTF-16LE.
     * @type {Integer (Int32)}
     */
    static WS_CHARSET_UTF16LE => 2

    /**
     * Specifies that the charset of a document is UTF-16BE.
     * @type {Integer (Int32)}
     */
    static WS_CHARSET_UTF16BE => 3
}
