#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_HIT_KIND extends Win32Enum {

    /**
     * Native name: D3D12_HIT_KIND_TRIANGLE_FRONT_FACE
     * @type {Integer (Int32)}
     */
    static TRIANGLE_FRONT_FACE => 254

    /**
     * Native name: D3D12_HIT_KIND_TRIANGLE_BACK_FACE
     * @type {Integer (Int32)}
     */
    static TRIANGLE_BACK_FACE => 255
}
