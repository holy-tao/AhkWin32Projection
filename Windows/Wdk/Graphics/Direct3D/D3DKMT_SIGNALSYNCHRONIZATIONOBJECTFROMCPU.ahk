#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_SIGNALSYNCHRONIZATIONOBJECTFROMCPU {
    #StructPack 8

    hDevice : UInt32

    ObjectCount : UInt32

    ObjectHandleArray : IntPtr

    FenceValueArray : IntPtr

    Flags : IntPtr

}
