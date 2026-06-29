#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DPRIMCAPS {
    #StructPack 4

    dwSize : UInt32

    dwMiscCaps : UInt32

    dwRasterCaps : UInt32

    dwZCmpCaps : UInt32

    dwSrcBlendCaps : UInt32

    dwDestBlendCaps : UInt32

    dwAlphaCmpCaps : UInt32

    dwShadeCaps : UInt32

    dwTextureCaps : UInt32

    dwTextureFilterCaps : UInt32

    dwTextureBlendCaps : UInt32

    dwTextureAddressCaps : UInt32

    dwStippleWidth : UInt32

    dwStippleHeight : UInt32

}
