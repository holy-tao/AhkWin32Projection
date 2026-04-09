#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_MONITOR_DESCRIPTOR_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MDT_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MDT_VESA_EDID_V1_BASEBLOCK => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MDT_VESA_EDID_V1_BLOCKMAP => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MDT_OTHER => 255
}
