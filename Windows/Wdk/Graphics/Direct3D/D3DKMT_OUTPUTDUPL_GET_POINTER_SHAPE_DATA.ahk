#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_OUTPUTDUPL_GET_POINTER_SHAPE_DATA {
    #StructPack 8

    hAdapter : UInt32

    VidPnSourceId : UInt32

    BufferSizeSupplied : UInt32

    pShapeBuffer : IntPtr

    BufferSizeRequired : UInt32

    ShapeInfo : IntPtr

}
