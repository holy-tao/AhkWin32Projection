#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HEAPALIASINFO.ahk" { HEAPALIASINFO }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct ACCESSRECTLIST {
    #StructPack 8

    lpLink : ACCESSRECTLIST.Ptr

    rDest : RECT

    __lpOwner_ptr : IntPtr
    lpOwner {
        get => (addr := this.__lpOwner_ptr) ? DDRAWI_DIRECTDRAW_LCL.At(addr) : unset
        set => this.__lpOwner_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    lpSurfaceData : IntPtr

    dwFlags : UInt32

    lpHeapAliasInfo : HEAPALIASINFO.Ptr

}
