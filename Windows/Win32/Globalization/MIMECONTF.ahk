#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class MIMECONTF extends Win32Enum {

    /**
     * Native name: MIMECONTF_MAILNEWS
     * @type {Integer (Int32)}
     */
    static MAILNEWS => 1

    /**
     * Native name: MIMECONTF_BROWSER
     * @type {Integer (Int32)}
     */
    static BROWSER => 2

    /**
     * Native name: MIMECONTF_MINIMAL
     * @type {Integer (Int32)}
     */
    static MINIMAL => 4

    /**
     * Native name: MIMECONTF_IMPORT
     * @type {Integer (Int32)}
     */
    static IMPORT => 8

    /**
     * Native name: MIMECONTF_SAVABLE_MAILNEWS
     * @type {Integer (Int32)}
     */
    static SAVABLE_MAILNEWS => 256

    /**
     * Native name: MIMECONTF_SAVABLE_BROWSER
     * @type {Integer (Int32)}
     */
    static SAVABLE_BROWSER => 512

    /**
     * Native name: MIMECONTF_EXPORT
     * @type {Integer (Int32)}
     */
    static EXPORT => 1024

    /**
     * Native name: MIMECONTF_PRIVCONVERTER
     * @type {Integer (Int32)}
     */
    static PRIVCONVERTER => 65536

    /**
     * Native name: MIMECONTF_VALID
     * @type {Integer (Int32)}
     */
    static VALID => 131072

    /**
     * Native name: MIMECONTF_VALID_NLS
     * @type {Integer (Int32)}
     */
    static VALID_NLS => 262144

    /**
     * Native name: MIMECONTF_MIME_IE4
     * @type {Integer (Int32)}
     */
    static MIME_IE4 => 268435456

    /**
     * Native name: MIMECONTF_MIME_LATEST
     * @type {Integer (Int32)}
     */
    static MIME_LATEST => 536870912

    /**
     * Native name: MIMECONTF_MIME_REGISTRY
     * @type {Integer (Int32)}
     */
    static MIME_REGISTRY => 1073741824
}
