#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The VMRFrequency structure describes the frequency of a video stream. Frequencies are described as ratios. For example, the NTSC frame rate of 29.97 fps is expressed as 30,000:1001.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-vmrfrequency
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VMRFrequency {
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
