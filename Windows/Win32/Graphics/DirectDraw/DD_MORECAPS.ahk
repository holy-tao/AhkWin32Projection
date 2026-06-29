#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_MORECAPS {
    #StructPack 4

    dwSize : UInt32

    dwAlphaCaps : UInt32

    dwSVBAlphaCaps : UInt32

    dwVSBAlphaCaps : UInt32

    dwSSBAlphaCaps : UInt32

    dwFilterCaps : UInt32

    dwSVBFilterCaps : UInt32

    dwVSBFilterCaps : UInt32

    dwSSBFilterCaps : UInt32

}
