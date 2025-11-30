#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DDDI_ROTATION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_ROTATION_IDENTITY => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_ROTATION_90 => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_ROTATION_180 => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_ROTATION_270 => 4
}
