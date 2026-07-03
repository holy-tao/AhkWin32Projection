#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDIFORMAT.ahk" { D3DDDIFORMAT }
#Import ".\D3DKMT_MULTISAMPLEMETHOD.ahk" { D3DKMT_MULTISAMPLEMETHOD }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_GETMULTISAMPLEMETHODLIST {
    #StructPack 8

    hAdapter : UInt32

    VidPnSourceId : UInt32

    Width : UInt32

    Height : UInt32

    Format : D3DDDIFORMAT

    pMethodList : D3DKMT_MULTISAMPLEMETHOD.Ptr

    MethodCount : UInt32

}
