#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_DEVICEESCAPE_TYPE.ahk" { D3DKMT_DEVICEESCAPE_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_DEVICE_ESCAPE {
    #StructPack 4


    struct _VidPnFromAllocation {
        hPrimaryAllocation : UInt32

        VidPnSourceId : UInt32

    }

    Type : D3DKMT_DEVICEESCAPE_TYPE

    VidPnFromAllocation : D3DKMT_DEVICE_ESCAPE._VidPnFromAllocation

}
