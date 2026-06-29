#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_SampleFormat {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
