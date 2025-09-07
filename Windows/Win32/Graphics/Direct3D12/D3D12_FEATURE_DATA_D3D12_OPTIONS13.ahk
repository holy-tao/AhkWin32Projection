#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * TBD
 * @remarks
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
     * Type: \_Out\_ **[BOOL](/windows/win32/winprog/windows-data-types)**
     * @type {Integer}
     */
    UnrestrictedBufferTextureCopyPitchSupported {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: \_Out\_ **[BOOL](/windows/win32/winprog/windows-data-types)**
     * @type {Integer}
     */
    UnrestrictedVertexElementAlignmentSupported {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: \_Out\_ **[BOOL](/windows/win32/winprog/windows-data-types)**
     * @type {Integer}
     */
    InvertedViewportHeightFlipsYSupported {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: \_Out\_ **[BOOL](/windows/win32/winprog/windows-data-types)**
     * @type {Integer}
     */
    InvertedViewportDepthFlipsZSupported {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: \_Out\_ **[BOOL](/windows/win32/winprog/windows-data-types)**
     * @type {Integer}
     */
    TextureCopyBetweenDimensionsSupported {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: \_Out\_ **[BOOL](/windows/win32/winprog/windows-data-types)**
     * @type {Integer}
     */
    AlphaBlendFactorSupported {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
