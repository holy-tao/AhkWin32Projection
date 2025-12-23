#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class MIMECONTF extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MIMECONTF_MAILNEWS => 1

    /**
     * @type {Integer (Int32)}
     */
    static MIMECONTF_BROWSER => 2

    /**
     * @type {Integer (Int32)}
     */
    static MIMECONTF_MINIMAL => 4

    /**
     * @type {Integer (Int32)}
     */
    static MIMECONTF_IMPORT => 8

    /**
     * @type {Integer (Int32)}
     */
    static MIMECONTF_SAVABLE_MAILNEWS => 256

    /**
     * @type {Integer (Int32)}
     */
    static MIMECONTF_SAVABLE_BROWSER => 512

    /**
     * @type {Integer (Int32)}
     */
    static MIMECONTF_EXPORT => 1024

    /**
     * @type {Integer (Int32)}
     */
    static MIMECONTF_PRIVCONVERTER => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MIMECONTF_VALID => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MIMECONTF_VALID_NLS => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MIMECONTF_MIME_IE4 => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static MIMECONTF_MIME_LATEST => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static MIMECONTF_MIME_REGISTRY => 1073741824
}
