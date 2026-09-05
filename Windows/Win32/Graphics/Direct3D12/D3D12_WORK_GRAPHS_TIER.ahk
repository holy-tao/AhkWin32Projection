#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_WORK_GRAPHS_TIER extends Win32Enum {

    /**
     * Native name: D3D12_WORK_GRAPHS_TIER_NOT_SUPPORTED
     * @type {Integer (Int32)}
     */
    static NOT_SUPPORTED => 0

    /**
     * Native name: D3D12_WORK_GRAPHS_TIER_1_0
     * @type {Integer (Int32)}
     */
    static 1_0 => 10
}
