#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class PAN_LETT_FORM extends Win32Enum {

    /**
     * Native name: PAN_LETT_FORM_ANY
     * @type {Integer (Byte)}
     */
    static ANY => 0x00

    /**
     * Native name: PAN_LETT_FORM_NO_FIT
     * @type {Integer (Byte)}
     */
    static NO_FIT => 0x01

    /**
     * Native name: PAN_LETT_NORMAL_CONTACT
     * @type {Integer (Byte)}
     */
    static NORMAL_CONTACT => 0x02

    /**
     * Native name: PAN_LETT_NORMAL_WEIGHTED
     * @type {Integer (Byte)}
     */
    static NORMAL_WEIGHTED => 0x03

    /**
     * Native name: PAN_LETT_NORMAL_BOXED
     * @type {Integer (Byte)}
     */
    static NORMAL_BOXED => 0x04

    /**
     * Native name: PAN_LETT_NORMAL_FLATTENED
     * @type {Integer (Byte)}
     */
    static NORMAL_FLATTENED => 0x05

    /**
     * Native name: PAN_LETT_NORMAL_ROUNDED
     * @type {Integer (Byte)}
     */
    static NORMAL_ROUNDED => 0x06

    /**
     * Native name: PAN_LETT_NORMAL_OFF_CENTER
     * @type {Integer (Byte)}
     */
    static NORMAL_OFF_CENTER => 0x07

    /**
     * Native name: PAN_LETT_NORMAL_SQUARE
     * @type {Integer (Byte)}
     */
    static NORMAL_SQUARE => 0x08

    /**
     * Native name: PAN_LETT_OBLIQUE_CONTACT
     * @type {Integer (Byte)}
     */
    static OBLIQUE_CONTACT => 0x09

    /**
     * Native name: PAN_LETT_OBLIQUE_WEIGHTED
     * @type {Integer (Byte)}
     */
    static OBLIQUE_WEIGHTED => 0x0A

    /**
     * Native name: PAN_LETT_OBLIQUE_BOXED
     * @type {Integer (Byte)}
     */
    static OBLIQUE_BOXED => 0x0B

    /**
     * Native name: PAN_LETT_OBLIQUE_FLATTENED
     * @type {Integer (Byte)}
     */
    static OBLIQUE_FLATTENED => 0x0C

    /**
     * Native name: PAN_LETT_OBLIQUE_ROUNDED
     * @type {Integer (Byte)}
     */
    static OBLIQUE_ROUNDED => 0x0D

    /**
     * Native name: PAN_LETT_OBLIQUE_OFF_CENTER
     * @type {Integer (Byte)}
     */
    static OBLIQUE_OFF_CENTER => 0x0E

    /**
     * Native name: PAN_LETT_OBLIQUE_SQUARE
     * @type {Integer (Byte)}
     */
    static OBLIQUE_SQUARE => 0x0F
}
