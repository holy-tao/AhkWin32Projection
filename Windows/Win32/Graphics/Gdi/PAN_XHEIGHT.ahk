#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class PAN_XHEIGHT extends Win32Enum{

    /**
     * @type {Integer (Byte)}
     */
    static PAN_XHEIGHT_ANY => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static PAN_XHEIGHT_NO_FIT => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static PAN_XHEIGHT_INDEX => 0x09

    /**
     * @type {Integer (Byte)}
     */
    static PAN_XHEIGHT_CONSTANT_SMALL => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static PAN_XHEIGHT_CONSTANT_STD => 0x03

    /**
     * @type {Integer (Byte)}
     */
    static PAN_XHEIGHT_CONSTANT_LARGE => 0x04

    /**
     * @type {Integer (Byte)}
     */
    static PAN_XHEIGHT_DUCKING_SMALL => 0x05

    /**
     * @type {Integer (Byte)}
     */
    static PAN_XHEIGHT_DUCKING_STD => 0x06

    /**
     * @type {Integer (Byte)}
     */
    static PAN_XHEIGHT_DUCKING_LARGE => 0x07
}
