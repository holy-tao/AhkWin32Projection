#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDCOLORCONTROL.ahk" { DDCOLORCONTROL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDRAWI_DDRAWSURFACE_GBL_MORE {
    #StructPack 8

    dwSize : UInt32

    dwPhysicalPageTable : UInt32

    pPageTable : IntPtr

    cPages : UInt32

    dwSavedDCContext : IntPtr

    fpAliasedVidMem : IntPtr

    dwDriverReserved : IntPtr

    dwHELReserved : IntPtr

    cPageUnlocks : UInt32

    hKernelSurface : IntPtr

    dwKernelRefCnt : UInt32

    lpColorInfo : DDCOLORCONTROL.Ptr

    fpNTAlias : IntPtr

    dwContentsStamp : UInt32

    lpvUnswappedDriverReserved : IntPtr

    lpDDRAWReserved2 : IntPtr

    dwDDRAWReserved1 : UInt32

    dwDDRAWReserved2 : UInt32

    fpAliasOfVidMem : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'fpPhysicalVidMem', { type: IntPtr, offset: 8 })
        this.DeleteProp("__New")
    }
}
