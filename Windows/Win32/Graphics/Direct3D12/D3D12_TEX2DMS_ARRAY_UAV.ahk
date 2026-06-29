#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_TEX2DMS_ARRAY_UAV {
    #StructPack 4

    FirstArraySlice : UInt32

    ArraySize : UInt32

}
