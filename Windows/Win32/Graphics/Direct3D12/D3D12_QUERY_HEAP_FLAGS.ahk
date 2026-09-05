#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_QUERY_HEAP_FLAGS extends Win32Enum {

    /**
     * Native name: D3D12_QUERY_HEAP_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Native name: D3D12_QUERY_HEAP_FLAG_CPU_RESOLVE
     * @type {Integer (Int32)}
     */
    static FLAG_CPU_RESOLVE => 1
}
