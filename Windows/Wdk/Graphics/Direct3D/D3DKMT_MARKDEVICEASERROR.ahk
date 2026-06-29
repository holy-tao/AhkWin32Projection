#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_DEVICE_ERROR_REASON.ahk" { D3DKMT_DEVICE_ERROR_REASON }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_MARKDEVICEASERROR {
    #StructPack 4

    hDevice : UInt32

    Reason : D3DKMT_DEVICE_ERROR_REASON

}
