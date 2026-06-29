#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DDPIXELFORMAT structure describes the pixel format of a DirectDrawSurface object for the IDirectDrawSurface7::GetPixelFormat method.
 * @remarks
 * The <b>dwAlphaBitDepth</b> member reflects the bit depth of an alpha-only pixel format (DDPF_ALPHA). For pixel formats that include the alpha component with color components (DDPF_ALPHAPIXELS), the alpha bit depth is obtained by counting the bits in the various mask members. The following code example returns the number of bits set in a given bitmask.
 * 
 * ```cpp
 * WORD GetNumberOfBits( DWORD dwMask )
 * {
 *     WORD wBits = 0;
 *     while( dwMask )
 *     {
 *         dwMask = dwMask & ( dwMask - 1 );  
 *         wBits++;
 *     }
 *     return wBits;
 * }
 * ```
 * 
 * The unions in <b>DDPIXELFORMAT</b> have been updated to work with compilers that do not support nameless unions. If your compiler does not support nameless unions, define the NONAMELESSUNION token before including the Ddraw.h header file.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/ns-ddraw-ddpixelformat
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDPIXELFORMAT {
    #StructPack 4


    struct _MultiSampleCaps {
        wFlipMSTypes : UInt16

        wBltMSTypes : UInt16

    }

    /**
     * Size of the structure, in bytes. This member must be initialized before the structure is used.
     */
    dwSize : UInt32

    /**
     * The following flags to describe optional controls for this structure.
     */
    dwFlags : UInt32

    /**
     * A FourCC code.
     */
    dwFourCC : UInt32

    dwRGBBitCount : UInt32

    dwRBitMask : UInt32

    dwGBitMask : UInt32

    dwBBitMask : UInt32

    dwRGBAlphaBitMask : UInt32

    static __New() {
        DefineProp(this.Prototype, 'dwYUVBitCount', { type: UInt32, offset: 12 })
        DefineProp(this.Prototype, 'dwZBufferBitDepth', { type: UInt32, offset: 12 })
        DefineProp(this.Prototype, 'dwAlphaBitDepth', { type: UInt32, offset: 12 })
        DefineProp(this.Prototype, 'dwLuminanceBitCount', { type: UInt32, offset: 12 })
        DefineProp(this.Prototype, 'dwBumpBitCount', { type: UInt32, offset: 12 })
        DefineProp(this.Prototype, 'dwPrivateFormatBitCount', { type: UInt32, offset: 12 })
        DefineProp(this.Prototype, 'dwYBitMask', { type: UInt32, offset: 16 })
        DefineProp(this.Prototype, 'dwStencilBitDepth', { type: UInt32, offset: 16 })
        DefineProp(this.Prototype, 'dwLuminanceBitMask', { type: UInt32, offset: 16 })
        DefineProp(this.Prototype, 'dwBumpDuBitMask', { type: UInt32, offset: 16 })
        DefineProp(this.Prototype, 'dwOperations', { type: UInt32, offset: 16 })
        DefineProp(this.Prototype, 'dwUBitMask', { type: UInt32, offset: 20 })
        DefineProp(this.Prototype, 'dwZBitMask', { type: UInt32, offset: 20 })
        DefineProp(this.Prototype, 'dwBumpDvBitMask', { type: UInt32, offset: 20 })
        DefineProp(this.Prototype, 'MultiSampleCaps', { type: DDPIXELFORMAT._MultiSampleCaps, offset: 20 })
        DefineProp(this.Prototype, 'dwVBitMask', { type: UInt32, offset: 24 })
        DefineProp(this.Prototype, 'dwStencilBitMask', { type: UInt32, offset: 24 })
        DefineProp(this.Prototype, 'dwBumpLuminanceBitMask', { type: UInt32, offset: 24 })
        DefineProp(this.Prototype, 'dwYUVAlphaBitMask', { type: UInt32, offset: 28 })
        DefineProp(this.Prototype, 'dwLuminanceAlphaBitMask', { type: UInt32, offset: 28 })
        DefineProp(this.Prototype, 'dwRGBZBitMask', { type: UInt32, offset: 28 })
        DefineProp(this.Prototype, 'dwYUVZBitMask', { type: UInt32, offset: 28 })
        this.DeleteProp("__New")
    }
}
