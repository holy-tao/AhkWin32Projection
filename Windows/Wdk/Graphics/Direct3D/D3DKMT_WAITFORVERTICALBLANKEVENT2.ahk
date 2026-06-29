#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_WAITFORVERTICALBLANKEVENT2 {
    #StructPack 8

    hAdapter : UInt32

    hDevice : UInt32

    VidPnSourceId : UInt32

    NumObjects : UInt32

    ObjectHandleArray : IntPtr[8]

}
