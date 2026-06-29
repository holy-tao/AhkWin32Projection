#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_MIRACAST_DRIVER_TYPE.ahk" { D3DKMT_MIRACAST_DRIVER_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERY_MIRACAST_DRIVER_TYPE {
    #StructPack 4

    MiracastDriverType : D3DKMT_MIRACAST_DRIVER_TYPE

}
