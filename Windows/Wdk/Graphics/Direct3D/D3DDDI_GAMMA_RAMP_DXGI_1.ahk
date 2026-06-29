#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_GAMMA_RAMP_DXGI_1 {
    #StructPack 8

    Scale : IntPtr

    Offset : IntPtr

    GammaCurve : IntPtr[1025]

}
