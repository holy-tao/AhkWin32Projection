#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_SETDISPLAYPRIVATEDRIVERFORMAT {
    #StructPack 4

    hDevice : UInt32

    VidPnSourceId : UInt32

    PrivateDriverFormatAttribute : UInt32

}
