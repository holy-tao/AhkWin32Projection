#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_PROGRAM_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_PROGRAM_TYPE_GENERIC_PIPELINE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_PROGRAM_TYPE_RAYTRACING_PIPELINE => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_PROGRAM_TYPE_WORK_GRAPH => 5
}
