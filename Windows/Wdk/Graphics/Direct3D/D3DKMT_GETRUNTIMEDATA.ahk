#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_GETRUNTIMEDATA {
    #StructPack 8

    hAdapter : UInt32

    hGlobalShare : UInt32

    pRuntimeData : IntPtr

    RuntimeDataSize : UInt32

}
