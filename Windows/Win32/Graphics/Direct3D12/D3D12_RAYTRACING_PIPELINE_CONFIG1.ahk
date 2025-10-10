#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RAYTRACING_PIPELINE_CONFIG1 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    MaxTraceRecursionDepth {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
