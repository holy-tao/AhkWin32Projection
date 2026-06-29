#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMDT_PALETTEDATA.ahk" { D3DKMDT_PALETTEDATA }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKARG_SETPALETTE {
    #StructPack 8

    VidPnSourceId : UInt32

    FirstEntry : UInt32

    NumEntries : UInt32

    pLookupTable : D3DKMDT_PALETTEDATA.Ptr

}
