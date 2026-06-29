#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_SIGNALSYNCHRONIZATIONOBJECT {
    #StructPack 8

    hContext : UInt32

    ObjectCount : UInt32

    ObjectHandleArray : UInt32[32]

    Flags : IntPtr

}
