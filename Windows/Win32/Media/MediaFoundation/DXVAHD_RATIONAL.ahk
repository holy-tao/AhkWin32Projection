#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a rational number (ratio).
 * @remarks
 * Values of the form 0/<i>n</i> are interpreted as zero. The value 0/0 is interpreted as zero.  However, these values are not necessarily valid in all contexts.
 * 
 * Values of the form <i>n</i>/0, where <i>n</i> is nonzero, are invalid.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_rational
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAHD_RATIONAL {
    #StructPack 4

    /**
     * The numerator of the ratio.
     */
    Numerator : UInt32

    /**
     * The denominator of the ratio.
     */
    Denominator : UInt32

}
