#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class PAN_SERIF_STYLE extends Win32Enum {

    /**
     * Native name: PAN_SERIF_ANY
     * @type {Integer (Byte)}
     */
    static ANY => 0x00

    /**
     * Native name: PAN_SERIF_NO_FIT
     * @type {Integer (Byte)}
     */
    static NO_FIT => 0x01

    /**
     * Native name: PAN_SERIF_COVE
     * @type {Integer (Byte)}
     */
    static COVE => 0x02

    /**
     * Native name: PAN_SERIF_OBTUSE_COVE
     * @type {Integer (Byte)}
     */
    static OBTUSE_COVE => 0x03

    /**
     * Native name: PAN_SERIF_SQUARE_COVE
     * @type {Integer (Byte)}
     */
    static SQUARE_COVE => 0x04

    /**
     * Native name: PAN_SERIF_OBTUSE_SQUARE_COVE
     * @type {Integer (Byte)}
     */
    static OBTUSE_SQUARE_COVE => 0x05

    /**
     * Native name: PAN_SERIF_SQUARE
     * @type {Integer (Byte)}
     */
    static SQUARE => 0x06

    /**
     * Native name: PAN_SERIF_THIN
     * @type {Integer (Byte)}
     */
    static THIN => 0x07

    /**
     * Native name: PAN_SERIF_BONE
     * @type {Integer (Byte)}
     */
    static BONE => 0x08

    /**
     * Native name: PAN_SERIF_EXAGGERATED
     * @type {Integer (Byte)}
     */
    static EXAGGERATED => 0x09

    /**
     * Native name: PAN_SERIF_TRIANGLE
     * @type {Integer (Byte)}
     */
    static TRIANGLE => 0x0A

    /**
     * Native name: PAN_SERIF_NORMAL_SANS
     * @type {Integer (Byte)}
     */
    static NORMAL_SANS => 0x0B

    /**
     * Native name: PAN_SERIF_OBTUSE_SANS
     * @type {Integer (Byte)}
     */
    static OBTUSE_SANS => 0x0C

    /**
     * Native name: PAN_SERIF_PERP_SANS
     * @type {Integer (Byte)}
     */
    static PERP_SANS => 0x0D

    /**
     * Native name: PAN_SERIF_FLARED
     * @type {Integer (Byte)}
     */
    static FLARED => 0x0E

    /**
     * Native name: PAN_SERIF_ROUNDED
     * @type {Integer (Byte)}
     */
    static ROUNDED => 0x0F
}
