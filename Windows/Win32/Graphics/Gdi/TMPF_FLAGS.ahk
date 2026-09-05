#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class TMPF_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: TMPF_FIXED_PITCH
     * @type {Integer (Byte)}
     */
    static FIXED_PITCH => 0x01

    /**
     * Native name: TMPF_VECTOR
     * @type {Integer (Byte)}
     */
    static VECTOR => 0x02

    /**
     * Native name: TMPF_DEVICE
     * @type {Integer (Byte)}
     */
    static DEVICE => 0x08

    /**
     * Native name: TMPF_TRUETYPE
     * @type {Integer (Byte)}
     */
    static TRUETYPE => 0x04
}
