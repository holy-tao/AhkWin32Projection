#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class PAN_MIDLINE extends Win32Enum {

    /**
     * Native name: PAN_MIDLINE_ANY
     * @type {Integer (Byte)}
     */
    static ANY => 0x00

    /**
     * Native name: PAN_MIDLINE_NO_FIT
     * @type {Integer (Byte)}
     */
    static NO_FIT => 0x01

    /**
     * Native name: PAN_MIDLINE_INDEX
     * @type {Integer (Byte)}
     */
    static INDEX => 0x08

    /**
     * Native name: PAN_MIDLINE_STANDARD_TRIMMED
     * @type {Integer (Byte)}
     */
    static STANDARD_TRIMMED => 0x02

    /**
     * Native name: PAN_MIDLINE_STANDARD_POINTED
     * @type {Integer (Byte)}
     */
    static STANDARD_POINTED => 0x03

    /**
     * Native name: PAN_MIDLINE_STANDARD_SERIFED
     * @type {Integer (Byte)}
     */
    static STANDARD_SERIFED => 0x04

    /**
     * Native name: PAN_MIDLINE_HIGH_TRIMMED
     * @type {Integer (Byte)}
     */
    static HIGH_TRIMMED => 0x05

    /**
     * Native name: PAN_MIDLINE_HIGH_POINTED
     * @type {Integer (Byte)}
     */
    static HIGH_POINTED => 0x06

    /**
     * Native name: PAN_MIDLINE_HIGH_SERIFED
     * @type {Integer (Byte)}
     */
    static HIGH_SERIFED => 0x07

    /**
     * Native name: PAN_MIDLINE_CONSTANT_TRIMMED
     * @type {Integer (Byte)}
     */
    static CONSTANT_TRIMMED => 0x08

    /**
     * Native name: PAN_MIDLINE_CONSTANT_POINTED
     * @type {Integer (Byte)}
     */
    static CONSTANT_POINTED => 0x09

    /**
     * Native name: PAN_MIDLINE_CONSTANT_SERIFED
     * @type {Integer (Byte)}
     */
    static CONSTANT_SERIFED => 0x0A

    /**
     * Native name: PAN_MIDLINE_LOW_TRIMMED
     * @type {Integer (Byte)}
     */
    static LOW_TRIMMED => 0x0B

    /**
     * Native name: PAN_MIDLINE_LOW_POINTED
     * @type {Integer (Byte)}
     */
    static LOW_POINTED => 0x0C

    /**
     * Native name: PAN_MIDLINE_LOW_SERIFED
     * @type {Integer (Byte)}
     */
    static LOW_SERIFED => 0x0D
}
