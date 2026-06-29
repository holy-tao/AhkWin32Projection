#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SURFACEALIGNMENT structure is used by a display driver to describe the alignment restrictions for a surface being allocated by HeapVidMemAllocAligned.
 * @see https://learn.microsoft.com/windows/win32/api/dmemmgr/ns-dmemmgr-surfacealignment
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct SURFACEALIGNMENT {
    #StructPack 4


    struct _Linear {
        dwStartAlignment : UInt32

        dwPitchAlignment : UInt32

        dwFlags : UInt32

        dwReserved2 : UInt32

    }

    struct _Rectangular {
        dwXAlignment : UInt32

        dwYAlignment : UInt32

        dwFlags : UInt32

        dwReserved2 : UInt32

    }

    Linear : SURFACEALIGNMENT._Linear

    static __New() {
        DefineProp(this.Prototype, 'Rectangular', { type: SURFACEALIGNMENT._Rectangular, offset: 0 })
        this.DeleteProp("__New")
    }
}
