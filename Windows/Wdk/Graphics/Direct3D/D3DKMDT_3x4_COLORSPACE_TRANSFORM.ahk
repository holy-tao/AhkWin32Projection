#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_3x4_COLORSPACE_TRANSFORM {
    #StructPack 8

    ColorMatrix3x4 : Float32[12]

    ScalarMultiplier : Float32

    LookupTable1D : IntPtr[4096]

}
