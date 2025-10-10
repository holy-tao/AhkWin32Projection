#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DDEVINFO_D3D9PIPELINETIMINGS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Float}
     */
    VertexProcessingTimePercent {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * @type {Float}
     */
    PixelProcessingTimePercent {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * @type {Float}
     */
    OtherGPUProcessingTimePercent {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * @type {Float}
     */
    GPUIdleTimePercent {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
