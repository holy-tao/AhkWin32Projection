#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMDT_COLORSPACE_TRANSFORM_STAGE_CONTROL.ahk" { D3DKMDT_COLORSPACE_TRANSFORM_STAGE_CONTROL }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_COLORSPACE_TRANSFORM_MATRIX_V2 {
    #StructPack 8

    StageControlLookupTable1DDegamma : D3DKMDT_COLORSPACE_TRANSFORM_STAGE_CONTROL

    LookupTable1DDegamma : IntPtr[4096]

    StageControlColorMatrix3x3 : D3DKMDT_COLORSPACE_TRANSFORM_STAGE_CONTROL

    ColorMatrix3x3 : Float32[9]

    StageControlLookupTable1DRegamma : D3DKMDT_COLORSPACE_TRANSFORM_STAGE_CONTROL

    LookupTable1DRegamma : IntPtr[4096]

}
