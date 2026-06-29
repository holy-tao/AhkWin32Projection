#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a 4:4:4:4 Y'Cb'Cr' sample.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mfayuvsample
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFAYUVSample {
    #StructPack 1

    /**
     * Cr (chroma difference) value.
     */
    bCrValue : Int8

    /**
     * Cb (chroma difference) value.
     */
    bCbValue : Int8

    /**
     * Y (luma) value.
     */
    bYValue : Int8

    /**
     * Alpha value.
     */
    bSampleAlpha8 : Int8

}
