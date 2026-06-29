#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_PRESENTHISTORYTOKEN.ahk" { D3DKMT_PRESENTHISTORYTOKEN }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_GETPRESENTHISTORY {
    #StructPack 8

    hAdapter : UInt32

    ProvidedSize : UInt32

    WrittenSize : UInt32

    pTokens : D3DKMT_PRESENTHISTORYTOKEN.Ptr

    NumTokens : UInt32

}
