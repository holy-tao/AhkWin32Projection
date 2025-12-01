#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDCOLORKEY.ahk

/**
 * The DDBLTFX structure passes raster operations (ROPs), effects, and override information to the IDirectDrawSurface7::Blt method. This structure is also part of the DDBLTBATCH structure that is used with the IDirectDrawSurface7::BltBatch method.
 * @remarks
 * The unions in this structure have been updated to work with compilers that do not support nameless unions. If your compiler does not support nameless unions, define the NONAMELESSUNION token before including the Ddraw.h header file.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/ns-ddraw-ddbltfx
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDBLTFX extends Win32Struct
{
    static sizeof => 128

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
     * Type of FX operations. The following types are defined.
     * @type {Integer}
     */
    dwDDFX {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Win32 raster operations. You can retrieve a list of supported raster operations by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-getcaps">IDirectDraw7::GetCaps</a> method.
     * @type {Integer}
     */
    dwROP {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * DirectDraw raster operations.
     * @type {Integer}
     */
    dwDDROP {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Rotation angle for the bitblt.
     * @type {Integer}
     */
    dwRotationAngle {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Z-buffer compares.
     * @type {Integer}
     */
    dwZBufferOpCode {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Low limit of a z-buffer.
     * @type {Integer}
     */
    dwZBufferLow {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * High limit of a z-buffer.
     * @type {Integer}
     */
    dwZBufferHigh {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Destination base value of a z-buffer.
     * @type {Integer}
     */
    dwZBufferBaseDest {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Bit depth of the destination z-constant.
     * @type {Integer}
     */
    dwZDestConstBitDepth {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    dwZDestConst {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {IDirectDrawSurface}
     */
    lpDDSZBufferDest {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Bit depth of the source z-constant.
     * @type {Integer}
     */
    dwZSrcConstBitDepth {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    dwZSrcConst {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {IDirectDrawSurface}
     */
    lpDDSZBufferSrc {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Bit depth of the constant for an alpha edge blend.
     * @type {Integer}
     */
    dwAlphaEdgeBlendBitDepth {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Alpha constant used for edge blending.
     * @type {Integer}
     */
    dwAlphaEdgeBlend {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Reserved
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Bit depth of the destination alpha constant.
     * @type {Integer}
     */
    dwAlphaDestConstBitDepth {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    dwAlphaDestConst {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {IDirectDrawSurface}
     */
    lpDDSAlphaDest {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Bit depth of the source alpha constant.
     * @type {Integer}
     */
    dwAlphaSrcConstBitDepth {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    dwAlphaSrcConst {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {IDirectDrawSurface}
     */
    lpDDSAlphaSrc {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    dwFillColor {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    dwFillDepth {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    dwFillPixel {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {IDirectDrawSurface}
     */
    lpDDSPattern {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Destination color key override.
     * @type {DDCOLORKEY}
     */
    ddckDestColorkey{
        get {
            if(!this.HasProp("__ddckDestColorkey"))
                this.__ddckDestColorkey := DDCOLORKEY(112, this)
            return this.__ddckDestColorkey
        }
    }

    /**
     * Source color key override.
     * @type {DDCOLORKEY}
     */
    ddckSrcColorkey{
        get {
            if(!this.HasProp("__ddckSrcColorkey"))
                this.__ddckSrcColorkey := DDCOLORKEY(120, this)
            return this.__ddckSrcColorkey
        }
    }
}
