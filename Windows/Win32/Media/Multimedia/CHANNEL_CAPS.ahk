#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct CHANNEL_CAPS {
    #StructPack 4

    dwFlags : UInt32

    dwSrcRectXMod : UInt32

    dwSrcRectYMod : UInt32

    dwSrcRectWidthMod : UInt32

    dwSrcRectHeightMod : UInt32

    dwDstRectXMod : UInt32

    dwDstRectYMod : UInt32

    dwDstRectWidthMod : UInt32

    dwDstRectHeightMod : UInt32

}
