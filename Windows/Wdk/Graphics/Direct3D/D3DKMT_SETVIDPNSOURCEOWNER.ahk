#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_VIDPNSOURCEOWNER_TYPE.ahk" { D3DKMT_VIDPNSOURCEOWNER_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_SETVIDPNSOURCEOWNER {
    #StructPack 8

    hDevice : UInt32

    pType : D3DKMT_VIDPNSOURCEOWNER_TYPE.Ptr

    pVidPnSourceId : IntPtr

    VidPnSourceCount : UInt32

}
