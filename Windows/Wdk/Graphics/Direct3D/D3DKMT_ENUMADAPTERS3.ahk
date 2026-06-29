#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_ADAPTERINFO.ahk" { D3DKMT_ADAPTERINFO }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_ENUMADAPTERS3 {
    #StructPack 8

    Filter : IntPtr

    NumAdapters : UInt32

    pAdapters : D3DKMT_ADAPTERINFO.Ptr

}
