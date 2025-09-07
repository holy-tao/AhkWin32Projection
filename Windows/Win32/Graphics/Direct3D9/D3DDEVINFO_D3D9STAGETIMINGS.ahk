#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Percent of time processing shader data.
 * @remarks
 * For best performance, a balanced load is recommended.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddevinfo-d3d9stagetimings
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DDEVINFO_D3D9STAGETIMINGS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Percent of time in shader spent on memory accesses.
     * @type {Float}
     */
    MemoryProcessingPercent {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Percent of time processing (moving data around in registers or doing mathematical operations).
     * @type {Float}
     */
    ComputationProcessingPercent {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}
