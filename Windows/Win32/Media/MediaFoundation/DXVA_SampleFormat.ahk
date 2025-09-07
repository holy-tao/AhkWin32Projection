#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA_SampleFormat{

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_SampleFormatMask => 255

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_SampleUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_SamplePreviousFrame => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_SampleProgressiveFrame => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_SampleFieldInterleavedEvenFirst => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_SampleFieldInterleavedOddFirst => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_SampleFieldSingleEven => 5

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_SampleFieldSingleOdd => 6

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_SampleSubStream => 7
}
