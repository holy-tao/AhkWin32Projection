#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a ratio.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mfratio
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFRatio {
    #StructPack 4

    /**
     * Numerator of the ratio.
     */
    Numerator : UInt32

    /**
     * Denominator of the ratio.
     */
    Denominator : UInt32

}
