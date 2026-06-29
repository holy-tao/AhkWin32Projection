#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_DP2UPDATEPALETTE {
    #StructPack 4

    dwPaletteHandle : UInt32

    wStartIndex : UInt16

    wNumEntries : UInt16

}
