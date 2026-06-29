#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IDirectDrawSurface.ahk" { IDirectDrawSurface }
#Import ".\DDCOLORKEY.ahk" { DDCOLORKEY }

/**
 * The DDOVERLAYFX structure passes overlay information to the IDirectDrawSurface7::UpdateOverlay method.
 * @remarks
 * The unions in this structure have been updated to work with compilers that do not support nameless unions. If your compiler does not support nameless unions, define the NONAMELESSUNION token before including the Ddraw.h header file.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/ns-ddraw-ddoverlayfx
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDOVERLAYFX {
    #StructPack 8

    /**
     * Size of the structure, in bytes. This member must be initialized before the structure is used.
     */
    dwSize : UInt32

    /**
     * Bit depth used to specify the constant for an alpha edge blend.
     */
    dwAlphaEdgeBlendBitDepth : UInt32

    /**
     * Constant to use as the alpha for an edge blend.
     */
    dwAlphaEdgeBlend : UInt32

    /**
     * Reserved
     */
    dwReserved : UInt32

    /**
     * Bit depth used to specify the alpha constant for a destination.
     */
    dwAlphaDestConstBitDepth : UInt32

    dwAlphaDestConst : UInt32

    /**
     * Bit depth used to specify the alpha constant for a source.
     */
    dwAlphaSrcConstBitDepth : UInt32

    dwAlphaSrcConst : UInt32

    /**
     * Destination color key for the overlay.
     */
    dckDestColorkey : DDCOLORKEY

    /**
     * Source color key for the overlay.
     */
    dckSrcColorkey : DDCOLORKEY

    /**
     * The following flags that specify overlay effects.
     */
    dwDDFX : UInt32

    /**
     * Currently not used and must be set to 0.
     */
    dwFlags : UInt32

    static __New() {
        DefineProp(this.Prototype, 'lpDDSAlphaDest', { type: IDirectDrawSurface, offset: 24 })
        DefineProp(this.Prototype, 'lpDDSAlphaSrc', { type: IDirectDrawSurface, offset: 40 })
        this.DeleteProp("__New")
    }
}
