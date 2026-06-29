#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_DISPLAYMODE.ahk" { D3DKMT_DISPLAYMODE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_GETDISPLAYMODELIST {
    #StructPack 8

    hAdapter : UInt32

    VidPnSourceId : UInt32

    pModeList : D3DKMT_DISPLAYMODE.Ptr

    ModeCount : UInt32

}
