#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class PAN_ARM_STYLE extends Win32Enum {

    /**
     * Native name: PAN_ARM_ANY
     * @type {Integer (Byte)}
     */
    static ANY => 0x00

    /**
     * Native name: PAN_ARM_NO_FIT
     * @type {Integer (Byte)}
     */
    static NO_FIT => 0x01

    /**
     * Native name: PAN_STRAIGHT_ARMS_HORZ
     * @type {Integer (Byte)}
     */
    static STRAIGHT_ARMS_HORZ => 0x02

    /**
     * Native name: PAN_STRAIGHT_ARMS_WEDGE
     * @type {Integer (Byte)}
     */
    static STRAIGHT_ARMS_WEDGE => 0x03

    /**
     * Native name: PAN_STRAIGHT_ARMS_VERT
     * @type {Integer (Byte)}
     */
    static STRAIGHT_ARMS_VERT => 0x04

    /**
     * Native name: PAN_STRAIGHT_ARMS_SINGLE_SERIF
     * @type {Integer (Byte)}
     */
    static STRAIGHT_ARMS_SINGLE_SERIF => 0x05

    /**
     * Native name: PAN_STRAIGHT_ARMS_DOUBLE_SERIF
     * @type {Integer (Byte)}
     */
    static STRAIGHT_ARMS_DOUBLE_SERIF => 0x06

    /**
     * Native name: PAN_BENT_ARMS_HORZ
     * @type {Integer (Byte)}
     */
    static BENT_ARMS_HORZ => 0x07

    /**
     * Native name: PAN_BENT_ARMS_WEDGE
     * @type {Integer (Byte)}
     */
    static BENT_ARMS_WEDGE => 0x08

    /**
     * Native name: PAN_BENT_ARMS_VERT
     * @type {Integer (Byte)}
     */
    static BENT_ARMS_VERT => 0x09

    /**
     * Native name: PAN_BENT_ARMS_SINGLE_SERIF
     * @type {Integer (Byte)}
     */
    static BENT_ARMS_SINGLE_SERIF => 0x0A

    /**
     * Native name: PAN_BENT_ARMS_DOUBLE_SERIF
     * @type {Integer (Byte)}
     */
    static BENT_ARMS_DOUBLE_SERIF => 0x0B
}
