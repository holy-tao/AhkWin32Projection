#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDRAWI_DDRAWCLIPPER_LCL.ahk" { DDRAWI_DDRAWCLIPPER_LCL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDRAWI_DDRAWCLIPPER_INT {
    #StructPack 8

    lpVtbl : IntPtr

    __lpLcl_ptr : IntPtr
    lpLcl {
        get => (addr := this.__lpLcl_ptr) ? DDRAWI_DDRAWCLIPPER_LCL.At(addr) : unset
        set => this.__lpLcl_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    lpLink : DDRAWI_DDRAWCLIPPER_INT.Ptr

    dwIntRefCnt : UInt32

}
