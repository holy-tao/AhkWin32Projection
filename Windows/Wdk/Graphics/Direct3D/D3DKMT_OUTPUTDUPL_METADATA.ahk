#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_OUTPUTDUPL_METADATATYPE.ahk" { D3DKMT_OUTPUTDUPL_METADATATYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_OUTPUTDUPL_METADATA {
    #StructPack 8

    hAdapter : UInt32

    VidPnSourceId : UInt32

    Type : D3DKMT_OUTPUTDUPL_METADATATYPE

    BufferSizeSupplied : UInt32

    pBuffer : IntPtr

    BufferSizeRequired : UInt32

}
