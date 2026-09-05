#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlEncoding extends Win32Enum {

    /**
     * Native name: htmlEncodingURL
     * @type {Integer (Int32)}
     */
    static EncodingURL => 0

    /**
     * Native name: htmlEncodingMultipart
     * @type {Integer (Int32)}
     */
    static Multipart => 1

    /**
     * Native name: htmlEncodingText
     * @type {Integer (Int32)}
     */
    static Text => 2

    /**
     * Native name: htmlEncoding_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
