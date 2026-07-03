#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import ".\DDRAWI_DDRAWSURFACE_LCL.ahk" { DDRAWI_DDRAWSURFACE_LCL }
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }
#Import ".\LPDDHALSURFCB_LOCK.ahk" { LPDDHALSURFCB_LOCK }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_LOCKDATA {
    #StructPack 8

    lpDD : DDRAWI_DIRECTDRAW_GBL.Ptr

    lpDDSurface : DDRAWI_DDRAWSURFACE_LCL.Ptr

    bHasRect : UInt32

    rArea : RECTL

    lpSurfData : IntPtr

    ddRVal : HRESULT

    Lock : LPDDHALSURFCB_LOCK

    dwFlags : UInt32

}
