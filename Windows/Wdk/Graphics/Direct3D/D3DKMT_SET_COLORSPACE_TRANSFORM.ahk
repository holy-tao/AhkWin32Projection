#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDI_GAMMARAMP_TYPE.ahk" { D3DDDI_GAMMARAMP_TYPE }
#Import ".\D3DKMDT_3x4_COLORSPACE_TRANSFORM.ahk" { D3DKMDT_3x4_COLORSPACE_TRANSFORM }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_SET_COLORSPACE_TRANSFORM {
    #StructPack 8

    AdapterLuid : IntPtr

    VidPnTargetId : UInt32

    Type : D3DDDI_GAMMARAMP_TYPE

    Size : UInt32

    pColorSpaceTransform : D3DKMDT_3x4_COLORSPACE_TRANSFORM.Ptr

}
