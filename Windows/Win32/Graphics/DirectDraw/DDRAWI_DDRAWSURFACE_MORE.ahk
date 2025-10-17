#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDSCAPSEX.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDRAWI_DDRAWSURFACE_MORE extends Win32Struct
{
    static sizeof => 240

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<IUNKNOWN_LIST>}
     */
    lpIUnknowns {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<DDRAWI_DIRECTDRAW_LCL>}
     */
    lpDD_lcl {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwPageLockCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwBytesAllocated {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Pointer<DDRAWI_DIRECTDRAW_INT>}
     */
    lpDD_int {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    dwMipMapCount {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer<DDRAWI_DDRAWCLIPPER_INT>}
     */
    lpDDIClipper {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<HEAPALIASINFO>}
     */
    lpHeapAliasInfo {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    dwOverlayFlags {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Pointer<Void>}
     */
    rgjunc {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<DDRAWI_DDVIDEOPORT_LCL>}
     */
    lpVideoPort {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<DDOVERLAYFX>}
     */
    lpddOverlayFX {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {DDSCAPSEX}
     */
    ddsCapsEx{
        get {
            if(!this.HasProp("__ddsCapsEx"))
                this.__ddsCapsEx := DDSCAPSEX(96, this)
            return this.__ddsCapsEx
        }
    }

    /**
     * @type {Integer}
     */
    dwTextureStage {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * @type {Pointer<Void>}
     */
    lpDDRAWReserved {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<Void>}
     */
    lpDDRAWReserved2 {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<Void>}
     */
    lpDDrawReserved3 {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    dwDDrawReserved4 {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {Pointer<Void>}
     */
    lpDDrawReserved5 {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * @type {Pointer<UInt32>}
     */
    lpGammaRamp {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Pointer<UInt32>}
     */
    lpOriginalGammaRamp {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * @type {Pointer<Void>}
     */
    lpDDrawReserved6 {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * @type {Integer}
     */
    dwSurfaceHandle {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * @type {Array<UInt32>}
     */
    qwDDrawReserved8{
        get {
            if(!this.HasProp("__qwDDrawReserved8ProxyArray"))
                this.__qwDDrawReserved8ProxyArray := Win32FixedArray(this.ptr + 180, 2, Primitive, "uint")
            return this.__qwDDrawReserved8ProxyArray
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    lpDDrawReserved9 {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * @type {Integer}
     */
    cSurfaces {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * @type {Pointer<DDSURFACEDESC2>}
     */
    pCreatedDDSurfaceDesc2 {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * @type {Pointer<DDRAWI_DDRAWSURFACE_LCL>}
     */
    slist {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }

    /**
     * @type {Integer}
     */
    dwFVF {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }

    /**
     * @type {Pointer<Void>}
     */
    lpVB {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }
}
