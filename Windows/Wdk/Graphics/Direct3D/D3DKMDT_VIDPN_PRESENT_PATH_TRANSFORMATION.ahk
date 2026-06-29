#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMDT_VIDPN_PRESENT_PATH_ROTATION.ahk" { D3DKMDT_VIDPN_PRESENT_PATH_ROTATION }
#Import ".\D3DKMDT_VIDPN_PRESENT_PATH_SCALING.ahk" { D3DKMDT_VIDPN_PRESENT_PATH_SCALING }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_VIDPN_PRESENT_PATH_TRANSFORMATION {
    #StructPack 8

    Scaling : D3DKMDT_VIDPN_PRESENT_PATH_SCALING

    ScalingSupport : IntPtr

    Rotation : D3DKMDT_VIDPN_PRESENT_PATH_ROTATION

    RotationSupport : IntPtr

}
