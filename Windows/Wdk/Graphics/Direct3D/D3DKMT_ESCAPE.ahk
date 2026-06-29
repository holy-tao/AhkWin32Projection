#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_ESCAPETYPE.ahk" { D3DKMT_ESCAPETYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_ESCAPE {
    #StructPack 8

    hAdapter : UInt32

    hDevice : UInt32

    Type : D3DKMT_ESCAPETYPE

    Flags : IntPtr

    pPrivateDriverData : IntPtr

    PrivateDriverDataSize : UInt32

    hContext : UInt32

}
