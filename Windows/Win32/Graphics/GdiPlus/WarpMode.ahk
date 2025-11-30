#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WarpMode enumeration specifies warp modes that can be used to transform images.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-warpmode
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class WarpMode extends Win32Enum{

    /**
     * Specifies the perspective warp mode.
     * @type {Integer (Int32)}
     */
    static WarpModePerspective => 0

    /**
     * Specifies the bilinear warp mode.
     * @type {Integer (Int32)}
     */
    static WarpModeBilinear => 1
}
