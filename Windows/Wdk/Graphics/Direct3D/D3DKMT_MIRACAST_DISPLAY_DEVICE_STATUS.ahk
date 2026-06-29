#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_MIRACAST_DISPLAY_DEVICE_STATE.ahk" { D3DKMT_MIRACAST_DISPLAY_DEVICE_STATE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_MIRACAST_DISPLAY_DEVICE_STATUS {
    #StructPack 4

    State : D3DKMT_MIRACAST_DISPLAY_DEVICE_STATE

}
