#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Gdi\RGNDATA.ahk" { RGNDATA }
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDRAWI_DDRAWCLIPPER_GBL {
    #StructPack 8

    dwRefCnt : UInt32

    dwFlags : UInt32

    __lpDD_ptr : IntPtr
    lpDD {
        get => (addr := this.__lpDD_ptr) ? DDRAWI_DIRECTDRAW_GBL.At(addr) : unset
        set => this.__lpDD_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    dwProcessId : UInt32

    dwReserved1 : IntPtr

    hWnd : IntPtr

    lpStaticClipList : RGNDATA.Ptr

}
