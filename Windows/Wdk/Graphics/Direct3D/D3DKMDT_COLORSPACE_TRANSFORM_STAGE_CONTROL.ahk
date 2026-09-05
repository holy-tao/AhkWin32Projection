#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_COLORSPACE_TRANSFORM_STAGE_CONTROL extends Win32Enum {

    /**
     * Native name: D3DKMDT_COLORSPACE_TRANSFORM_STAGE_CONTROL_NO_CHANGE
     * @type {Integer (Int32)}
     */
    static NO_CHANGE => 0

    /**
     * Native name: D3DKMDT_COLORSPACE_TRANSFORM_STAGE_CONTROL_ENABLE
     * @type {Integer (Int32)}
     */
    static ENABLE => 1

    /**
     * Native name: D3DKMDT_COLORSPACE_TRANSFORM_STAGE_CONTROL_BYPASS
     * @type {Integer (Int32)}
     */
    static BYPASS => 2
}
