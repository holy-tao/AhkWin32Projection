#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_TEXTURE_BARRIER_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_TEXTURE_BARRIER_FLAG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_TEXTURE_BARRIER_FLAG_DISCARD => 1
}
