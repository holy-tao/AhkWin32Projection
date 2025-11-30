#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_COMPILER_VALUE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMPILER_VALUE_TYPE_OBJECT_CODE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMPILER_VALUE_TYPE_METADATA => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMPILER_VALUE_TYPE_DEBUG_PDB => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMPILER_VALUE_TYPE_PERFORMANCE_DATA => 3
}
