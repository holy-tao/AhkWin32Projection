#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_DIRECTDRAW_LOCAL.ahk" { DD_DIRECTDRAW_LOCAL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_DESTROYDDLOCALDATA {
    #StructPack 8

    dwFlags : UInt32

    pDDLcl : DD_DIRECTDRAW_LOCAL.Ptr

    ddRVal : HRESULT

}
