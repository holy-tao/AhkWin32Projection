#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATSTICS_PAGING_TRANSFER {
    #StructPack 8

    BytesFilled : Int64

    BytesDiscarded : Int64

    BytesMappedIntoAperture : Int64

    BytesUnmappedFromAperture : Int64

    BytesTransferredFromMdlToMemory : Int64

    BytesTransferredFromMemoryToMdl : Int64

    BytesTransferredFromApertureToMemory : Int64

    BytesTransferredFromMemoryToAperture : Int64

}
