#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_QUERY_DATA_PIPELINE_STATISTICS1 {
    #StructPack 8

    IAVertices : Int64

    IAPrimitives : Int64

    VSInvocations : Int64

    GSInvocations : Int64

    GSPrimitives : Int64

    CInvocations : Int64

    CPrimitives : Int64

    PSInvocations : Int64

    HSInvocations : Int64

    DSInvocations : Int64

    CSInvocations : Int64

    ASInvocations : Int64

    MSInvocations : Int64

    MSPrimitives : Int64

}
