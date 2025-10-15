#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDSCAPS.ahk
#Include .\SURFACEALIGNMENT.ahk

/**
 * The HEAPALIGNMENT structure contains data specifying the alignment requirements for a given display memory heap.
 * @remarks
 * 
  * The driver should verify that the <b>dwSize</b> member is at least as large as <b>sizeof</b>(HEAPALIGNMENT).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dmemmgr/ns-dmemmgr-heapalignment
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class HEAPALIGNMENT extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * Specifies the size in bytes of this HEAPALIGNMENT structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550286(v=vs.85)">DDSCAPS</a> structure that indicates what alignment fields are valid.
     * @type {DDSCAPS}
     */
    ddsCaps{
        get {
            if(!this.HasProp("__ddsCaps"))
                this.__ddsCaps := DDSCAPS(this.ptr + 4)
            return this.__ddsCaps
        }
    }

    /**
     * Reserved for system use.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/dmemmgr/ns-dmemmgr-surfacealignment">SURFACEALIGNMENT</a> structure that contains heap alignment requirements for surfaces tagged with DDSCAPS_EXECUTEBUFFER.
     * @type {SURFACEALIGNMENT}
     */
    ExecuteBuffer{
        get {
            if(!this.HasProp("__ExecuteBuffer"))
                this.__ExecuteBuffer := SURFACEALIGNMENT(this.ptr + 16)
            return this.__ExecuteBuffer
        }
    }

    /**
     * Specifies a SURFACEALIGNMENT structure that contains heap alignment requirements for surfaces tagged with DDSCAPS_OVERLAY.
     * @type {SURFACEALIGNMENT}
     */
    Overlay{
        get {
            if(!this.HasProp("__Overlay"))
                this.__Overlay := SURFACEALIGNMENT(this.ptr + 32)
            return this.__Overlay
        }
    }

    /**
     * Specifies a SURFACEALIGNMENT structure that contains heap alignment requirements for surfaces tagged with DDSCAPS_TEXTURE.
     * @type {SURFACEALIGNMENT}
     */
    Texture{
        get {
            if(!this.HasProp("__Texture"))
                this.__Texture := SURFACEALIGNMENT(this.ptr + 48)
            return this.__Texture
        }
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/dmemmgr/ns-dmemmgr-surfacealignment">SURFACEALIGNMENT</a> structure that contains heap alignment requirements for surfaces tagged with DDSCAPS_ZBUFFER.
     * @type {SURFACEALIGNMENT}
     */
    ZBuffer{
        get {
            if(!this.HasProp("__ZBuffer"))
                this.__ZBuffer := SURFACEALIGNMENT(this.ptr + 64)
            return this.__ZBuffer
        }
    }

    /**
     * Specifies a SURFACEALIGNMENT structure that contains heap alignment requirements for surfaces tagged with DDSCAPS_ALPHA.
     * @type {SURFACEALIGNMENT}
     */
    AlphaBuffer{
        get {
            if(!this.HasProp("__AlphaBuffer"))
                this.__AlphaBuffer := SURFACEALIGNMENT(this.ptr + 80)
            return this.__AlphaBuffer
        }
    }

    /**
     * Specifies a SURFACEALIGNMENT structure that contains heap alignment requirements for surfaces tagged with DDSCAPS_OFFSCREENPLAIN.
     * @type {SURFACEALIGNMENT}
     */
    Offscreen{
        get {
            if(!this.HasProp("__Offscreen"))
                this.__Offscreen := SURFACEALIGNMENT(this.ptr + 96)
            return this.__Offscreen
        }
    }

    /**
     * Specifies a SURFACEALIGNMENT structure that contains heap alignment requirements for surfaces tagged with DDSCAPS_FLIP.
     * @type {SURFACEALIGNMENT}
     */
    FlipTarget{
        get {
            if(!this.HasProp("__FlipTarget"))
                this.__FlipTarget := SURFACEALIGNMENT(this.ptr + 112)
            return this.__FlipTarget
        }
    }
}
