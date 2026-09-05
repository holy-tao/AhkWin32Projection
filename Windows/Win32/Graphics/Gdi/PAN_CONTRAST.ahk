#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class PAN_CONTRAST extends Win32Enum {

    /**
     * Native name: PAN_CONTRAST_ANY
     * @type {Integer (Byte)}
     */
    static ANY => 0x00

    /**
     * Native name: PAN_CONTRAST_NO_FIT
     * @type {Integer (Byte)}
     */
    static NO_FIT => 0x01

    /**
     * Native name: PAN_CONTRAST_INDEX
     * @type {Integer (Byte)}
     */
    static INDEX => 0x04

    /**
     * Native name: PAN_CONTRAST_NONE
     * @type {Integer (Byte)}
     */
    static NONE => 0x02

    /**
     * Native name: PAN_CONTRAST_VERY_LOW
     * @type {Integer (Byte)}
     */
    static VERY_LOW => 0x03

    /**
     * Native name: PAN_CONTRAST_LOW
     * @type {Integer (Byte)}
     */
    static LOW => 0x04

    /**
     * Native name: PAN_CONTRAST_MEDIUM_LOW
     * @type {Integer (Byte)}
     */
    static MEDIUM_LOW => 0x05

    /**
     * Native name: PAN_CONTRAST_MEDIUM
     * @type {Integer (Byte)}
     */
    static MEDIUM => 0x06

    /**
     * Native name: PAN_CONTRAST_MEDIUM_HIGH
     * @type {Integer (Byte)}
     */
    static MEDIUM_HIGH => 0x07

    /**
     * Native name: PAN_CONTRAST_HIGH
     * @type {Integer (Byte)}
     */
    static HIGH => 0x08

    /**
     * Native name: PAN_CONTRAST_VERY_HIGH
     * @type {Integer (Byte)}
     */
    static VERY_HIGH => 0x09
}
