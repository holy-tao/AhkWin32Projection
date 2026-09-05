#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDI_VIDEO_SIGNAL_SCANLINE_ORDERING extends Win32Enum {

    /**
     * Native name: D3DDDI_VSSLO_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static VSSLO_UNINITIALIZED => 0

    /**
     * Native name: D3DDDI_VSSLO_PROGRESSIVE
     * @type {Integer (Int32)}
     */
    static VSSLO_PROGRESSIVE => 1

    /**
     * Native name: D3DDDI_VSSLO_INTERLACED_UPPERFIELDFIRST
     * @type {Integer (Int32)}
     */
    static VSSLO_INTERLACED_UPPERFIELDFIRST => 2

    /**
     * Native name: D3DDDI_VSSLO_INTERLACED_LOWERFIELDFIRST
     * @type {Integer (Int32)}
     */
    static VSSLO_INTERLACED_LOWERFIELDFIRST => 3

    /**
     * Native name: D3DDDI_VSSLO_OTHER
     * @type {Integer (Int32)}
     */
    static VSSLO_OTHER => 255
}
