#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class PAN_MIDLINE extends Win32Enum{

    /**
     * @type {Integer (Byte)}
     */
    static PAN_MIDLINE_ANY => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static PAN_MIDLINE_NO_FIT => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static PAN_MIDLINE_INDEX => 0x08

    /**
     * @type {Integer (Byte)}
     */
    static PAN_MIDLINE_STANDARD_TRIMMED => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static PAN_MIDLINE_STANDARD_POINTED => 0x03

    /**
     * @type {Integer (Byte)}
     */
    static PAN_MIDLINE_STANDARD_SERIFED => 0x04

    /**
     * @type {Integer (Byte)}
     */
    static PAN_MIDLINE_HIGH_TRIMMED => 0x05

    /**
     * @type {Integer (Byte)}
     */
    static PAN_MIDLINE_HIGH_POINTED => 0x06

    /**
     * @type {Integer (Byte)}
     */
    static PAN_MIDLINE_HIGH_SERIFED => 0x07

    /**
     * @type {Integer (Byte)}
     */
    static PAN_MIDLINE_CONSTANT_TRIMMED => 0x08

    /**
     * @type {Integer (Byte)}
     */
    static PAN_MIDLINE_CONSTANT_POINTED => 0x09

    /**
     * @type {Integer (Byte)}
     */
    static PAN_MIDLINE_CONSTANT_SERIFED => 0x0A

    /**
     * @type {Integer (Byte)}
     */
    static PAN_MIDLINE_LOW_TRIMMED => 0x0B

    /**
     * @type {Integer (Byte)}
     */
    static PAN_MIDLINE_LOW_POINTED => 0x0C

    /**
     * @type {Integer (Byte)}
     */
    static PAN_MIDLINE_LOW_SERIFED => 0x0D
}
