#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The VMR9Frequency structure describes the frequency of a video stream. Frequencies are described as ratios. For example, the NTSC frame rate of 29.97 fps is expressed as 30,000:1001.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ns-vmr9-vmr9frequency
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VMR9Frequency {
    #StructPack 4

    /**
     * Numerator of the frequency ratio.
     */
    dwNumerator : UInt32

    /**
     * Denominator of the frequency ratio.
     */
    dwDenominator : UInt32

}
