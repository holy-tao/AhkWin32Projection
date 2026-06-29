#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDRAWI_DDMOTIONCOMP_LCL.ahk" { DDRAWI_DDMOTIONCOMP_LCL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDRAWI_DDMOTIONCOMP_INT {
    #StructPack 8

    lpVtbl : IntPtr

    __lpLcl_ptr : IntPtr
    lpLcl {
        get => (addr := this.__lpLcl_ptr) ? DDRAWI_DDMOTIONCOMP_LCL.At(addr) : unset
        set => this.__lpLcl_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    lpLink : DDRAWI_DDMOTIONCOMP_INT.Ptr

    dwIntRefCnt : UInt32

}
