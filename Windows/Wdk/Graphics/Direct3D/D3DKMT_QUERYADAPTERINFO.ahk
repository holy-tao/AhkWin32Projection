#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KMTQUERYADAPTERINFOTYPE.ahk" { KMTQUERYADAPTERINFOTYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYADAPTERINFO {
    #StructPack 8

    hAdapter : UInt32

    Type : KMTQUERYADAPTERINFOTYPE

    pPrivateDriverData : IntPtr

    PrivateDriverDataSize : UInt32

}
