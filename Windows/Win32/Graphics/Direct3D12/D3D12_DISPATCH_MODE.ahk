#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DISPATCH_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DISPATCH_MODE_NODE_CPU_INPUT => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DISPATCH_MODE_NODE_GPU_INPUT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DISPATCH_MODE_MULTI_NODE_CPU_INPUT => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DISPATCH_MODE_MULTI_NODE_GPU_INPUT => 3
}
