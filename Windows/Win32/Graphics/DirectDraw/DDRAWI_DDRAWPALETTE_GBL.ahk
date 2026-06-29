#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Gdi\HPALETTE.ahk" { HPALETTE }
#Import "..\Gdi\PALETTEENTRY.ahk" { PALETTEENTRY }
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDRAWI_DDRAWPALETTE_GBL {
    #StructPack 8

    dwRefCnt : UInt32

    dwFlags : UInt32

    __lpDD_lcl_ptr : IntPtr
    lpDD_lcl {
        get => (addr := this.__lpDD_lcl_ptr) ? DDRAWI_DIRECTDRAW_LCL.At(addr) : unset
        set => this.__lpDD_lcl_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    dwProcessId : UInt32

    lpColorTable : PALETTEENTRY.Ptr

    dwReserved1 : IntPtr

    dwDriverReserved : UInt32

    dwContentsStamp : UInt32

    dwSaveStamp : UInt32

    dwHandle : UInt32

    static __New() {
        DefineProp(this.Prototype, 'hHELGDIPalette', { type: HPALETTE, offset: 32 })
        this.DeleteProp("__New")
    }
}
