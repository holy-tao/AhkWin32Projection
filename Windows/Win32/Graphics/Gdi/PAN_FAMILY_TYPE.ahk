#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class PAN_FAMILY_TYPE extends Win32Enum {

    /**
     * Native name: PAN_FAMILY_ANY
     * @type {Integer (Byte)}
     */
    static ANY => 0x00

    /**
     * Native name: PAN_FAMILY_NO_FIT
     * @type {Integer (Byte)}
     */
    static NO_FIT => 0x01

    /**
     * Native name: PAN_FAMILY_TEXT_DISPLAY
     * @type {Integer (Byte)}
     */
    static TEXT_DISPLAY => 0x02

    /**
     * Native name: PAN_FAMILY_SCRIPT
     * @type {Integer (Byte)}
     */
    static SCRIPT => 0x03

    /**
     * Native name: PAN_FAMILY_DECORATIVE
     * @type {Integer (Byte)}
     */
    static DECORATIVE => 0x04

    /**
     * Native name: PAN_FAMILY_PICTORIAL
     * @type {Integer (Byte)}
     */
    static PICTORIAL => 0x05
}
