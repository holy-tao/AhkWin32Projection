#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_ADAPTER_VERIFIER_VIDMM_TRIM_INTERVAL {
    #StructPack 8

    MinimumTrimInterval : Int64

    MaximumTrimInterval : Int64

    IdleTrimInterval : Int64

}
