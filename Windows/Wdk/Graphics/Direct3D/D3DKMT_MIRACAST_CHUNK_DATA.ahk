#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_MIRACAST_CHUNK_DATA {
    #StructPack 8

    ChunkInfo : IntPtr

    PrivateDriverDataSize : UInt32

    PrivateDriverData : Int8[1]

}
