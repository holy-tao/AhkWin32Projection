#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDCOLORKEY.ahk

/**
 * The DDOVERLAYFX structure passes overlay information to the IDirectDrawSurface7::UpdateOverlay method.
 * @remarks
 * The unions in this structure have been updated to work with compilers that do not support nameless unions. If your compiler does not support nameless unions, define the NONAMELESSUNION token before including the Ddraw.h header file.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/ns-ddraw-ddoverlayfx
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDOVERLAYFX extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Size of the structure, in bytes. This member must be initialized before the structure is used.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Bit depth used to specify the constant for an alpha edge blend.
     * @type {Integer}
     */
    dwAlphaEdgeBlendBitDepth {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Constant to use as the alpha for an edge blend.
     * @type {Integer}
     */
    dwAlphaEdgeBlend {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Reserved
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Bit depth used to specify the alpha constant for a destination.
     * @type {Integer}
     */
    dwAlphaDestConstBitDepth {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwAlphaDestConst {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<IDirectDrawSurface>}
     */
    lpDDSAlphaDest {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Bit depth used to specify the alpha constant for a source.
     * @type {Integer}
     */
    dwAlphaSrcConstBitDepth {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    dwAlphaSrcConst {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer<IDirectDrawSurface>}
     */
    lpDDSAlphaSrc {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Destination color key for the overlay.
     * @type {DDCOLORKEY}
     */
    dckDestColorkey{
        get {
            if(!this.HasProp("__dckDestColorkey"))
                this.__dckDestColorkey := DDCOLORKEY(this.ptr + 48)
            return this.__dckDestColorkey
        }
    }

    /**
     * Source color key for the overlay.
     * @type {DDCOLORKEY}
     */
    dckSrcColorkey{
        get {
            if(!this.HasProp("__dckSrcColorkey"))
                this.__dckSrcColorkey := DDCOLORKEY(this.ptr + 56)
            return this.__dckSrcColorkey
        }
    }

    /**
     * The following flags that specify overlay effects.
     * @type {Integer}
     */
    dwDDFX {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Currently not used and must be set to 0.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }
}
