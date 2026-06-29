#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IDirectDrawSurface.ahk" { IDirectDrawSurface }
#Import ".\DDCOLORKEY.ahk" { DDCOLORKEY }

/**
 * The DDBLTFX structure passes raster operations (ROPs), effects, and override information to the IDirectDrawSurface7::Blt method. This structure is also part of the DDBLTBATCH structure that is used with the IDirectDrawSurface7::BltBatch method.
 * @remarks
 * The unions in this structure have been updated to work with compilers that do not support nameless unions. If your compiler does not support nameless unions, define the NONAMELESSUNION token before including the Ddraw.h header file.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/ns-ddraw-ddbltfx
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDBLTFX {
    #StructPack 8

    /**
     * Size of the structure, in bytes. This member must be initialized before the structure is used.
     */
    dwSize : UInt32

    /**
     * Type of FX operations. The following types are defined.
     */
    dwDDFX : UInt32

    /**
     * Win32 raster operations. You can retrieve a list of supported raster operations by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-getcaps">IDirectDraw7::GetCaps</a> method.
     */
    dwROP : UInt32

    /**
     * DirectDraw raster operations.
     */
    dwDDROP : UInt32

    /**
     * Rotation angle for the bitblt.
     */
    dwRotationAngle : UInt32

    /**
     * Z-buffer compares.
     */
    dwZBufferOpCode : UInt32

    /**
     * Low limit of a z-buffer.
     */
    dwZBufferLow : UInt32

    /**
     * High limit of a z-buffer.
     */
    dwZBufferHigh : UInt32

    /**
     * Destination base value of a z-buffer.
     */
    dwZBufferBaseDest : UInt32

    /**
     * Bit depth of the destination z-constant.
     */
    dwZDestConstBitDepth : UInt32

    dwZDestConst : UInt32

    /**
     * Bit depth of the source z-constant.
     */
    dwZSrcConstBitDepth : UInt32

    dwZSrcConst : UInt32

    /**
     * Bit depth of the constant for an alpha edge blend.
     */
    dwAlphaEdgeBlendBitDepth : UInt32

    /**
     * Alpha constant used for edge blending.
     */
    dwAlphaEdgeBlend : UInt32

    /**
     * Reserved
     */
    dwReserved : UInt32

    /**
     * Bit depth of the destination alpha constant.
     */
    dwAlphaDestConstBitDepth : UInt32

    dwAlphaDestConst : UInt32

    /**
     * Bit depth of the source alpha constant.
     */
    dwAlphaSrcConstBitDepth : UInt32

    dwAlphaSrcConst : UInt32

    dwFillColor : UInt32

    /**
     * Destination color key override.
     */
    ddckDestColorkey : DDCOLORKEY

    /**
     * Source color key override.
     */
    ddckSrcColorkey : DDCOLORKEY

    static __New() {
        DefineProp(this.Prototype, 'lpDDSZBufferDest', { type: IDirectDrawSurface, offset: 40 })
        DefineProp(this.Prototype, 'lpDDSZBufferSrc', { type: IDirectDrawSurface, offset: 56 })
        DefineProp(this.Prototype, 'lpDDSAlphaDest', { type: IDirectDrawSurface, offset: 80 })
        DefineProp(this.Prototype, 'lpDDSAlphaSrc', { type: IDirectDrawSurface, offset: 96 })
        DefineProp(this.Prototype, 'dwFillDepth', { type: UInt32, offset: 104 })
        DefineProp(this.Prototype, 'dwFillPixel', { type: UInt32, offset: 104 })
        DefineProp(this.Prototype, 'lpDDSPattern', { type: IDirectDrawSurface, offset: 104 })
        this.DeleteProp("__New")
    }
}
