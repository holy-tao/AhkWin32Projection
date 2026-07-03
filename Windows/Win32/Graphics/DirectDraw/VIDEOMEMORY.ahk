#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDSCAPS.ahk" { DDSCAPS }
#Import ".\VMEMHEAP.ahk" { VMEMHEAP }

/**
 * The VIDEOMEMORY structure allows the driver to manage its display memory into heaps.
 * @remarks
 * On Microsoft Windows 2000 and later the data structure is called VIDEOMEMORY and on Windows 98/Me the data structure is called VIDMEM.
 * 
 * GDI allocates and passes an array of VIDEOMEMORY structures to the second call of the driver's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvgetdirectdrawinfo">DrvGetDirectDrawInfo</a> function. The driver should fill in the appropriate members of each structure to describe each particular section of memory. The list provides a complete description of the driver's offscreen memory.
 * 
 * DirectDraw scans through to allocate its surfaces in the order the display memory heaps are listed. Heaps are managed in an array of VIDEOMEMORY structures. The memory allocated first will be the memory that is accessed first. The VIDEOMEMORY structure sets up certain starting points, and determines the amount of memory on the surface and what cannot be done with the surface. DirectDraw manages it by suballocating and deallocating memory, that is, creating and destroying surfaces under each heap's jurisdiction. Physical limits determine how to set up these attributes.
 * 
 * DirectDraw's heap manager makes two passes through the VIDEOMEMORY structures. The <b>ddsCaps</b> member indicates to DirectDraw what the memory in the heap cannot be used for on the first pass. For example, if the heap was just big enough for a back buffer, sprites could be excluded from being allocated on the first pass by setting the DSCAPS_OFFSCREENPLAIN flag in the <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550286(v=vs.85)">DDSCAPS</a> structure. That way, other surfaces would fill up with sprites, while preserving the back buffer for page flipping. The <b>ddsCapsAlt</b> member could be set to allow sprites on the second pass (by removing the DSCAPS_OFFSCREENPLAIN flag). This allows heaps to be used preferentially for their highest and best use, without ruling out alternative uses. By choosing the order of allocation carefully (for example, by listing the back buffer last), the need to sort by <b>ddsCaps</b> and <b>ddsCapsAlt</b> can sometimes be eliminated.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-videomemory
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct VIDEOMEMORY {
    #StructPack 8

    dwFlags : UInt32

    /**
     * Points to the starting address of a memory range in the heap.
     */
    fpStart : IntPtr

    fpEnd : IntPtr

    /**
     * Specifies a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550286(v=vs.85)">DDSCAPS</a> structure in which the driver returns the capabilities for which this section of memory cannot be used.
     */
    ddsCaps : DDSCAPS

    /**
     * Specifies a DDSCAPS structure in which the driver returns the capabilities for which this chunk of memory cannot be used when no other memory is found on the first pass.
     */
    ddsCapsAlt : DDSCAPS

    lpHeap : VMEMHEAP.Ptr

    static __New() {
        DefineProp(this.Prototype, 'dwWidth', { type: UInt32, offset: 16 })
        DefineProp(this.Prototype, 'dwHeight', { type: UInt32, offset: 32 })
        this.DeleteProp("__New")
    }
}
