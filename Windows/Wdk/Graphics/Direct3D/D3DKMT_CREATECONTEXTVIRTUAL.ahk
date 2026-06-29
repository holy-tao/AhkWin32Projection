#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_CLIENTHINT.ahk" { D3DKMT_CLIENTHINT }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_CREATECONTEXTVIRTUAL {
    #StructPack 8

    hDevice : UInt32

    NodeOrdinal : UInt32

    EngineAffinity : UInt32

    Flags : IntPtr

    pPrivateDriverData : IntPtr

    PrivateDriverDataSize : UInt32

    ClientHint : D3DKMT_CLIENTHINT

    hContext : UInt32

}
