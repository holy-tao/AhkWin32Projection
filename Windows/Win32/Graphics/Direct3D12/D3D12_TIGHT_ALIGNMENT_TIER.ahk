#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_TIGHT_ALIGNMENT_TIER extends Win32Enum {

    /**
     * Native name: D3D12_TIGHT_ALIGNMENT_TIER_NOT_SUPPORTED
     * @type {Integer (Int32)}
     */
    static NOT_SUPPORTED => 0

    /**
     * Native name: D3D12_TIGHT_ALIGNMENT_TIER_1
     * @type {Integer (Int32)}
     */
    static 1 => 1
}
