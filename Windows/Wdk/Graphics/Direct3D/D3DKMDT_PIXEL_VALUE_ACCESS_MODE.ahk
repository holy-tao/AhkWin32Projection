#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_PIXEL_VALUE_ACCESS_MODE extends Win32Enum {

    /**
     * Native name: D3DKMDT_PVAM_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static PVAM_UNINITIALIZED => 0

    /**
     * Native name: D3DKMDT_PVAM_DIRECT
     * @type {Integer (Int32)}
     */
    static PVAM_DIRECT => 1

    /**
     * Native name: D3DKMDT_PVAM_PRESETPALETTE
     * @type {Integer (Int32)}
     */
    static PVAM_PRESETPALETTE => 2

    /**
     * Native name: D3DKMDT_PVAM_SETTABLEPALETTE
     * @type {Integer (Int32)}
     */
    static PVAM_SETTABLEPALETTE => 3
}
