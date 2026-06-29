#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines a 16-bit AYUV pixel value.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/ns-dxva2api-dxva2_ayuvsample16
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA2_AYUVSample16 {
    #StructPack 2

    /**
     * Contains the Cr chroma value (also called V).
     */
    Cr : UInt16

    /**
     * Contains the Cb chroma value (also called U).
     */
    Cb : UInt16

    /**
     * Contains the luma value.
     */
    Y : UInt16

    /**
     * Contains the alpha value.
     */
    Alpha : UInt16

}
