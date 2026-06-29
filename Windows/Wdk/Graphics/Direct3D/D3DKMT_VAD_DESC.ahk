#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_VAD_DESC {
    #StructPack 8

    VadIndex : UInt32

    VadAddress : Int64

    NumMappedRanges : UInt32

    VadType : UInt32

    StartAddress : Int64

    EndAddress : Int64

}
