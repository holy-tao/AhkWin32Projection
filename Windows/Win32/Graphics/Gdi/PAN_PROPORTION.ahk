#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class PAN_PROPORTION extends Win32Enum {

    /**
     * Native name: PAN_PROP_ANY
     * @type {Integer (Byte)}
     */
    static PROP_ANY => 0x00

    /**
     * Native name: PAN_PROP_NO_FIT
     * @type {Integer (Byte)}
     */
    static PROP_NO_FIT => 0x01

    /**
     * Native name: PAN_PROP_OLD_STYLE
     * @type {Integer (Byte)}
     */
    static PROP_OLD_STYLE => 0x02

    /**
     * Native name: PAN_PROP_MODERN
     * @type {Integer (Byte)}
     */
    static PROP_MODERN => 0x03

    /**
     * Native name: PAN_PROP_EVEN_WIDTH
     * @type {Integer (Byte)}
     */
    static PROP_EVEN_WIDTH => 0x04

    /**
     * Native name: PAN_PROP_EXPANDED
     * @type {Integer (Byte)}
     */
    static PROP_EXPANDED => 0x05

    /**
     * Native name: PAN_PROP_CONDENSED
     * @type {Integer (Byte)}
     */
    static PROP_CONDENSED => 0x06

    /**
     * Native name: PAN_PROP_VERY_EXPANDED
     * @type {Integer (Byte)}
     */
    static PROP_VERY_EXPANDED => 0x07

    /**
     * Native name: PAN_PROP_VERY_CONDENSED
     * @type {Integer (Byte)}
     */
    static PROP_VERY_CONDENSED => 0x08

    /**
     * Native name: PAN_PROP_MONOSPACED
     * @type {Integer (Byte)}
     */
    static PROP_MONOSPACED => 0x09
}
