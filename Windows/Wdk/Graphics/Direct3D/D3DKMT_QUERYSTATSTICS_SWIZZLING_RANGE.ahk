#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATSTICS_SWIZZLING_RANGE {
    #StructPack 4

    NbRangesAcquired : UInt32

    NbRangesReleased : UInt32

}
