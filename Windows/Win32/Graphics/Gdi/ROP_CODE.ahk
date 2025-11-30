#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class ROP_CODE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static BLACKNESS => 66

    /**
     * @type {Integer (UInt32)}
     */
    static NOTSRCERASE => 1114278

    /**
     * @type {Integer (UInt32)}
     */
    static NOTSRCCOPY => 3342344

    /**
     * @type {Integer (UInt32)}
     */
    static SRCERASE => 4457256

    /**
     * @type {Integer (UInt32)}
     */
    static DSTINVERT => 5570569

    /**
     * @type {Integer (UInt32)}
     */
    static PATINVERT => 5898313

    /**
     * @type {Integer (UInt32)}
     */
    static SRCINVERT => 6684742

    /**
     * @type {Integer (UInt32)}
     */
    static SRCAND => 8913094

    /**
     * @type {Integer (UInt32)}
     */
    static MERGEPAINT => 12255782

    /**
     * @type {Integer (UInt32)}
     */
    static MERGECOPY => 12583114

    /**
     * @type {Integer (UInt32)}
     */
    static SRCCOPY => 13369376

    /**
     * @type {Integer (UInt32)}
     */
    static SRCPAINT => 15597702

    /**
     * @type {Integer (UInt32)}
     */
    static PATCOPY => 15728673

    /**
     * @type {Integer (UInt32)}
     */
    static PATPAINT => 16452105

    /**
     * @type {Integer (UInt32)}
     */
    static WHITENESS => 16711778

    /**
     * @type {Integer (UInt32)}
     */
    static CAPTUREBLT => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static NOMIRRORBITMAP => 2147483648
}
