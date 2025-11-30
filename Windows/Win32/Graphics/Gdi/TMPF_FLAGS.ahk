#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class TMPF_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Byte)}
     */
    static TMPF_FIXED_PITCH => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static TMPF_VECTOR => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static TMPF_DEVICE => 0x08

    /**
     * @type {Integer (Byte)}
     */
    static TMPF_TRUETYPE => 0x04
}
