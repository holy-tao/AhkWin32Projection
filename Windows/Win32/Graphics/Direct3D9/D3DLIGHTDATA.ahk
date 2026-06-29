#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DTLVERTEX.ahk" { D3DTLVERTEX }
#Import ".\D3DLIGHTINGELEMENT.ahk" { D3DLIGHTINGELEMENT }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DLIGHTDATA {
    #StructPack 8

    dwSize : UInt32

    lpIn : D3DLIGHTINGELEMENT.Ptr

    dwInSize : UInt32

    lpOut : D3DTLVERTEX.Ptr

    dwOutSize : UInt32

}
