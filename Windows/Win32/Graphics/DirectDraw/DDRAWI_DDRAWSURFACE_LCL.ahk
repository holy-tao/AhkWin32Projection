#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDSCAPS.ahk
#Include .\DDCOLORKEY.ahk
#Include .\DBLNODE.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDRAWI_DDRAWSURFACE_LCL extends Win32Struct
{
    static sizeof => 216

    static packingSize => 8

    /**
     * @type {Pointer<DDRAWI_DDRAWSURFACE_MORE>}
     */
    lpSurfMore {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<DDRAWI_DDRAWSURFACE_GBL>}
     */
    lpGbl {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    hDDSurface {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<ATTACHLIST>}
     */
    lpAttachList {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<ATTACHLIST>}
     */
    lpAttachListFrom {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    dwLocalRefCnt {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwProcessId {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {DDSCAPS}
     */
    ddsCaps{
        get {
            if(!this.HasProp("__ddsCaps"))
                this.__ddsCaps := DDSCAPS(this.ptr + 52)
            return this.__ddsCaps
        }
    }

    /**
     * @type {Pointer<DDRAWI_DDRAWPALETTE_INT>}
     */
    lpDDPalette {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<DDRAWI_DDRAWPALETTE_INT>}
     */
    lp16DDPalette {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<DDRAWI_DDRAWCLIPPER_LCL>}
     */
    lpDDClipper {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<DDRAWI_DDRAWCLIPPER_INT>}
     */
    lp16DDClipper {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    dwModeCreatedIn {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    dwBackBufferCount {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {DDCOLORKEY}
     */
    ddckCKDestBlt{
        get {
            if(!this.HasProp("__ddckCKDestBlt"))
                this.__ddckCKDestBlt := DDCOLORKEY(this.ptr + 80)
            return this.__ddckCKDestBlt
        }
    }

    /**
     * @type {DDCOLORKEY}
     */
    ddckCKSrcBlt{
        get {
            if(!this.HasProp("__ddckCKSrcBlt"))
                this.__ddckCKSrcBlt := DDCOLORKEY(this.ptr + 88)
            return this.__ddckCKSrcBlt
        }
    }

    /**
     * @type {Pointer}
     */
    hDC {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer}
     */
    dwReserved1 {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {DDCOLORKEY}
     */
    ddckCKSrcOverlay{
        get {
            if(!this.HasProp("__ddckCKSrcOverlay"))
                this.__ddckCKSrcOverlay := DDCOLORKEY(this.ptr + 112)
            return this.__ddckCKSrcOverlay
        }
    }

    /**
     * @type {DDCOLORKEY}
     */
    ddckCKDestOverlay{
        get {
            if(!this.HasProp("__ddckCKDestOverlay"))
                this.__ddckCKDestOverlay := DDCOLORKEY(this.ptr + 120)
            return this.__ddckCKDestOverlay
        }
    }

    /**
     * @type {Pointer<DDRAWI_DDRAWSURFACE_INT>}
     */
    lpSurfaceOverlaying {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {DBLNODE}
     */
    dbnOverlayNode{
        get {
            if(!this.HasProp("__dbnOverlayNode"))
                this.__dbnOverlayNode := DBLNODE(this.ptr + 136)
            return this.__dbnOverlayNode
        }
    }

    /**
     * @type {RECT}
     */
    rcOverlaySrc{
        get {
            if(!this.HasProp("__rcOverlaySrc"))
                this.__rcOverlaySrc := RECT(this.ptr + 168)
            return this.__rcOverlaySrc
        }
    }

    /**
     * @type {RECT}
     */
    rcOverlayDest{
        get {
            if(!this.HasProp("__rcOverlayDest"))
                this.__rcOverlayDest := RECT(this.ptr + 184)
            return this.__rcOverlayDest
        }
    }

    /**
     * @type {Integer}
     */
    dwClrXparent {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * @type {Integer}
     */
    dwAlpha {
        get => NumGet(this, 204, "uint")
        set => NumPut("uint", value, this, 204)
    }

    /**
     * @type {Integer}
     */
    lOverlayX {
        get => NumGet(this, 208, "int")
        set => NumPut("int", value, this, 208)
    }

    /**
     * @type {Integer}
     */
    lOverlayY {
        get => NumGet(this, 212, "int")
        set => NumPut("int", value, this, 212)
    }
}
