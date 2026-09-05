#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_WORK_GRAPH_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: D3D12_WORK_GRAPH_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Native name: D3D12_WORK_GRAPH_FLAG_INCLUDE_ALL_AVAILABLE_NODES
     * @type {Integer (Int32)}
     */
    static FLAG_INCLUDE_ALL_AVAILABLE_NODES => 1
}
