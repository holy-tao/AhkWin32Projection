#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_DISPATCH_MODE extends Win32Enum {

    /**
     * Native name: D3D12_DISPATCH_MODE_NODE_CPU_INPUT
     * @type {Integer (Int32)}
     */
    static NODE_CPU_INPUT => 0

    /**
     * Native name: D3D12_DISPATCH_MODE_NODE_GPU_INPUT
     * @type {Integer (Int32)}
     */
    static NODE_GPU_INPUT => 1

    /**
     * Native name: D3D12_DISPATCH_MODE_MULTI_NODE_CPU_INPUT
     * @type {Integer (Int32)}
     */
    static MULTI_NODE_CPU_INPUT => 2

    /**
     * Native name: D3D12_DISPATCH_MODE_MULTI_NODE_GPU_INPUT
     * @type {Integer (Int32)}
     */
    static MULTI_NODE_GPU_INPUT => 3
}
