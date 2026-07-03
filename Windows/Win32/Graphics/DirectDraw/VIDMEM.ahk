#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDSCAPS.ahk" { DDSCAPS }
#Import ".\VMEMHEAP.ahk" { VMEMHEAP }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct VIDMEM {
    #StructPack 8

    dwFlags : UInt32

    fpStart : IntPtr

    fpEnd : IntPtr

    ddsCaps : DDSCAPS

    ddsCapsAlt : DDSCAPS

    lpHeap : VMEMHEAP.Ptr

    static __New() {
        DefineProp(this.Prototype, 'dwWidth', { type: UInt32, offset: 16 })
        DefineProp(this.Prototype, 'dwHeight', { type: UInt32, offset: 32 })
        this.DeleteProp("__New")
    }
}
