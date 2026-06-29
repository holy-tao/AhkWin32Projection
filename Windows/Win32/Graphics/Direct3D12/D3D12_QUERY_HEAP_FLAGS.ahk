#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_QUERY_HEAP_FLAGS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_QUERY_HEAP_FLAG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_QUERY_HEAP_FLAG_CPU_RESOLVE => 1
}
