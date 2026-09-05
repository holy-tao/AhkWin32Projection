#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_NODE_OVERRIDES_TYPE extends Win32Enum {

    /**
     * Native name: D3D12_NODE_OVERRIDES_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: D3D12_NODE_OVERRIDES_TYPE_BROADCASTING_LAUNCH
     * @type {Integer (Int32)}
     */
    static BROADCASTING_LAUNCH => 1

    /**
     * Native name: D3D12_NODE_OVERRIDES_TYPE_COALESCING_LAUNCH
     * @type {Integer (Int32)}
     */
    static COALESCING_LAUNCH => 2

    /**
     * Native name: D3D12_NODE_OVERRIDES_TYPE_THREAD_LAUNCH
     * @type {Integer (Int32)}
     */
    static THREAD_LAUNCH => 3

    /**
     * Native name: D3D12_NODE_OVERRIDES_TYPE_COMMON_COMPUTE
     * @type {Integer (Int32)}
     */
    static COMMON_COMPUTE => 4
}
