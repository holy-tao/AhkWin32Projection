#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_SEGMENTSIZEINFO {
    #StructPack 8

    DedicatedVideoMemorySize : Int64

    DedicatedSystemMemorySize : Int64

    SharedSystemMemorySize : Int64

}
