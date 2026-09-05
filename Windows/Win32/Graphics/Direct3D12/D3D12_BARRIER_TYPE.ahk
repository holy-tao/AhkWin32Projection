#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_BARRIER_TYPE extends Win32Enum {

    /**
     * Native name: D3D12_BARRIER_TYPE_GLOBAL
     * @type {Integer (Int32)}
     */
    static GLOBAL => 0

    /**
     * Native name: D3D12_BARRIER_TYPE_TEXTURE
     * @type {Integer (Int32)}
     */
    static TEXTURE => 1

    /**
     * Native name: D3D12_BARRIER_TYPE_BUFFER
     * @type {Integer (Int32)}
     */
    static BUFFER => 2
}
