#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_DESTROYOVERLAY {
    #StructPack 4

    hDevice : UInt32

    hOverlay : UInt32

}
