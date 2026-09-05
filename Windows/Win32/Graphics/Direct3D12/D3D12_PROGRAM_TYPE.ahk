#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_PROGRAM_TYPE extends Win32Enum {

    /**
     * Native name: D3D12_PROGRAM_TYPE_GENERIC_PIPELINE
     * @type {Integer (Int32)}
     */
    static GENERIC_PIPELINE => 1

    /**
     * Native name: D3D12_PROGRAM_TYPE_RAYTRACING_PIPELINE
     * @type {Integer (Int32)}
     */
    static RAYTRACING_PIPELINE => 4

    /**
     * Native name: D3D12_PROGRAM_TYPE_WORK_GRAPH
     * @type {Integer (Int32)}
     */
    static WORK_GRAPH => 5
}
