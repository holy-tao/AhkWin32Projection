#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDRAWI_DDRAWPALETTE_GBL.ahk" { DDRAWI_DDRAWPALETTE_GBL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDRAWI_DDRAWPALETTE_LCL {
    #StructPack 8

    lpPalMore : UInt32

    __lpGbl_ptr : IntPtr
    lpGbl {
        get => (addr := this.__lpGbl_ptr) ? DDRAWI_DDRAWPALETTE_GBL.At(addr) : unset
        set => this.__lpGbl_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    dwUnused0 : IntPtr

    dwLocalRefCnt : UInt32

    pUnkOuter : IUnknown

    __lpDD_lcl_ptr : IntPtr
    lpDD_lcl {
        get => (addr := this.__lpDD_lcl_ptr) ? DDRAWI_DIRECTDRAW_LCL.At(addr) : unset
        set => this.__lpDD_lcl_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    dwReserved1 : IntPtr

    dwDDRAWReserved1 : IntPtr

    dwDDRAWReserved2 : IntPtr

    dwDDRAWReserved3 : IntPtr

}
