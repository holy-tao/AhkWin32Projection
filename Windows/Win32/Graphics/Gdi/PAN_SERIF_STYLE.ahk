#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class PAN_SERIF_STYLE extends Win32Enum{

    /**
     * @type {Integer (Byte)}
     */
    static PAN_SERIF_ANY => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static PAN_SERIF_NO_FIT => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static PAN_SERIF_COVE => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static PAN_SERIF_OBTUSE_COVE => 0x03

    /**
     * @type {Integer (Byte)}
     */
    static PAN_SERIF_SQUARE_COVE => 0x04

    /**
     * @type {Integer (Byte)}
     */
    static PAN_SERIF_OBTUSE_SQUARE_COVE => 0x05

    /**
     * @type {Integer (Byte)}
     */
    static PAN_SERIF_SQUARE => 0x06

    /**
     * @type {Integer (Byte)}
     */
    static PAN_SERIF_THIN => 0x07

    /**
     * @type {Integer (Byte)}
     */
    static PAN_SERIF_BONE => 0x08

    /**
     * @type {Integer (Byte)}
     */
    static PAN_SERIF_EXAGGERATED => 0x09

    /**
     * @type {Integer (Byte)}
     */
    static PAN_SERIF_TRIANGLE => 0x0A

    /**
     * @type {Integer (Byte)}
     */
    static PAN_SERIF_NORMAL_SANS => 0x0B

    /**
     * @type {Integer (Byte)}
     */
    static PAN_SERIF_OBTUSE_SANS => 0x0C

    /**
     * @type {Integer (Byte)}
     */
    static PAN_SERIF_PERP_SANS => 0x0D

    /**
     * @type {Integer (Byte)}
     */
    static PAN_SERIF_FLARED => 0x0E

    /**
     * @type {Integer (Byte)}
     */
    static PAN_SERIF_ROUNDED => 0x0F
}
