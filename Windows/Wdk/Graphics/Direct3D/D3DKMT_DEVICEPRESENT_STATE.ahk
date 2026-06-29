#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_DEVICEPRESENT_STATE {
    #StructPack 8

    VidPnSourceId : UInt32

    PresentStats : IntPtr

}
