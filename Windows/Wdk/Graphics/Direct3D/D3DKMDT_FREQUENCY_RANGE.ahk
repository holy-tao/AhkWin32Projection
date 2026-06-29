#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_FREQUENCY_RANGE {
    #StructPack 8

    MinVSyncFreq : IntPtr

    MaxVSyncFreq : IntPtr

    MinHSyncFreq : IntPtr

    MaxHSyncFreq : IntPtr

}
