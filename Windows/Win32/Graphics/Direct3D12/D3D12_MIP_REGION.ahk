#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the dimensions of a mip region.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_mip_region
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_MIP_REGION {
    #StructPack 4

    /**
     * The width of the mip region.
     */
    Width : UInt32

    /**
     * The height of the mip region.
     */
    Height : UInt32

    /**
     * The depth of the mip region.
     */
    Depth : UInt32

}
