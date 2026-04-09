#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_EXECUTE_INDIRECT_TIER extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_EXECUTE_INDIRECT_TIER_1_0 => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_EXECUTE_INDIRECT_TIER_1_1 => 11
}
