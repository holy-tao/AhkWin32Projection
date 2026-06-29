#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_UNPINDIRECTFLIPRESOURCES {
    #StructPack 8

    hDevice : UInt32

    ResourceCount : UInt32

    pResourceList : IntPtr

}
