#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_PREEMPTION_INFORMATION {
    #StructPack 4

    PreemptionCounter : UInt32[16]

}
