#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class PAN_XHEIGHT extends Win32Enum {

    /**
     * Native name: PAN_XHEIGHT_ANY
     * @type {Integer (Byte)}
     */
    static ANY => 0x00

    /**
     * Native name: PAN_XHEIGHT_NO_FIT
     * @type {Integer (Byte)}
     */
    static NO_FIT => 0x01

    /**
     * Native name: PAN_XHEIGHT_INDEX
     * @type {Integer (Byte)}
     */
    static INDEX => 0x09

    /**
     * Native name: PAN_XHEIGHT_CONSTANT_SMALL
     * @type {Integer (Byte)}
     */
    static CONSTANT_SMALL => 0x02

    /**
     * Native name: PAN_XHEIGHT_CONSTANT_STD
     * @type {Integer (Byte)}
     */
    static CONSTANT_STD => 0x03

    /**
     * Native name: PAN_XHEIGHT_CONSTANT_LARGE
     * @type {Integer (Byte)}
     */
    static CONSTANT_LARGE => 0x04

    /**
     * Native name: PAN_XHEIGHT_DUCKING_SMALL
     * @type {Integer (Byte)}
     */
    static DUCKING_SMALL => 0x05

    /**
     * Native name: PAN_XHEIGHT_DUCKING_STD
     * @type {Integer (Byte)}
     */
    static DUCKING_STD => 0x06

    /**
     * Native name: PAN_XHEIGHT_DUCKING_LARGE
     * @type {Integer (Byte)}
     */
    static DUCKING_LARGE => 0x07
}
