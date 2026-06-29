#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDNONLOCALVIDMEMCAPS {
    #StructPack 4

    dwSize : UInt32

    dwNLVBCaps : UInt32

    dwNLVBCaps2 : UInt32

    dwNLVBCKeyCaps : UInt32

    dwNLVBFXCaps : UInt32

    dwNLVBRops : UInt32[8]

}
