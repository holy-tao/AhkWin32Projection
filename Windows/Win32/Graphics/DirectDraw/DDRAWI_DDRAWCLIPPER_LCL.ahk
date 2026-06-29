#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDRAWI_DDRAWCLIPPER_GBL.ahk" { DDRAWI_DDRAWCLIPPER_GBL }
#Import ".\DDRAWI_DIRECTDRAW_INT.ahk" { DDRAWI_DIRECTDRAW_INT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDRAWI_DDRAWCLIPPER_LCL {
    #StructPack 8

    lpClipMore : UInt32

    __lpGbl_ptr : IntPtr
    lpGbl {
        get => (addr := this.__lpGbl_ptr) ? DDRAWI_DDRAWCLIPPER_GBL.At(addr) : unset
        set => this.__lpGbl_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    __lpDD_lcl_ptr : IntPtr
    lpDD_lcl {
        get => (addr := this.__lpDD_lcl_ptr) ? DDRAWI_DIRECTDRAW_LCL.At(addr) : unset
        set => this.__lpDD_lcl_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    dwLocalRefCnt : UInt32

    pUnkOuter : IUnknown

    __lpDD_int_ptr : IntPtr
    lpDD_int {
        get => (addr := this.__lpDD_int_ptr) ? DDRAWI_DIRECTDRAW_INT.At(addr) : unset
        set => this.__lpDD_int_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    dwReserved1 : IntPtr

    pAddrefedThisOwner : IUnknown

}
