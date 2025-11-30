#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DDDI_VIDEO_SIGNAL_SCANLINE_ORDERING extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_VSSLO_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_VSSLO_PROGRESSIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_VSSLO_INTERLACED_UPPERFIELDFIRST => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_VSSLO_INTERLACED_LOWERFIELDFIRST => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_VSSLO_OTHER => 255
}
