#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDCOLORKEY.ahk
#Include .\DDPIXELFORMAT.ahk
#Include .\DDSCAPS.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDSURFACEDESC extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwHeight {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwWidth {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    lPitch {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwLinearSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwBackBufferCount {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    dwMipMapCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwZBufferBitDepth {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwRefreshRate {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwAlphaBitDepth {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<Void>}
     */
    lpSurface {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {DDCOLORKEY}
     */
    ddckCKDestOverlay{
        get {
            if(!this.HasProp("__ddckCKDestOverlay"))
                this.__ddckCKDestOverlay := DDCOLORKEY(this.ptr + 48)
            return this.__ddckCKDestOverlay
        }
    }

    /**
     * @type {DDCOLORKEY}
     */
    ddckCKDestBlt{
        get {
            if(!this.HasProp("__ddckCKDestBlt"))
                this.__ddckCKDestBlt := DDCOLORKEY(this.ptr + 56)
            return this.__ddckCKDestBlt
        }
    }

    /**
     * @type {DDCOLORKEY}
     */
    ddckCKSrcOverlay{
        get {
            if(!this.HasProp("__ddckCKSrcOverlay"))
                this.__ddckCKSrcOverlay := DDCOLORKEY(this.ptr + 64)
            return this.__ddckCKSrcOverlay
        }
    }

    /**
     * @type {DDCOLORKEY}
     */
    ddckCKSrcBlt{
        get {
            if(!this.HasProp("__ddckCKSrcBlt"))
                this.__ddckCKSrcBlt := DDCOLORKEY(this.ptr + 72)
            return this.__ddckCKSrcBlt
        }
    }

    /**
     * @type {DDPIXELFORMAT}
     */
    ddpfPixelFormat{
        get {
            if(!this.HasProp("__ddpfPixelFormat"))
                this.__ddpfPixelFormat := DDPIXELFORMAT(this.ptr + 80)
            return this.__ddpfPixelFormat
        }
    }

    /**
     * @type {DDSCAPS}
     */
    ddsCaps{
        get {
            if(!this.HasProp("__ddsCaps"))
                this.__ddsCaps := DDSCAPS(this.ptr + 112)
            return this.__ddsCaps
        }
    }
}
