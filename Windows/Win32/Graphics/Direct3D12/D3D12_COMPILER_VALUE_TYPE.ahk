#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_COMPILER_VALUE_TYPE extends Win32Enum {

    /**
     * Native name: D3D12_COMPILER_VALUE_TYPE_OBJECT_CODE
     * @type {Integer (Int32)}
     */
    static OBJECT_CODE => 0

    /**
     * Native name: D3D12_COMPILER_VALUE_TYPE_METADATA
     * @type {Integer (Int32)}
     */
    static METADATA => 1

    /**
     * Native name: D3D12_COMPILER_VALUE_TYPE_DEBUG_PDB
     * @type {Integer (Int32)}
     */
    static DEBUG_PDB => 2

    /**
     * Native name: D3D12_COMPILER_VALUE_TYPE_PERFORMANCE_DATA
     * @type {Integer (Int32)}
     */
    static PERFORMANCE_DATA => 3
}
