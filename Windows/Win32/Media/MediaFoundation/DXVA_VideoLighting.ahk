#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA_VideoLighting extends Win32Enum {

    /**
     * Native name: DXVA_VideoLightingShift
     * @type {Integer (Int32)}
     */
    static Shift => 18

    /**
     * Native name: DXVA_VideoLightingMask
     * @type {Integer (Int32)}
     */
    static Mask => 3932160

    /**
     * Native name: DXVA_VideoLighting_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: DXVA_VideoLighting_bright
     * @type {Integer (Int32)}
     */
    static bright => 1

    /**
     * Native name: DXVA_VideoLighting_office
     * @type {Integer (Int32)}
     */
    static office => 2

    /**
     * Native name: DXVA_VideoLighting_dim
     * @type {Integer (Int32)}
     */
    static dim => 3

    /**
     * Native name: DXVA_VideoLighting_dark
     * @type {Integer (Int32)}
     */
    static dark => 4
}
