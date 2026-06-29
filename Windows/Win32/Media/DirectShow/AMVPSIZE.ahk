#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AMVPSIZE structure specifies the width and height for a VP image.
 * @remarks
 * The context could be anything such as scaling, cropping, and so on.
 * @see https://learn.microsoft.com/windows/win32/api/vptype/ns-vptype-amvpsize
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AMVPSIZE {
    #StructPack 4

    /**
     * Width, in pixels.
     */
    dwWidth : UInt32

    /**
     * Height.
     */
    dwHeight : UInt32

}
