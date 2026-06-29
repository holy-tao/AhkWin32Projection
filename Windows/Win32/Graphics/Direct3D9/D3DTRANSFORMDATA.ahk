#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DRECT.ahk" { D3DRECT }
#Import ".\D3DHVERTEX.ahk" { D3DHVERTEX }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DTRANSFORMDATA {
    #StructPack 8

    dwSize : UInt32

    lpIn : IntPtr

    dwInSize : UInt32

    lpOut : IntPtr

    dwOutSize : UInt32

    lpHOut : D3DHVERTEX.Ptr

    dwClip : UInt32

    dwClipIntersection : UInt32

    dwClipUnion : UInt32

    drExtent : D3DRECT

}
