#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDVIDEOPORTCONNECT.ahk
#Include .\DDRAWI_DDRAWSURFACE_INT.ahk
#Include .\DDVIDEOPORTINFO.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DDRAWI_DDVIDEOPORT_INT.ahk
#Include .\DDVIDEOPORTDESC.ahk
#Include .\DDPIXELFORMAT.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\DDRAWI_DIRECTDRAW_LCL.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
class DDRAWI_DDVIDEOPORT_LCL extends Win32Struct {
    static sizeof => 320

    static packingSize => 8

    /**
     * @type {Pointer<DDRAWI_DIRECTDRAW_LCL>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {DDVIDEOPORTDESC}
     */
    ddvpDesc {
        get {
            if(!this.HasProp("__ddvpDesc"))
                this.__ddvpDesc := DDVIDEOPORTDESC(8, this)
            return this.__ddvpDesc
        }
    }

    /**
     * @type {DDVIDEOPORTINFO}
     */
    ddvpInfo {
        get {
            if(!this.HasProp("__ddvpInfo"))
                this.__ddvpInfo := DDVIDEOPORTINFO(96, this)
            return this.__ddvpInfo
        }
    }

    /**
     * @type {Pointer<DDRAWI_DDRAWSURFACE_INT>}
     */
    lpSurface {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * @type {Pointer<DDRAWI_DDRAWSURFACE_INT>}
     */
    lpVBISurface {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * @type {Pointer<Pointer<DDRAWI_DDRAWSURFACE_INT>>}
     */
    lpFlipInts {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * @type {Integer}
     */
    dwNumAutoflip {
        get => NumGet(this, 208, "uint")
        set => NumPut("uint", value, this, 208)
    }

    /**
     * @type {Integer}
     */
    dwProcessID {
        get => NumGet(this, 212, "uint")
        set => NumPut("uint", value, this, 212)
    }

    /**
     * @type {Integer}
     */
    dwStateFlags {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 220, "uint")
        set => NumPut("uint", value, this, 220)
    }

    /**
     * @type {Integer}
     */
    dwRefCnt {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }

    /**
     * @type {Pointer}
     */
    fpLastFlip {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }

    /**
     * @type {Pointer}
     */
    dwReserved1 {
        get => NumGet(this, 240, "ptr")
        set => NumPut("ptr", value, this, 240)
    }

    /**
     * @type {Pointer}
     */
    dwReserved2 {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }

    /**
     * @type {HANDLE}
     */
    hDDVideoPort {
        get {
            if(!this.HasProp("__hDDVideoPort"))
                this.__hDDVideoPort := HANDLE(256, this)
            return this.__hDDVideoPort
        }
    }

    /**
     * @type {Integer}
     */
    dwNumVBIAutoflip {
        get => NumGet(this, 264, "uint")
        set => NumPut("uint", value, this, 264)
    }

    /**
     * @type {Pointer<DDVIDEOPORTDESC>}
     */
    lpVBIDesc {
        get => NumGet(this, 272, "ptr")
        set => NumPut("ptr", value, this, 272)
    }

    /**
     * @type {Pointer<DDVIDEOPORTDESC>}
     */
    lpVideoDesc {
        get => NumGet(this, 280, "ptr")
        set => NumPut("ptr", value, this, 280)
    }

    /**
     * @type {Pointer<DDVIDEOPORTINFO>}
     */
    lpVBIInfo {
        get => NumGet(this, 288, "ptr")
        set => NumPut("ptr", value, this, 288)
    }

    /**
     * @type {Pointer<DDVIDEOPORTINFO>}
     */
    lpVideoInfo {
        get => NumGet(this, 296, "ptr")
        set => NumPut("ptr", value, this, 296)
    }

    /**
     * @type {Integer}
     */
    dwVBIProcessID {
        get => NumGet(this, 304, "uint")
        set => NumPut("uint", value, this, 304)
    }

    /**
     * @type {Pointer<DDRAWI_DDVIDEOPORT_INT>}
     */
    lpVPNotify {
        get => NumGet(this, 312, "ptr")
        set => NumPut("ptr", value, this, 312)
    }
}
