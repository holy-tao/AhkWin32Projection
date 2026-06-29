#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDRAWI_DDMOTIONCOMP_LCL {
    #StructPack 8

    __lpDD_ptr : IntPtr
    lpDD {
        get => (addr := this.__lpDD_ptr) ? DDRAWI_DIRECTDRAW_LCL.At(addr) : unset
        set => this.__lpDD_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    guid : Guid

    dwUncompWidth : UInt32

    dwUncompHeight : UInt32

    ddUncompPixelFormat : DDPIXELFORMAT

    dwInternalFlags : UInt32

    dwRefCnt : UInt32

    dwProcessId : UInt32

    hMoComp : HANDLE

    dwDriverReserved1 : UInt32

    dwDriverReserved2 : UInt32

    dwDriverReserved3 : UInt32

    lpDriverReserved1 : IntPtr

    lpDriverReserved2 : IntPtr

    lpDriverReserved3 : IntPtr

}
