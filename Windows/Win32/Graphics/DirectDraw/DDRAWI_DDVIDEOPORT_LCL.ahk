#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDVIDEOPORTCONNECT.ahk
#Include .\DDVIDEOPORTDESC.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\DDVIDEOPORTINFO.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDRAWI_DDVIDEOPORT_LCL extends Win32Struct
{
    static sizeof => 312

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
    ddvpDesc{
        get {
            if(!this.HasProp("__ddvpDesc"))
                this.__ddvpDesc := DDVIDEOPORTDESC(this.ptr + 8)
            return this.__ddvpDesc
        }
    }

    /**
     * @type {DDVIDEOPORTINFO}
     */
    ddvpInfo{
        get {
            if(!this.HasProp("__ddvpInfo"))
                this.__ddvpInfo := DDVIDEOPORTINFO(this.ptr + 88)
            return this.__ddvpInfo
        }
    }

    /**
     * @type {Pointer<DDRAWI_DDRAWSURFACE_INT>}
     */
    lpSurface {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * @type {Pointer<DDRAWI_DDRAWSURFACE_INT>}
     */
    lpVBISurface {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * @type {Pointer<DDRAWI_DDRAWSURFACE_INT>}
     */
    lpFlipInts {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * @type {Integer}
     */
    dwNumAutoflip {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * @type {Integer}
     */
    dwProcessID {
        get => NumGet(this, 204, "uint")
        set => NumPut("uint", value, this, 204)
    }

    /**
     * @type {Integer}
     */
    dwStateFlags {
        get => NumGet(this, 208, "uint")
        set => NumPut("uint", value, this, 208)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 212, "uint")
        set => NumPut("uint", value, this, 212)
    }

    /**
     * @type {Integer}
     */
    dwRefCnt {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * @type {Pointer}
     */
    fpLastFlip {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * @type {Pointer}
     */
    dwReserved1 {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }

    /**
     * @type {Pointer}
     */
    dwReserved2 {
        get => NumGet(this, 240, "ptr")
        set => NumPut("ptr", value, this, 240)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    hDDVideoPort {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }

    /**
     * @type {Integer}
     */
    dwNumVBIAutoflip {
        get => NumGet(this, 256, "uint")
        set => NumPut("uint", value, this, 256)
    }

    /**
     * @type {Pointer<DDVIDEOPORTDESC>}
     */
    lpVBIDesc {
        get => NumGet(this, 264, "ptr")
        set => NumPut("ptr", value, this, 264)
    }

    /**
     * @type {Pointer<DDVIDEOPORTDESC>}
     */
    lpVideoDesc {
        get => NumGet(this, 272, "ptr")
        set => NumPut("ptr", value, this, 272)
    }

    /**
     * @type {Pointer<DDVIDEOPORTINFO>}
     */
    lpVBIInfo {
        get => NumGet(this, 280, "ptr")
        set => NumPut("ptr", value, this, 280)
    }

    /**
     * @type {Pointer<DDVIDEOPORTINFO>}
     */
    lpVideoInfo {
        get => NumGet(this, 288, "ptr")
        set => NumPut("ptr", value, this, 288)
    }

    /**
     * @type {Integer}
     */
    dwVBIProcessID {
        get => NumGet(this, 296, "uint")
        set => NumPut("uint", value, this, 296)
    }

    /**
     * @type {Pointer<DDRAWI_DDVIDEOPORT_INT>}
     */
    lpVPNotify {
        get => NumGet(this, 304, "ptr")
        set => NumPut("ptr", value, this, 304)
    }
}
