#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_SAMPLER_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: D3D12_SAMPLER_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Native name: D3D12_SAMPLER_FLAG_UINT_BORDER_COLOR
     * @type {Integer (Int32)}
     */
    static FLAG_UINT_BORDER_COLOR => 1

    /**
     * Native name: D3D12_SAMPLER_FLAG_NON_NORMALIZED_COORDINATES
     * @type {Integer (Int32)}
     */
    static FLAG_NON_NORMALIZED_COORDINATES => 2
}
