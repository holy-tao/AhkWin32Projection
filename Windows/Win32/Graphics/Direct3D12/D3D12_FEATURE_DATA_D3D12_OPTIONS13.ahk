#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * TBD
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options13
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_D3D12_OPTIONS13 {
    #StructPack 4

    /**
     * Type: \_Out\_ **[BOOL](/windows/win32/winprog/windows-data-types)**
     */
    UnrestrictedBufferTextureCopyPitchSupported : BOOL

    /**
     * Type: \_Out\_ **[BOOL](/windows/win32/winprog/windows-data-types)**
     */
    UnrestrictedVertexElementAlignmentSupported : BOOL

    /**
     * Type: \_Out\_ **[BOOL](/windows/win32/winprog/windows-data-types)**
     */
    InvertedViewportHeightFlipsYSupported : BOOL

    /**
     * Type: \_Out\_ **[BOOL](/windows/win32/winprog/windows-data-types)**
     */
    InvertedViewportDepthFlipsZSupported : BOOL

    /**
     * Type: \_Out\_ **[BOOL](/windows/win32/winprog/windows-data-types)**
     */
    TextureCopyBetweenDimensionsSupported : BOOL

    /**
     * Type: \_Out\_ **[BOOL](/windows/win32/winprog/windows-data-types)**
     */
    AlphaBlendFactorSupported : BOOL

}
