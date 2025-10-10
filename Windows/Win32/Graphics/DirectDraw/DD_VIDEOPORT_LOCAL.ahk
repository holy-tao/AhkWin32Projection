#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDVIDEOPORTCONNECT.ahk
#Include .\DDVIDEOPORTDESC.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\DDVIDEOPORTINFO.ahk

/**
 * The DD_VIDEOPORT_LOCAL structure contains video port extensions (VPE)-related data that is unique to an individual Microsoft DirectDraw VPE object.
 * @remarks
 * 
  * This structure is initialized and filled in by DirectDraw. Except for the <b>dwReserved1</b>, <b>dwReserved2</b>, and <b>dwReserved3</b> members, the driver must not modify any other members of the DD_VIDEOPORT_LOCAL structure.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ddrawint/ns-ddrawint-dd_videoport_local
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_VIDEOPORT_LOCAL extends Win32Struct
{
    static sizeof => 224

    static packingSize => 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_local">DD_DIRECTDRAW_LOCAL</a> structure that is relevant to the current DirectDraw process only.
     * @type {Pointer<TypeHandle>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/dvp/ns-dvp-ddvideoportdesc">DDVIDEOPORTDESC</a> structure that describes the VPE object.
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
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/dvp/ns-dvp-ddvideoportinfo">DDVIDEOPORTINFO</a> structure that describes the transfer of video data to a surface.
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
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_int">DD_SURFACE_INT</a> structure for the surface receiving the video data.
     * @type {Pointer<TypeHandle>}
     */
    lpSurface {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * Points to a DD_SURFACE_INT structure for the surface receiving the <a href="https://docs.microsoft.com/windows-hardware/drivers/">VBI</a> data.
     * @type {Pointer<TypeHandle>}
     */
    lpVBISurface {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * Specifies the number of current autoflip surfaces.
     * @type {Integer}
     */
    dwNumAutoflip {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * Specifies the number of VBI surfaces currently being autoflipped.
     * @type {Integer}
     */
    dwNumVBIAutoflip {
        get => NumGet(this, 196, "uint")
        set => NumPut("uint", value, this, 196)
    }

    /**
     * Reserved for use by the display driver.
     * @type {Pointer}
     */
    dwReserved1 {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * Reserved for use by the display driver.
     * @type {Pointer}
     */
    dwReserved2 {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * Reserved for use by the display driver.
     * @type {Pointer}
     */
    dwReserved3 {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }
}
