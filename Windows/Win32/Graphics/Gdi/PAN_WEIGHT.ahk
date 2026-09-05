#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class PAN_WEIGHT extends Win32Enum {

    /**
     * Native name: PAN_WEIGHT_ANY
     * @type {Integer (Byte)}
     */
    static ANY => 0x00

    /**
     * Native name: PAN_WEIGHT_NO_FIT
     * @type {Integer (Byte)}
     */
    static NO_FIT => 0x01

    /**
     * Native name: PAN_WEIGHT_INDEX
     * @type {Integer (Byte)}
     */
    static INDEX => 0x02

    /**
     * Native name: PAN_WEIGHT_VERY_LIGHT
     * @type {Integer (Byte)}
     */
    static VERY_LIGHT => 0x02

    /**
     * Native name: PAN_WEIGHT_LIGHT
     * @type {Integer (Byte)}
     */
    static LIGHT => 0x03

    /**
     * Native name: PAN_WEIGHT_THIN
     * @type {Integer (Byte)}
     */
    static THIN => 0x04

    /**
     * Native name: PAN_WEIGHT_BOOK
     * @type {Integer (Byte)}
     */
    static BOOK => 0x05

    /**
     * Native name: PAN_WEIGHT_MEDIUM
     * @type {Integer (Byte)}
     */
    static MEDIUM => 0x06

    /**
     * Native name: PAN_WEIGHT_DEMI
     * @type {Integer (Byte)}
     */
    static DEMI => 0x07

    /**
     * Native name: PAN_WEIGHT_BOLD
     * @type {Integer (Byte)}
     */
    static BOLD => 0x08

    /**
     * Native name: PAN_WEIGHT_HEAVY
     * @type {Integer (Byte)}
     */
    static HEAVY => 0x09

    /**
     * Native name: PAN_WEIGHT_BLACK
     * @type {Integer (Byte)}
     */
    static BLACK => 0x0A

    /**
     * Native name: PAN_WEIGHT_NORD
     * @type {Integer (Byte)}
     */
    static NORD => 0x0B
}
