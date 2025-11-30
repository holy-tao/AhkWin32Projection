#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class PAN_PROPORTION extends Win32Enum{

    /**
     * @type {Integer (Byte)}
     */
    static PAN_PROP_ANY => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static PAN_PROP_NO_FIT => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static PAN_PROP_OLD_STYLE => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static PAN_PROP_MODERN => 0x03

    /**
     * @type {Integer (Byte)}
     */
    static PAN_PROP_EVEN_WIDTH => 0x04

    /**
     * @type {Integer (Byte)}
     */
    static PAN_PROP_EXPANDED => 0x05

    /**
     * @type {Integer (Byte)}
     */
    static PAN_PROP_CONDENSED => 0x06

    /**
     * @type {Integer (Byte)}
     */
    static PAN_PROP_VERY_EXPANDED => 0x07

    /**
     * @type {Integer (Byte)}
     */
    static PAN_PROP_VERY_CONDENSED => 0x08

    /**
     * @type {Integer (Byte)}
     */
    static PAN_PROP_MONOSPACED => 0x09
}
