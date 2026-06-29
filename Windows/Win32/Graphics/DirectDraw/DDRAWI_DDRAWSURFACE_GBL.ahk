#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ACCESSRECTLIST.ahk" { ACCESSRECTLIST }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import ".\VMEMHEAP.ahk" { VMEMHEAP }
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDRAWI_DDRAWSURFACE_GBL {
    #StructPack 8

    dwRefCnt : UInt32

    dwGlobalFlags : UInt32

    __lpRectList_ptr : IntPtr
    lpRectList {
        get => (addr := this.__lpRectList_ptr) ? ACCESSRECTLIST.At(addr) : unset
        set => this.__lpRectList_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    lpVidMemHeap : VMEMHEAP.Ptr

    __lpDD_ptr : IntPtr
    lpDD {
        get => (addr := this.__lpDD_ptr) ? DDRAWI_DIRECTDRAW_GBL.At(addr) : unset
        set => this.__lpDD_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    fpVidMem : IntPtr

    lPitch : Int32

    wHeight : UInt16

    wWidth : UInt16

    dwUsageCount : UInt32

    dwReserved1 : IntPtr

    ddpfSurface : DDPIXELFORMAT

    static __New() {
        DefineProp(this.Prototype, 'dwBlockSizeY', { type: UInt32, offset: 8 })
        DefineProp(this.Prototype, 'lSlicePitch', { type: Int32, offset: 8 })
        DefineProp(this.Prototype, 'dwBlockSizeX', { type: UInt32, offset: 16 })
        DefineProp(this.Prototype, 'lpDDHandle', { type: IntPtr, offset: 24 })
        DefineProp(this.Prototype, 'dwLinearSize', { type: UInt32, offset: 40 })
        this.DeleteProp("__New")
    }
}
