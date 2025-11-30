#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class PAN_FAMILY_TYPE extends Win32Enum{

    /**
     * @type {Integer (Byte)}
     */
    static PAN_FAMILY_ANY => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static PAN_FAMILY_NO_FIT => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static PAN_FAMILY_TEXT_DISPLAY => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static PAN_FAMILY_SCRIPT => 0x03

    /**
     * @type {Integer (Byte)}
     */
    static PAN_FAMILY_DECORATIVE => 0x04

    /**
     * @type {Integer (Byte)}
     */
    static PAN_FAMILY_PICTORIAL => 0x05
}
