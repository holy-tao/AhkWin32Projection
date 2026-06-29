#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXGK_MIRACAST_CHUNK_TYPE.ahk" { DXGK_MIRACAST_CHUNK_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_MIRACAST_CHUNK_INFO {
    #StructPack 8

    ChunkType : DXGK_MIRACAST_CHUNK_TYPE

    ChunkId : IntPtr

    ProcessingTime : UInt32

    EncodeRate : UInt32

}
