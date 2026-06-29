#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_OUTPUTDUPLCONTEXTSCOUNT {
    #StructPack 4

    VidPnSourceId : UInt32

    OutputDuplicationCount : UInt32

}
