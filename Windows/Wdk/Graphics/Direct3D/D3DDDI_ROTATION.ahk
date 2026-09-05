#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDI_ROTATION extends Win32Enum {

    /**
     * Native name: D3DDDI_ROTATION_IDENTITY
     * @type {Integer (Int32)}
     */
    static IDENTITY => 1

    /**
     * Native name: D3DDDI_ROTATION_90
     * @type {Integer (Int32)}
     */
    static 90 => 2

    /**
     * Native name: D3DDDI_ROTATION_180
     * @type {Integer (Int32)}
     */
    static 180 => 3

    /**
     * Native name: D3DDDI_ROTATION_270
     * @type {Integer (Int32)}
     */
    static 270 => 4
}
