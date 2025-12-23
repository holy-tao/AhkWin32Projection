#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_NODE_OVERRIDES_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_NODE_OVERRIDES_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_NODE_OVERRIDES_TYPE_BROADCASTING_LAUNCH => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_NODE_OVERRIDES_TYPE_COALESCING_LAUNCH => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_NODE_OVERRIDES_TYPE_THREAD_LAUNCH => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_NODE_OVERRIDES_TYPE_COMMON_COMPUTE => 4
}
