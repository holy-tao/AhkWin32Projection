#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMDT_COLORSPACE_TRANSFORM_STAGE_CONTROL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_COLORSPACE_TRANSFORM_STAGE_CONTROL_NO_CHANGE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_COLORSPACE_TRANSFORM_STAGE_CONTROL_ENABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_COLORSPACE_TRANSFORM_STAGE_CONTROL_BYPASS => 2
}
