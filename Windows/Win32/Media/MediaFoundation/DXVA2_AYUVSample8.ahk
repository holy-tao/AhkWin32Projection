#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines an 8-bit AYUV pixel value.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/ns-dxva2api-dxva2_ayuvsample8
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA2_AYUVSample8 {
    #StructPack 1

    /**
     * Contains the Cr chroma value (also called V).
     */
    Cr : Int8

    /**
     * Contains the Cb chroma value (also called U).
     */
    Cb : Int8

    /**
     * Contains the luma value.
     */
    Y : Int8

    /**
     * Contains the alpha value.
     */
    Alpha : Int8

}
