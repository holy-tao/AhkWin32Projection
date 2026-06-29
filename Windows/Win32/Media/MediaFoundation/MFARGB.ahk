#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes an ARGB color value.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mfargb
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFARGB {
    #StructPack 1

    /**
     * Blue value.
     */
    rgbBlue : Int8

    /**
     * Green value.
     */
    rgbGreen : Int8

    /**
     * Red value.
     */
    rgbRed : Int8

    /**
     * Alpha value.
     */
    rgbAlpha : Int8

}
