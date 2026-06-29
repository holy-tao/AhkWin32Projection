#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_ADAPTERINFO.ahk" { D3DKMT_ADAPTERINFO }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_ENUMADAPTERS2 {
    #StructPack 8

    NumAdapters : UInt32

    pAdapters : D3DKMT_ADAPTERINFO.Ptr

}
