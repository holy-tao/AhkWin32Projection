#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDSCAPS.ahk

/**
 * The VIDEOMEMORY structure allows the driver to manage its display memory into heaps.
 * @remarks
 * 
  * On Microsoft Windows 2000 and later the data structure is called VIDEOMEMORY and on Windows 98/Me the data structure is called VIDMEM.
  * 
  * GDI allocates and passes an array of VIDEOMEMORY structures to the second call of the driver's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvgetdirectdrawinfo">DrvGetDirectDrawInfo</a> function. The driver should fill in the appropriate members of each structure to describe each particular section of memory. The list provides a complete description of the driver's offscreen memory.
  * 
  * DirectDraw scans through to allocate its surfaces in the order the display memory heaps are listed. Heaps are managed in an array of VIDEOMEMORY structures. The memory allocated first will be the memory that is accessed first. The VIDEOMEMORY structure sets up certain starting points, and determines the amount of memory on the surface and what cannot be done with the surface. DirectDraw manages it by suballocating and deallocating memory, that is, creating and destroying surfaces under each heap's jurisdiction. Physical limits determine how to set up these attributes.
  * 
  * DirectDraw's heap manager makes two passes through the VIDEOMEMORY structures. The <b>ddsCaps</b> member indicates to DirectDraw what the memory in the heap cannot be used for on the first pass. For example, if the heap was just big enough for a back buffer, sprites could be excluded from being allocated on the first pass by setting the DSCAPS_OFFSCREENPLAIN flag in the <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550286(v=vs.85)">DDSCAPS</a> structure. That way, other surfaces would fill up with sprites, while preserving the back buffer for page flipping. The <b>ddsCapsAlt</b> member could be set to allow sprites on the second pass (by removing the DSCAPS_OFFSCREENPLAIN flag). This allows heaps to be used preferentially for their highest and best use, without ruling out alternative uses. By choosing the order of allocation carefully (for example, by listing the back buffer last), the need to sort by <b>ddsCaps</b> and <b>ddsCapsAlt</b> can sometimes be eliminated.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ddrawint/ns-ddrawint-videomemory
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class VIDEOMEMORY extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Points to the starting address of a memory range in the heap.
     * @type {Pointer}
     */
    fpStart {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    fpEnd {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwWidth {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550286(v=vs.85)">DDSCAPS</a> structure in which the driver returns the capabilities for which this section of memory cannot be used.
     * @type {DDSCAPS}
     */
    ddsCaps{
        get {
            if(!this.HasProp("__ddsCaps"))
                this.__ddsCaps := DDSCAPS(this.ptr + 28)
            return this.__ddsCaps
        }
    }

    /**
     * Specifies a DDSCAPS structure in which the driver returns the capabilities for which this chunk of memory cannot be used when no other memory is found on the first pass.
     * @type {DDSCAPS}
     */
    ddsCapsAlt{
        get {
            if(!this.HasProp("__ddsCapsAlt"))
                this.__ddsCapsAlt := DDSCAPS(this.ptr + 32)
            return this.__ddsCapsAlt
        }
    }

    /**
     * @type {Pointer<VMEMHEAP>}
     */
    lpHeap {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwHeight {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
