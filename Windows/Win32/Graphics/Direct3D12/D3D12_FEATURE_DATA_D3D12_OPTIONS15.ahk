#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_D3D12_OPTIONS15 {
    #StructPack 4

    TriangleFanSupported : BOOL

    DynamicIndexBufferStripCutSupported : BOOL

}
