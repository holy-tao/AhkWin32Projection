#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines a video frequency.
 * @remarks
 * The value 0/0 indicates an unknown frequency. Values of the form <i>n</i>/0, where <i>n</i> is not zero, are invalid. Values of the form 0/<i>n</i>, where <i>n</i> is not zero, indicate a frequency of zero.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/ns-dxva2api-dxva2_frequency
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA2_Frequency {
    #StructPack 4

    /**
     * Numerator of the frequency.
     */
    Numerator : UInt32

    /**
     * Denominator of the frequency.
     */
    Denominator : UInt32

}
