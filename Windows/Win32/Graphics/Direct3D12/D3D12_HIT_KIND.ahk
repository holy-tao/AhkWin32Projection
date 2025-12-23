#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_HIT_KIND extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_HIT_KIND_TRIANGLE_FRONT_FACE => 254

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_HIT_KIND_TRIANGLE_BACK_FACE => 255
}
