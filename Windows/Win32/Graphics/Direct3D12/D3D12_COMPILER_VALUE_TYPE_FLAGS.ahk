#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_COMPILER_VALUE_TYPE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: D3D12_COMPILER_VALUE_TYPE_FLAGS_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: D3D12_COMPILER_VALUE_TYPE_FLAGS_OBJECT_CODE
     * @type {Integer (Int32)}
     */
    static OBJECT_CODE => 1

    /**
     * Native name: D3D12_COMPILER_VALUE_TYPE_FLAGS_METADATA
     * @type {Integer (Int32)}
     */
    static METADATA => 2

    /**
     * Native name: D3D12_COMPILER_VALUE_TYPE_FLAGS_DEBUG_PDB
     * @type {Integer (Int32)}
     */
    static DEBUG_PDB => 4

    /**
     * Native name: D3D12_COMPILER_VALUE_TYPE_FLAGS_PERFORMANCE_DATA
     * @type {Integer (Int32)}
     */
    static PERFORMANCE_DATA => 8
}
