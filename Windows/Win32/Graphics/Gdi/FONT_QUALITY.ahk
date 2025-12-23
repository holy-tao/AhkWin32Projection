#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class FONT_QUALITY extends Win32Enum{

    /**
     * @type {Integer (Byte)}
     */
    static DEFAULT_QUALITY => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static DRAFT_QUALITY => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static PROOF_QUALITY => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static NONANTIALIASED_QUALITY => 0x03

    /**
     * @type {Integer (Byte)}
     */
    static ANTIALIASED_QUALITY => 0x04

    /**
     * @type {Integer (Byte)}
     */
    static CLEARTYPE_QUALITY => 0x05
}
