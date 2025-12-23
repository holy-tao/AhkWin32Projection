#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA_VideoLighting extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoLightingShift => 18

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoLightingMask => 3932160

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoLighting_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoLighting_bright => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoLighting_office => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoLighting_dim => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoLighting_dark => 4
}
