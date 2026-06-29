#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYRESOURCEINFO {
    #StructPack 8

    hDevice : UInt32

    hGlobalShare : UInt32

    pPrivateRuntimeData : IntPtr

    PrivateRuntimeDataSize : UInt32

    TotalPrivateDriverDataSize : UInt32

    ResourcePrivateDriverDataSize : UInt32

    NumAllocations : UInt32

}
