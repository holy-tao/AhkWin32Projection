#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class PAN_STROKE_VARIATION extends Win32Enum {

    /**
     * Native name: PAN_STROKE_ANY
     * @type {Integer (Byte)}
     */
    static ANY => 0x00

    /**
     * Native name: PAN_STROKE_NO_FIT
     * @type {Integer (Byte)}
     */
    static NO_FIT => 0x01

    /**
     * Native name: PAN_STROKE_GRADUAL_DIAG
     * @type {Integer (Byte)}
     */
    static GRADUAL_DIAG => 0x02

    /**
     * Native name: PAN_STROKE_GRADUAL_TRAN
     * @type {Integer (Byte)}
     */
    static GRADUAL_TRAN => 0x03

    /**
     * Native name: PAN_STROKE_GRADUAL_VERT
     * @type {Integer (Byte)}
     */
    static GRADUAL_VERT => 0x04

    /**
     * Native name: PAN_STROKE_GRADUAL_HORZ
     * @type {Integer (Byte)}
     */
    static GRADUAL_HORZ => 0x05

    /**
     * Native name: PAN_STROKE_RAPID_VERT
     * @type {Integer (Byte)}
     */
    static RAPID_VERT => 0x06

    /**
     * Native name: PAN_STROKE_RAPID_HORZ
     * @type {Integer (Byte)}
     */
    static RAPID_HORZ => 0x07

    /**
     * Native name: PAN_STROKE_INSTANT_VERT
     * @type {Integer (Byte)}
     */
    static INSTANT_VERT => 0x08
}
