#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class IS_TEXT_UNICODE_RESULT extends Win32BitflagEnum {

    /**
     * Native name: IS_TEXT_UNICODE_ASCII16
     * @type {Integer (UInt32)}
     */
    static ASCII16 => 1

    /**
     * Native name: IS_TEXT_UNICODE_REVERSE_ASCII16
     * @type {Integer (UInt32)}
     */
    static REVERSE_ASCII16 => 16

    /**
     * Native name: IS_TEXT_UNICODE_STATISTICS
     * @type {Integer (UInt32)}
     */
    static STATISTICS => 2

    /**
     * Native name: IS_TEXT_UNICODE_REVERSE_STATISTICS
     * @type {Integer (UInt32)}
     */
    static REVERSE_STATISTICS => 32

    /**
     * Native name: IS_TEXT_UNICODE_CONTROLS
     * @type {Integer (UInt32)}
     */
    static CONTROLS => 4

    /**
     * Native name: IS_TEXT_UNICODE_REVERSE_CONTROLS
     * @type {Integer (UInt32)}
     */
    static REVERSE_CONTROLS => 64

    /**
     * Native name: IS_TEXT_UNICODE_SIGNATURE
     * @type {Integer (UInt32)}
     */
    static SIGNATURE => 8

    /**
     * Native name: IS_TEXT_UNICODE_REVERSE_SIGNATURE
     * @type {Integer (UInt32)}
     */
    static REVERSE_SIGNATURE => 128

    /**
     * Native name: IS_TEXT_UNICODE_ILLEGAL_CHARS
     * @type {Integer (UInt32)}
     */
    static ILLEGAL_CHARS => 256

    /**
     * Native name: IS_TEXT_UNICODE_ODD_LENGTH
     * @type {Integer (UInt32)}
     */
    static ODD_LENGTH => 512

    /**
     * Native name: IS_TEXT_UNICODE_NULL_BYTES
     * @type {Integer (UInt32)}
     */
    static NULL_BYTES => 4096

    /**
     * Native name: IS_TEXT_UNICODE_UNICODE_MASK
     * @type {Integer (UInt32)}
     */
    static UNICODE_MASK => 15

    /**
     * Native name: IS_TEXT_UNICODE_REVERSE_MASK
     * @type {Integer (UInt32)}
     */
    static REVERSE_MASK => 240

    /**
     * Native name: IS_TEXT_UNICODE_NOT_UNICODE_MASK
     * @type {Integer (UInt32)}
     */
    static NOT_UNICODE_MASK => 3840

    /**
     * Native name: IS_TEXT_UNICODE_NOT_ASCII_MASK
     * @type {Integer (UInt32)}
     */
    static NOT_ASCII_MASK => 61440
}
