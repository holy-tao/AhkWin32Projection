#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify parameters for startup.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusinit/ne-gdiplusinit-gdiplusstartupparams
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class GdiplusStartupParams{

    /**
     * Specfies default startup.
     * @type {Integer (Int32)}
     */
    static GdiplusStartupDefault => 0

    /**
     * Specifies no set round for startup.
     * @type {Integer (Int32)}
     */
    static GdiplusStartupNoSetRound => 1

    /**
     * Specifies a pixel shader value for startup.
     * @type {Integer (Int32)}
     */
    static GdiplusStartupSetPSValue => 2

    /**
     * @type {Integer (Int32)}
     */
    static GdiplusStartupReserved0 => 4

    /**
     * @type {Integer (Int32)}
     */
    static GdiplusStartupReserved1 => 8

    /**
     * @type {Integer (Int32)}
     */
    static GdiplusStartupReserved2 => 16

    /**
     * Specifies a transparency mask for startup.
     * @type {Integer (Int32)}
     */
    static GdiplusStartupTransparencyMask => -16777216
}
