#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options13
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_D3D12_OPTIONS13 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    UnrestrictedBufferTextureCopyPitchSupported {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {BOOL}
     */
    UnrestrictedVertexElementAlignmentSupported {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {BOOL}
     */
    InvertedViewportHeightFlipsYSupported {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {BOOL}
     */
    InvertedViewportDepthFlipsZSupported {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {BOOL}
     */
    TextureCopyBetweenDimensionsSupported {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {BOOL}
     */
    AlphaBlendFactorSupported {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
