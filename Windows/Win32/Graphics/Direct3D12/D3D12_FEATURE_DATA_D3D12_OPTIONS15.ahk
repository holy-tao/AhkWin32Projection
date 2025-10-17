#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_D3D12_OPTIONS15 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    TriangleFanSupported {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {BOOL}
     */
    DynamicIndexBufferStripCutSupported {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
