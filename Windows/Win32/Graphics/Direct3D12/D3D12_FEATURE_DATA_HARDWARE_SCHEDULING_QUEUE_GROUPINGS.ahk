#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_HARDWARE_SCHEDULING_QUEUE_GROUPINGS {
    #StructPack 4

    ComputeQueuesPer3DQueue : UInt32

}
