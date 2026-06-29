#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_GETALLOCATIONPRIORITY {
    #StructPack 8

    hDevice : UInt32

    hResource : UInt32

    phAllocationList : IntPtr

    AllocationCount : UInt32

    pPriorities : IntPtr

}
