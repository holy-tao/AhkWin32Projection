#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_UPDATENONLOCALHEAPDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_GBL.Ptr

    dwHeap : UInt32

    fpGARTLin : IntPtr

    fpGARTDev : IntPtr

    ulPolicyMaxBytes : IntPtr

    ddRVal : HRESULT

    UpdateNonLocalHeap : IntPtr

}
