#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_MONITOR_DESCRIPTOR_TYPE extends Win32Enum {

    /**
     * Native name: D3DKMDT_MDT_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static MDT_UNINITIALIZED => 0

    /**
     * Native name: D3DKMDT_MDT_VESA_EDID_V1_BASEBLOCK
     * @type {Integer (Int32)}
     */
    static MDT_VESA_EDID_V1_BASEBLOCK => 1

    /**
     * Native name: D3DKMDT_MDT_VESA_EDID_V1_BLOCKMAP
     * @type {Integer (Int32)}
     */
    static MDT_VESA_EDID_V1_BLOCKMAP => 2

    /**
     * Native name: D3DKMDT_MDT_OTHER
     * @type {Integer (Int32)}
     */
    static MDT_OTHER => 255
}
