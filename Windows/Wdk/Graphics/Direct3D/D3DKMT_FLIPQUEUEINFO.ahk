#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_FLIPQUEUEINFO {
    #StructPack 8

    MaxHardwareFlipQueueLength : UInt32

    MaxSoftwareFlipQueueLength : UInt32

    FlipFlags : IntPtr

}
