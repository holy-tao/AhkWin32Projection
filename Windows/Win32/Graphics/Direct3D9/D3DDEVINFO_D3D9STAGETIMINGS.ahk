#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DDEVINFO_D3D9STAGETIMINGS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Float}
     */
    MemoryProcessingPercent {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * @type {Float}
     */
    ComputationProcessingPercent {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}
